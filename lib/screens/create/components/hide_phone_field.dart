import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/stores/create_store.dart';

class HidePhoneField extends StatelessWidget {
  const HidePhoneField(this.createStore, {super.key});

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Observer(
        builder: (_) {
          return Row(
            children: [
              Checkbox(
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return createStore.loading
                        ? Colors.grey.shade400
                        : Colors.grey;
                  }
                  return createStore.loading
                      ? Colors.grey.shade400
                      : Theme.of(context).colorScheme.primary;
                }),
                value: createStore.hidePhone,
                onChanged: (value) => createStore.setHidePhone(value ?? false),
              ),
              Flexible(
                child: TextButton(
                  onPressed: () =>
                      createStore.setHidePhone(!createStore.hidePhone),
                  style: TextButton.styleFrom(
                    foregroundColor: createStore.hidePhone
                        ? createStore.loading
                            ? Colors.grey.shade400
                            : Theme.of(context).colorScheme.primary
                        : createStore.loading
                            ? Colors.grey.shade400
                            : Colors.grey,
                  ),
                  child: Text('Ocultar o meu telefone neste anúncio'),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
