import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return Container();
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Colors.red[700],
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 8,
        ),
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 2, right: 8),
              child: Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 35,
              ),
            ),
            Expanded(
              child: Text(
                'Oops! $message. Por favor, tente novamente.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
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
