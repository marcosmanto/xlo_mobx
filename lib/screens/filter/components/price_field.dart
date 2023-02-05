import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  const PriceField({
    super.key,
    required this.label,
    required this.onChanged,
    this.initialValue,
    this.enabled = true,
  });

  final String label;
  final Function(int?) onChanged;
  final int? initialValue;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        enabled: enabled,
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
        style: TextStyle(
          color: enabled ? null : Colors.grey,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter()
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }
}
