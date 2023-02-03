import 'package:flutter/material.dart';
import 'package:xlo_mobx/stores/filter_store.dart';

import 'components/order_by_field.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  final FilterStore filterStore = FilterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtrar busca'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          margin: EdgeInsets.symmetric(horizontal: 32),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OrderByField(
                  store: filterStore,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
