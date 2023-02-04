import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/filter/components/price_field.dart';
import 'package:xlo_mobx/screens/filter/components/section_title.dart';
import 'package:xlo_mobx/stores/filter_store.dart';

class PriceRangeField extends StatelessWidget {
  const PriceRangeField({super.key, required this.store});

  final FilterStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Preço'),
        Row(
          children: [
            PriceField(
              onChanged: store.setMinPrice,
              label: 'Min',
              initialValue: store.minPrice,
            ),
            const SizedBox(width: 12),
            PriceField(
              onChanged: store.setMaxPrice,
              label: 'Max',
              initialValue: store.maxPrice,
            ),
          ],
        ),
        Observer(
          builder: (_) {
            if (store.priceError != null) {
              return Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  store.priceError!,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.68,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .15,
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}
