import 'package:flutter/material.dart';
import 'package:velotoulouse/models/user_subscription.dart';
import 'package:velotoulouse/ui/themes/theme.dart';
import 'package:velotoulouse/utils/app_button_styles.dart';

class PaymentBottomSheet extends StatelessWidget {
  final PassType pass;
  final VoidCallback onConfirm;
  final bool isLoading;

  const PaymentBottomSheet({
    super.key,
    required this.pass,
    required this.onConfirm, 
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.large),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ),
              const SizedBox(height: 8),
              Text(pass.title, style: AppText.h1),
              if (pass.subtitle.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  pass.subtitle,
                  style: AppText.body.copyWith(color: AppColors.grey500),
                ),
              ],
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: AppColors.primary, width: 2),
                  borderRadius: AppRadius.largeRadius,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          pass.formattedPrice,
                          style: AppText.h1.copyWith(
                            color: AppColors.primaryDark,
                          ),
                        ),
                        if (pass != PassType.oneTimeTicket)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6, left: 4),
                            child: Text(
                              pass.priceSuffix,
                              style: AppText.body.copyWith(
                                color: AppColors.primaryDark,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (pass.description.isNotEmpty)
                      Text(
                        pass.description,
                        style: AppText.body.copyWith(color: AppColors.grey900),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (pass.benefits.isNotEmpty) ...[
                Text('What you get', style: AppText.h3Bold),
                const SizedBox(height: 12),
                ...pass.benefits.map(
                  (b) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 18,
                          color: AppColors.primaryDark,
                        ),
                        const SizedBox(width: 8),
                        Expanded(child: Text(b, style: AppText.body)),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 12),
              if (pass.footerNote.isNotEmpty)
                Text(
                  pass.footerNote,
                  style: AppText.caption.copyWith(color: AppColors.grey500),
                ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                  style: AppButtonStyles.primary(),
                  onPressed: onConfirm,
                  child: isLoading
                      ? const SizedBox(
                          height: 20, 
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primaryDark,
                            ),
                          ),
                        )
                      : Text('Pay Now (${pass.formattedPrice})', style: AppText.h3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
