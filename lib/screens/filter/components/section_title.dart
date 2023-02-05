import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.enabled = true,
  });

  final String title;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          color: enabled
              ? Theme.of(context).colorScheme.primary
              : Colors.grey[400],
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
