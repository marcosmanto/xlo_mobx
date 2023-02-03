import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/filter/components/section_title.dart';

class OrderByField extends StatelessWidget {
  const OrderByField({super.key});

  Widget buildOption(String title, {required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      alignment: Alignment.center,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Ordernar por'),
        Row(
          children: [
            buildOption('Data', context: context),
            const SizedBox(width: 12),
            buildOption('Preço', context: context),
          ],
        ),
      ],
    );
  }
}
