import 'package:flutter/material.dart';

class OptionToggle extends StatelessWidget {
  const OptionToggle({
    super.key,
    required this.title,
    required this.onTap,
    required this.activeCondition,
    this.enabled = true,
  });

  final void Function()? onTap;
  final String title;
  final bool activeCondition;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          alignment: Alignment.center,
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
                color: activeCondition && enabled
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey),
            borderRadius: BorderRadius.circular(25),
            color: activeCondition
                ? enabled
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[500]
                : Colors.transparent,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: activeCondition ? Colors.white : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
