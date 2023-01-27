import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import '../../components/custom_drawer/custom_drawer.dart';
import '../../stores/create_store.dart';

import 'components/category_field.dart';
import 'components/images_field.dart';

class CreateScreen extends StatelessWidget {
  CreateScreen({super.key});

  //final CreateStore createStore = CreateStore();
  final CreateStore createStore = GetIt.I<CreateStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Criar anúncio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
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
                  labelText: 'Título',
                  isRequired: true,
                  decreaseWidth: 12,
                ),
                AdFormField(
                  labelText: 'Descrição',
                  isRequired: true,
                  decreaseWidth: 12,
                  expandable: true,
                  maxHeight: 149,
                ),
                CategoryField(createStore),
                AdFormField(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdFormField extends StatelessWidget {
  const AdFormField({
    super.key,
    required this.labelText,
    this.expandable = false,
    this.maxHeight = 100,
    this.minHeight = 60,
    this.isRequired = false,
    this.marginBottom = 8,
    this.decreaseWidth = 10,
    this.prefixText,
    this.inputFormatters,
    this.keyboardType,
  });

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: decreaseWidth),
      margin: EdgeInsets.only(bottom: marginBottom),
      child: TextFormField(
        maxLines: expandable ? null : 1,
        decoration: InputDecoration(
          labelText: '$labelText${isRequired ? ' *' : ''}',
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: EdgeInsets.fromLTRB(0, 0, 12, 0),
          constraints:
              BoxConstraints(minHeight: minHeight, maxHeight: maxHeight),
          prefixText: prefixText,
          prefixStyle: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
      ),
    );
  }
}
