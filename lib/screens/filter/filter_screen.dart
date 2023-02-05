import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/main.dart';
import 'package:xlo_mobx/stores/filter_store.dart';

import 'components/order_by_field.dart';
import 'components/price_range_field.dart';
import 'components/vendor_type_field.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final FilterStore filterStore = FilterStore();
  late final Dispose _disposerLoading;
  late final ReactionDisposer _disposerFormValid;

  @override
  void initState() {
    _disposerFormValid = reaction((_) => filterStore.formValid, (formValid) {
      setState(() {});
    });

    _disposerLoading = reaction((_) => filterStore.loading, (loading) {
      if (loading == false) {
        //Hide immediately snackbar if there is one
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }
    });

    // when run only once and has auto dispose
    when((_) => filterStore.filterApplied, () {
      Navigator.of(context).pop();
    });

    super.initState();
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
          onWillPop: filterStore.loading
              ? () async {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Por favor aguarde os filtros serem aplicados.'),
                  ));
                  return false;
                }
              : null,
          child: Scaffold(
            appBar: AppBar(
              title:
                  filterStore.loading ? Text('Aguarde') : Text('Filtrar busca'),
              centerTitle: true,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(filterStore.filterApplied.toString()),
                        OrderByField(
                          store: filterStore,
                          enabled: !filterStore.loading,
                        ),
                        PriceRangeField(
                          store: filterStore,
                          enabled: !filterStore.loading,
                        ),
                        VendorTypeField(
                          store: filterStore,
                          enabled: !filterStore.loading,
                        ),
                        const SizedBox(height: 28),
                        LayoutBuilder(
                          builder: (context, constraints) => Container(
                            alignment: Alignment.center,
                            height: 40,
                            margin: EdgeInsets.only(top: 8, bottom: 4),
                            child: filterStore.loading
                                ? Transform.translate(
                                    offset: Offset(0, -9),
                                    child: SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(
                                        strokeWidth:
                                            gCircularProgressStrokeWidh,
                                      ),
                                    ),
                                  )
                                : ConstrainedBox(
                                    constraints: BoxConstraints(
                                        minWidth: constraints.maxWidth),
                                    child: GestureDetector(
                                      onTap: filterStore.invalidSendPressed,
                                      child: ElevatedButton(
                                        onPressed: filterStore.sendPressed,
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: filterStore.loading
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
                                        child: Text('FILTRAR'),
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
          ),
        );
      },
    );
  }
}
