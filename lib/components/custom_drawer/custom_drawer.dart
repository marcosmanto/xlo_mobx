import 'package:flutter/material.dart';

import 'custom_drawer_header.dart';
import 'page_section.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(45),
      ),
      child: SizedBox(
        width: size.width * .65,
        child: Drawer(
          child: ListView(
            children: [
              CustomDrawerHeader(),
              PageSection(),
            ],
          ),
        ),
      ),
    );
  }
}
