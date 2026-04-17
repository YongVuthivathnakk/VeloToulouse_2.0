import 'package:flutter/material.dart';
import 'package:velotoulouse/models/booking_view_data.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class BookingInfoCard extends StatelessWidget {
  final BookingViewData booking;
  const BookingInfoCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.largeRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppRadius.large),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.confirmation_number_rounded,
                  color: AppColors.primaryDark,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  'BOOKING INFO',
                  style: AppText.label.copyWith(
                    color: AppColors.primaryDark,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),

          // Body
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _BookingInfoRow(
                  icon: Icons.tag_rounded,
                  label: 'Booking ID',
                  value: booking.booking.id,
                ),
                const Divider(color: AppColors.grey50, height: 20),
                _BookingInfoRow(
                  icon: Icons.location_on_rounded,
                  label: 'Station',
                  value: booking.stationName,
                ),
                const Divider(color: AppColors.grey50, height: 20),
                _BookingInfoRow(
                  icon: Icons.ev_station,
                  label: 'Slot Number',
                  value: 'Slot ${booking.slotNumber}',
                ),
                const Divider(color: AppColors.grey50, height: 20),
                _BookingInfoRow(
                  icon: Icons.circle_rounded,
                  label: 'Status',
                  value: booking.booking.bookingStatus.name,
                ),
                const Divider(color: AppColors.grey50, height: 20),
                _BookingInfoRow(
                  icon: Icons.access_time_rounded,
                  label: 'Time',
                  value: _formatBookingTime(booking.booking.bookingTime),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatBookingTime(DateTime time) {
    return '${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}

class _BookingInfoRow extends StatelessWidget {
  const _BookingInfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueWidget,
  });

  final IconData icon;
  final String label;
  final String value;
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.grey500),
        const SizedBox(width: 8),
        Text(label, style: AppText.caption.copyWith(color: AppColors.grey500)),
        const Spacer(),
        valueWidget ??
            Text(
              value,
              style: AppText.caption.copyWith(
                color: AppColors.grey900,
                fontWeight: FontWeight.w600,
              ),
            ),
      ],
    );
  }
}
