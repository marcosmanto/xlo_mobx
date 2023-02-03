import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/stores/home_store.dart';
import '../../components/custom_drawer/custom_drawer.dart';
import 'components/search_dialog.dart';
import 'components/top_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeStore homeStore = GetIt.I<HomeStore>();

  openSearch(BuildContext context) async {
    final String? search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(homeStore.search),
    );
    if (search != null) {
      homeStore.setSearch(search);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: (() {
            if (homeStore.search == null || homeStore.search!.isEmpty) {
              return Container();
            }
            return GestureDetector(
                onTap: () => openSearch(context),
                child: LayoutBuilder(builder: (_, constraints) {
                  return SizedBox(
                    width: constraints.biggest.width,
                    child: Text(homeStore.search!),
                  );
                }));
          })(),
          actions: [
            homeStore.search == null || homeStore.search!.isEmpty
                ? IconButton(
                    onPressed: () {
                      openSearch(context);
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      homeStore.setSearch(null);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  )
          ],
        ),
        body: Column(children: [
          TopBar(),
        ]),
      );
    });
  }
}
