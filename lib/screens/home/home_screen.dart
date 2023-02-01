import 'package:flutter/material.dart';
import '../../components/custom_drawer/custom_drawer.dart';
import 'components/search_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  openSearch(BuildContext context) async {
    final String search = await showDialog(
      context: context,
      builder: (_) => SearchDialog('Banana'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              openSearch(context);
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
