import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/data/repository/bike/bike_repository.dart';
import 'package:velotoulouse/data/repository/station/station_repository.dart';
import 'package:velotoulouse/models/slot.dart';
import 'package:velotoulouse/service/booking/booking_service.dart';
import 'package:velotoulouse/service/subscription/subscription_service.dart';
import 'package:velotoulouse/ui/screens/bike_booking/view_model/bike_booking_view_model.dart';
import 'package:velotoulouse/ui/screens/bike_booking/widgets/bike_booking_content.dart';
import 'package:velotoulouse/ui/states/booking_state.dart';
import 'package:velotoulouse/ui/states/user_state.dart';

class BikeBookingScreen extends StatelessWidget {
  final Slot slot;
  const BikeBookingScreen({super.key, required this.slot});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BikeBookingViewModel(
        bookingService: context.read<BookingService>(),
        subscriptionService: context.read<SubscriptionService>(), 
        userState: context.read<UserState>(),
        stationRepository: context.read<StationRepository>(),
        bookingState: context.read<BookingState>(), 
      )..init(slot),
      child: BikeBookingContent(slot: slot),
    );
  }
}
