import 'package:flutter/material.dart';

import 'bar_button.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BarButton(
          onTap: () {},
          label: 'Categorias',
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.white12, width: .7),
              bottom: BorderSide(color: Colors.white54, width: 1.5),
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
  }
}
