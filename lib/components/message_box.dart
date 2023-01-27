import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({
    super.key,
    this.message,
    this.margin = const EdgeInsets.only(bottom: 8),
    this.icon = Icons.error_outline,
    this.backgroundColor = const Color(0xFFD32F2F),
    this.isError = true,
    this.borderRadius = 16.0,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 6,
      vertical: 8,
    ),
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.iconSize = 35.0,
  });

  final String? message;
  final EdgeInsets margin;
  final IconData icon;
  final double iconSize;
  final Color backgroundColor;
  final bool isError;
  final double borderRadius;
  final EdgeInsets padding;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return Container();
    } else {
      return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 8,
        ),
        margin: margin,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 2, right: 8),
              child: Icon(
                icon,
                color: Colors.white,
                size: iconSize,
              ),
            ),
            Expanded(
              child: Text(
                isError
                    ? 'Oops! $message. Por favor, tente novamente.'
                    : '$message',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: fontWeight,
                  height: 1.35,
                  letterSpacing: .5,
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
