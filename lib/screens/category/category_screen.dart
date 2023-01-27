import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/error_box.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/stores/category_store.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({
    super.key,
    this.selected,
    this.showAll = true,
  });

  final Category? selected;
  final bool showAll;

  final CategoryStore categoryStore = GetIt.I<CategoryStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          child: Observer(builder: (_) {
            if (categoryStore.error != null) {
              return ErrorBox(message: categoryStore.error);
            } else if (categoryStore.categoryList.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              final categories = showAll
                  ? categoryStore.allCategoryList
                  : categoryStore.categoryList;
              return ListView.separated(
                itemCount: categories.length,
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop(category.description);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      color: category.id == selected?.id
                          ? Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.25)
                          : null,
                      child: Text(
                        category.description,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
