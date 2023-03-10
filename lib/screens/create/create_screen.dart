import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/components/message_box.dart';
import 'package:xlo_mobx/main.dart';
import 'package:xlo_mobx/stores/cep_store.dart';
import 'package:xlo_mobx/stores/page_store.dart';
import '../../components/custom_drawer/custom_drawer.dart';
import '../../stores/create_store.dart';

import 'components/category_field.dart';
import 'components/hide_phone_field.dart';
import 'components/images_field.dart';

class CreateScreen extends StatefulWidget {
  CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  //final CreateStore createStore = CreateStore();
  final CreateStore createStore = GetIt.I<CreateStore>();
  late final CepStore cepStore;
  bool formIsValid = false;
  late final Dispose _disposerLoading;
  late final ReactionDisposer _disposerFormValid;

  @override
  void initState() {
    super.initState();
    cepStore = createStore.cepStore;

    _disposerFormValid = reaction((_) => createStore.formValid, (formValid) {
      setState(() {});
    });

    // when run only once and has auto dispose
    when((_) => createStore.savedAd, () {
      GetIt.I<PageStore>().setPage(0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _disposerLoading();
    _disposerFormValid();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return WillPopScope(
          onWillPop: createStore.loading
              ? () async {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Por favor aguarde o processo de criação do anúncio terminar'),
                  ));
                  return false;
                }
              : null,
          child: Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title:
                  createStore.loading ? Text('Aguarde') : Text('Criar anúncio'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                margin: EdgeInsets.symmetric(horizontal: 32),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ImagesField(createStore),
                      AdFormField(
                        enabled: !createStore.loading,
                        onChanged: createStore.setTitle,
                        labelText: 'Título',
                        isRequired: true,
                        decreaseWidth: 12,
                        errorText: createStore.titleError,
                      ),
                      AdFormField(
                        enabled: !createStore.loading,
                        onChanged: createStore.setDescription,
                        labelText: 'Descrição',
                        isRequired: true,
                        decreaseWidth: 12,
                        expandable: true,
                        maxHeight: 149,
                        errorText: createStore.descriptionError,
                      ),
                      CategoryField(createStore),
                      AdFormField(
                        enabled: !createStore.loading,
                        onChanged: cepStore.setCep,
                        labelText: 'CEP',
                        isRequired: true,
                        decreaseWidth: 12,
                        expandable: false,
                        maxHeight: 149,
                        maxLength: 10,
                        errorText: createStore.addressError,
                        keyboardType: TextInputType.numberWithOptions(),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CepInputFormatter(),
                        ],
                        child: () {
                          if (cepStore.address == null &&
                              cepStore.error == null &&
                              !cepStore.loading) {
                            return Container();
                          } else if (cepStore.address == null &&
                              cepStore.error == null) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: LinearProgressIndicator(),
                            );
                          } else if (cepStore.error != null) {
                            return MessageBox(
                              message: cepStore.error,
                            );
                          } else {
                            final a = cepStore.address;
                            return Transform.translate(
                              offset: Offset(0, -20),
                              child: MessageBox(
                                message:
                                    '${a!.district}, ${a.city.name}/${a.uf.initials}',
                                backgroundColor: createStore.loading
                                    ? Colors.grey.shade400
                                    : Theme.of(context).colorScheme.primary,
                                iconSize: 20,
                                icon: Icons.location_pin,
                                isError: false,
                                borderRadius: 32,
                                fontWeight: FontWeight.bold,
                                margin: const EdgeInsets.only(left: 10),
                                padding: EdgeInsets.zero,
                              ),
                            );
                          }
                        }(),
                      ),
                      AdFormField(
                        enabled: !createStore.loading,
                        onChanged: createStore.setPrice,
                        errorText: createStore.priceError,
                        labelText: 'Preço',
                        isRequired: true,
                        decreaseWidth: 12,
                        prefixText: 'R\$ ',
                        keyboardType: TextInputType.numberWithOptions(),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CentavosInputFormatter()
                        ],
                      ),
                      HidePhoneField(createStore),
                      if (createStore.error != null)
                        MessageBox(
                          message: createStore.error,
                        ),
                      LayoutBuilder(
                        builder: (context, constraints) => Container(
                          alignment: Alignment.center,
                          height: 40,
                          margin: EdgeInsets.only(top: 8, bottom: 4),
                          child: createStore.loading
                              ? Transform.translate(
                                  offset: Offset(0, -9),
                                  child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(
                                      strokeWidth: gCircularProgressStrokeWidh,
                                    ),
                                  ),
                                )
                              : ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minWidth: constraints.maxWidth),
                                  child: GestureDetector(
                                    onTap: createStore.invalidSendPressed,
                                    child: ElevatedButton(
                                      onPressed: createStore.sendPressed,
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: createStore.loading
                                            ? Colors.transparent
                                            : Theme.of(context)
                                                .colorScheme
                                                .primary,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Text('ENVIAR'),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AdFormField extends StatelessWidget {
  const AdFormField({
    super.key,
    required this.labelText,
    this.enabled = true,
    this.expandable = false,
    this.maxHeight = 100,
    this.minHeight = 60,
    this.isRequired = false,
    this.marginBottom = 8,
    this.decreaseWidth = 10,
    this.prefixText,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.onChanged,
    this.child,
    this.errorText,
  });

  final bool enabled;
  final bool expandable;
  final bool isRequired;
  final String labelText;
  final double marginBottom;
  final double decreaseWidth;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final double maxHeight;
  final double minHeight;
  final int? maxLength;
  final void Function(String)? onChanged;
  final Widget? child;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final CreateStore createStore = GetIt.I<CreateStore>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: decreaseWidth),
          margin: EdgeInsets.only(bottom: marginBottom),
          child: TextFormField(
            enabled: enabled,
            onChanged: onChanged,
            maxLength: maxLength,
            maxLines: expandable ? null : 1,
            decoration: InputDecoration(
              errorText: errorText,
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 15.68,
                fontWeight: FontWeight.bold,
                letterSpacing: .15,
              ),
              labelText: '$labelText${isRequired ? ' *' : ''}',
              labelStyle: TextStyle(
                color: createStore.loading ? Colors.grey[400] : Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              contentPadding: EdgeInsets.fromLTRB(0, 0, 12, 0),
              constraints:
                  BoxConstraints(minHeight: minHeight, maxHeight: maxHeight),
              prefixText: prefixText,
              prefixStyle: TextStyle(
                fontSize: 16,
                color: createStore.loading
                    ? Colors.grey[400]
                    : Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: createStore.loading ? Colors.grey[400] : null,
            ),
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
          ),
        ),
        if (child != null) child!
      ],
    );
  }
}
