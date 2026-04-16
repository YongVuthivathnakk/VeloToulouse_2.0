import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/models/booking.dart';
import 'package:velotoulouse/ui/screens/US-4_book_a_bike/view_model/book_a_bike_view_model.dart';
import 'package:velotoulouse/ui/screens/US-4_book_a_bike/widgets/access_option_tile.dart';
import 'package:velotoulouse/ui/screens/US-4_book_a_bike/widgets/active_pass_card.dart';
import 'package:velotoulouse/ui/screens/US-4_book_a_bike/widgets/bike_card.dart';
import 'package:velotoulouse/ui/screens/US-4_book_a_bike/widgets/booking_info_card.dart';
import 'package:velotoulouse/ui/themes/theme.dart';
import 'package:velotoulouse/ui/widgets/primary_button.dart';

class BookABikeContent extends StatelessWidget {
  const BookABikeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BookABikeViewModel>();
    final station = vm.stationState.selectedStation;
    final user = vm.userState.currentUser;
    if (user != null) print(user.name);


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
      body: station == null || user == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Station • ${station.name} – ${station.location.name}',
                    style: AppText.h3,
                  ),
                  SizedBox(height: 10),

                  BikeCard(slotId: vm.slotId, slotNumber: vm.slot!.slotNumber),

                  SizedBox(height: 10),

                  if (user.bookedBike != null) ...[
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
                    BookingInfoCard(user: user),
                  ]
                  else if (user.hasValidSubscription) ...[
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
                      onPressed: () => vm.bookBike(BookingType.pass),
                    ),
                  ]
                  else ...[
                    Text(
                      'ACCESS REQUIRED',
                      style: AppText.label.copyWith(color: AppColors.grey500),
                    ),

                    const SizedBox(height: 8),

                    AccessOptionTile(
                      icon: Icons.credit_card,
                      title: 'Get a pass',
                      subtitle: 'Daily, Monthly, Annual',
                      onTap: () {},
                    ),

                    const SizedBox(height: 8),

                    AccessOptionTile(
                      icon: Icons.confirmation_number_outlined,
                      title: 'Get a one-time ticket',
                      subtitle: 'Single Ride - \$1.00',
                      onTap: () => vm.buyOneTimeTicket(),
                    ),
                  ],
                ]
              ),
            ),
    );
  }
}
