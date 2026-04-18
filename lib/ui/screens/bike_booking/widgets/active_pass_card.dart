import 'package:flutter/material.dart';
import 'package:velotoulouse/models/user_subscription.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class ActivePassCard extends StatelessWidget {
  final UserSubscription userSubscription;
  const ActivePassCard({super.key, required this.userSubscription});

  @override
  Widget build(BuildContext context) {
    final expiryDate = userSubscription.expirationDate;
    final isOneTimeTicket = userSubscription.passType == PassType.oneTimeTicket;

    String subtitle;
    if (isOneTimeTicket) {
      subtitle = 'Single use';
    } else {
      final day = expiryDate!.day.toString().padLeft(2, '0');
      final month = expiryDate.month.toString().padLeft(2, '0');
      final year = expiryDate.year.toString();
      subtitle = 'Expires on : $day / $month / $year';
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: AppRadius.largeRadius,
        border: Border.all(color: AppColors.primaryDark),
      ),
      child: ListTile(
        title: Text(
          '${userSubscription.passType.title} pass',
          style: AppText.h3Bold.copyWith(color: AppColors.grey900),
        ),
        subtitle: Text(
          subtitle,
          style: AppText.label.copyWith(color: AppColors.grey900),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppRadius.largeRadius,
          ),
          child: Text(
            'Active',
            style: AppText.label.copyWith(color: AppColors.primaryDark),
          ),
        ),
      ),
    );
  }
}
