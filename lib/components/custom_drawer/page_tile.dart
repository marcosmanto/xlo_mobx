import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  const PageTile({
    super.key,
    required this.label,
    required this.iconData,
    required this.onTap,
    required this.highlighted,
  });

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final color = highlighted ? Colors.purple : Colors.black54;
    return ListTile(
      title: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w700),
      ),
      leading: Icon(
        iconData,
        color: color,
      ),
      onTap: onTap,
    );
  }
}
