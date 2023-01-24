import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.textColor,
  });

  final String title;
  final String subtitle;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 4, right: 0, left: 3),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        alignment: WrapAlignment.spaceBetween,
        spacing: 10,
        children: [
          Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.grey[800],
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              height: 1.46,
            ),
          )
        ],
      ),
    );
  }
}
