import 'package:flutter/material.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final bool dotIndicator;
  final int? number;
  final Color backgroundColor;
  final Color textColor;
  const StatusBadge({
    super.key,
    required this.label,
    required this.dotIndicator,
    this.number,
    required this.backgroundColor, required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppRadius.largeRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dotIndicator)
            Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                color: textColor,
                shape: BoxShape.circle,
              ),
            ),
          Text(
            number != null ? "$number $label" : label,
            style: AppText.label.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
