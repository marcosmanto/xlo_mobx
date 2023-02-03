import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/screens/category/category_screen.dart';
import 'package:xlo_mobx/stores/home_store.dart';

import 'bar_button.dart';

class TopBar extends StatelessWidget {
  TopBar({super.key});

  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Row(
          children: [
            BarButton(
              onTap: () async {
                final category = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CategoryScreen(
                      showAll: true,
                      selected: homeStore.category,
                    ),
                  ),
                );

                if (category != null) {
                  homeStore.setCategory(category);
                }
              },
              label: homeStore.category?.description ?? 'Categorias',
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white12, width: .7),
                  bottom: homeStore.category != null
                      ? BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 3)
                      : BorderSide(color: Colors.white54, width: 1.5),
                ),
              ),
            ),
            BarButton(
              onTap: () {},
              label: 'Filtros',
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white12, width: .7),
                  bottom: BorderSide(color: Colors.white54, width: 1.5),
                  left: BorderSide(color: Colors.white54, width: .5),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
