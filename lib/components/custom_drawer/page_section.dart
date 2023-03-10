import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../stores/page_store.dart';
import 'page_tile.dart';

class PageSection extends StatelessWidget {
  PageSection({super.key});

  final pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () => pageStore.setPage(0),
          highlighted: pageStore.page == 0,
        ),
        PageTile(
          label: 'Inserir anúncio',
          iconData: Icons.edit,
          onTap: () => pageStore.setPage(1),
          highlighted: pageStore.page == 1,
        ),
        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () => pageStore.setPage(2),
          highlighted: pageStore.page == 2,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () => pageStore.setPage(3),
          highlighted: pageStore.page == 3,
        ),
        PageTile(
          label: 'Minha conta',
          iconData: Icons.person,
          onTap: () => pageStore.setPage(4),
          highlighted: pageStore.page == 4,
        ),
      ],
    );
  }
}
