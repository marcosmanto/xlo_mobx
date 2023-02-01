// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  SearchDialog([this.currentSearch])
      : _searchController = TextEditingController(text: currentSearch);

  final String? currentSearch;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 4,
          left: 5,
          right: 5,
          child: Card(
            child: TextField(
              controller: _searchController,
              style: TextStyle(
                fontSize: 22,
              ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: _searchController.clear,
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.primary,
                    size: 25,
                  ),
                ),
                prefixIcon: IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 5,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(.25),
                  ),
                ),
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              textInputAction: TextInputAction.search,
              autofocus: true,
              onSubmitted: (text) {
                Navigator.of(context).pop(text);
              },
            ),
          ),
        )
      ],
    );
  }
}
