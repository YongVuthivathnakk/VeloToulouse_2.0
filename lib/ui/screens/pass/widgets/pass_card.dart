import 'package:flutter/material.dart';
import 'package:velotoulouse/models/user_subscription.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class PassCard extends StatelessWidget {
  final PassType pass;
  final VoidCallback onChoose;
  final bool isCurrentPass;
  final bool isLoading;

  const PassCard({
    super.key, 
    required this.pass, 
    required this.onChoose,
    this.isCurrentPass = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.mdR,
        border: Border.all(
          color: isCurrentPass ? AppColors.primaryDark : AppColors.grey300,
          width: isCurrentPass ? 2 : 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title, subtitle, and badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pass.title,
                        style: AppText.h1,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        pass.subtitle,
                        style: const TextStyle(fontSize: 13, color: AppColors.grey500),
                      ),
                    ],
                  ),
                ),
                if (isCurrentPass)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Currently Using',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 20),

            // Price 
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  pass.formattedPrice,
                  style: AppText.h1
                ),
                const SizedBox(width: 4),
                Text(
                  pass.priceSuffix,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.grey500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Description 
            Text(
              pass.description,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.grey900,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 16),
            const Divider(color: Color(0xFFEEEEEE)),
            const SizedBox(height: 12),

            // Features 
            ...pass.benefits.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryDark,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 13,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        feature,
                        style: const TextStyle(
                          fontSize: 13.5,
                          color: AppColors.grey900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Divider( color: AppColors.grey50),
            const SizedBox(height: 12),

            // Footer note 
            Text(
              pass.footerNote,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.grey500,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 16),

            // button 
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (isCurrentPass || isLoading) ? null : onChoose,
                style: ElevatedButton.styleFrom(
                  backgroundColor: (isCurrentPass || isLoading) ? AppColors.grey300 : AppColors.primaryDark,
                  foregroundColor: (isCurrentPass || isLoading) ? AppColors.grey500 : Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryDark),
                        ),
                      )
                    : const Text(
                        'Choose Plan',
                        style: AppText.button,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
