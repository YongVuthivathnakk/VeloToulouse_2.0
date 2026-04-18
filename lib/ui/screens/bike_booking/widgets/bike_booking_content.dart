import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/models/user_subscription.dart';
import 'package:velotoulouse/ui/screens/bike_booking/view_model/bike_booking_view_model.dart';
import 'package:velotoulouse/ui/screens/bike_booking/widgets/access_option_tile.dart';
import 'package:velotoulouse/ui/screens/bike_booking/widgets/active_pass_card.dart';
import 'package:velotoulouse/ui/screens/bike_booking/widgets/bike_card.dart';
import 'package:velotoulouse/ui/screens/bike_booking/widgets/booking_info_card.dart';
import 'package:velotoulouse/ui/screens/pass/pass_screen.dart';
import 'package:velotoulouse/ui/screens/pass/widgets/payment_bottom_sheet.dart';
import 'package:velotoulouse/ui/themes/theme.dart';
import 'package:velotoulouse/ui/widgets/primary_button.dart';

class BikeBookingContent extends StatelessWidget {
  final Slot slot;
  const BikeBookingContent({super.key, required this.slot});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BikeBookingViewModel>();
    final user = vm.user;
    final station = vm.station;
    final hasActiveBooking = vm.hasActiveBooking;
    final currentBooking = vm.currentBooking;
    final isExpired = user?.userSubscription?.isExpired ?? false;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Book A Bike", style: AppText.h2),
      ),
      body: (user == null || station == null)
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Station • ${station.name} - ${station.location.name}',
                    style: AppText.h3,
                  ),
                  SizedBox(height: 10),

                  BikeCard(slotNumber: slot.slotNumber),

                  SizedBox(height: 10),

                  if (hasActiveBooking && currentBooking != null) ...[
                    Text(
                      'YOU ALREADY HAVE A BOOKING',
                      style: AppText.h3Bold.copyWith(
                        color: AppColors.secondaryDark,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'You cannot book another bike until you finish your current booking.',
                      style: AppText.body,
                    ),

                    const SizedBox(height: 16),
                    BookingInfoCard(booking: currentBooking),
                  ] else if (user.hasValidSubscription) ...[
                    Text(
                      'YOUR ACTIVE PASS',
                      style: AppText.label.copyWith(color: AppColors.grey500),
                    ),

                    const SizedBox(height: 8),

                    ActivePassCard(userSubscription: user.userSubscription!),

                    const SizedBox(height: 8),
                    Divider(),

                    Text(
                      'READY TO USE',
                      style: AppText.label.copyWith(color: AppColors.grey500),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'Your pass covers this ride. Tap confirm to reserve the bike.',
                      style: AppText.body.copyWith(color: AppColors.grey900),
                    ),

                    const Spacer(),

                    PrimaryButton(
                      label: 'Confirm booking',
                      onPressed: () =>
                          vm.bookBike(BookingType.pass, slot).then((_) {
                            print("bookBike success");
                          }),
                    ),
                  ] else ...[
                    if(isExpired)...[
                      Text(
                        'YOUR PASS HAS EXPIRED',
                        style: AppText.label.copyWith(color: AppColors.secondaryDark),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        'Please renew your subscription or get a new pass to continue riding.',
                        style: AppText.body.copyWith(color: AppColors.grey900),
                      ),

                      const SizedBox(height: 12),
                    ],
                    Text(
                      'ACCESS REQUIRED',
                      style: AppText.label.copyWith(color: AppColors.grey500),
                    ),

                    const SizedBox(height: 8),

                    AccessOptionTile(
                      icon: Icons.credit_card,
                      title: 'Get a pass',
                      subtitle: 'Daily, Monthly, Annual',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const PassScreen()),
                        );
                      },
                    ),

                    const SizedBox(height: 8),

                    AccessOptionTile(
                      icon: Icons.confirmation_number_outlined,
                      title: 'Get a one-time ticket',
                      subtitle: 'Single Ride - \$1.00',
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) {
                            return PaymentBottomSheet(
                              pass: PassType.oneTimeTicket,
                              isLoading: false,
                              onConfirm: () async {
                                Navigator.pop(context);
                                await vm.buyOneTimeTicket();
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
    );
  }
}
