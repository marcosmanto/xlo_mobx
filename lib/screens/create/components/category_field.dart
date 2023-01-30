import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/category/category_screen.dart';

import '../../../stores/create_store.dart';

class CategoryField extends StatelessWidget {
  const CategoryField(this.createStore, {super.key});

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.only(bottom: 5),
        constraints: BoxConstraints(minHeight: 40),
        alignment: Alignment.topLeft,
        //color: Colors.pink,
        //height: 40,
        child: InkWell(
          onTap: () async {
            FocusScope.of(context).unfocus();
            final category = await showDialog(
              context: context,
              builder: (_) => CategoryScreen(
                showAll: false,
                selected: createStore.category,
              ),
            );
            if (category != null) {
              createStore.setCategory(category);
            }
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categoria *',
                    style: createStore.category == null
                        ? TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                    size: 28,
                  ),
                ],
              ),
              if (createStore.category != null)
                Container(
                    alignment: Alignment.centerLeft,
                    child: Chip(
                      labelPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 2,
                      ),
                      onDeleted: () {
                        createStore.clearCategory();
                      },
                      deleteIcon: Icon(
                        Icons.remove_circle,
                        color: Colors.white,
                        size: 25,
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      label: Text(
                        createStore.category!.description,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    /*Text(
                      createStore.category!.description,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),*/
                    ),
              if (createStore.categoryError != null)
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      createStore.categoryError!,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15.68,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .15,
                      ),
                    ))
            ],
          ),
        ),
      );
    });
  }
}
