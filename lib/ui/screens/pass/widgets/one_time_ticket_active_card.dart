import 'package:flutter/material.dart';
import 'package:velotoulouse/models/user_subscription.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class OneTimeTicketActiveCard extends StatelessWidget {
  const OneTimeTicketActiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 42),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Current Pass',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                PassType.oneTimeTicket.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Active',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryDark,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
