import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/option_toggle.dart';
import 'package:xlo_mobx/screens/filter/components/section_title.dart';
import 'package:xlo_mobx/stores/filter_store.dart';

class OrderByField extends StatelessWidget {
  const OrderByField({
    super.key,
    required this.store,
    this.enabled = true,
  });

  final FilterStore store;
  final bool enabled;

  /*Widget buildOption(String title, OrderBy option,
      {required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        store.setOrderBy(option);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        alignment: Alignment.center,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(
              color: store.orderBy == option
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey),
          borderRadius: BorderRadius.circular(25),
          color: store.orderBy == option
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: store.orderBy == option ? Colors.white : Colors.grey[600],
          ),
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: 'Ordernar por',
            enabled: enabled,
          ),
          Row(
            children: [
              OptionToggle(
                title: 'Data',
                onTap: enabled ? () => store.setOrderBy(OrderBy.date) : null,
                activeCondition: store.orderBy == OrderBy.date,
                enabled: enabled,
              ),
              //buildOption('Data', OrderBy.date, context: context),
              const SizedBox(width: 12),
              OptionToggle(
                title: 'Preço',
                onTap: enabled ? () => store.setOrderBy(OrderBy.price) : null,
                activeCondition: store.orderBy == OrderBy.price,
                enabled: enabled,
              ),
              //buildOption('Preço', OrderBy.price, context: context),
            ],
          ),
        ],
      );
    });
  }
}
