import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

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
    this.maxHeight,
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
  final double? maxHeight;

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
          constraints: BoxConstraints.tightFor(height: maxHeight),
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