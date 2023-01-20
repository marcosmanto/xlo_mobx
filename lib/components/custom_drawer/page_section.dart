import 'package:flutter/material.dart';

import 'page_tile.dart';

class PageSection extends StatelessWidget {
  const PageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {},
          highlighted: true,
        ),
        PageTile(
          label: 'Inserir anúncio',
          iconData: Icons.edit,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
          label: 'Minha conta',
          iconData: Icons.person,
          onTap: () {},
          highlighted: false,
        ),
      ],
    );
  }
}
