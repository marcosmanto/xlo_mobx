import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  const BarButton({
    super.key,
    required this.label,
    required this.decoration,
    required this.onTap,
  });

  final String label;
  final BoxDecoration decoration;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          decoration: decoration,
          height: 40,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.6,
            ),
          ),
        ),
      ),
    );
  }
}
