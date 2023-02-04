import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  const PriceField({
    super.key,
    required this.label,
    required this.onChanged,
    this.initialValue,
  });

  final String label;
  final Function(int?) onChanged;
  final int? initialValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        initialValue: initialValue?.toString(),
        onChanged: (text) {
          onChanged(int.tryParse(text.replaceAll('.', '')));
        },
        decoration: InputDecoration(
            labelText: label,
            prefixText: 'R\$ ',
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
            counterText: ''),
        maxLength: 9,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter()
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }
}
