import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/service/booking_service.dart';
import 'package:velotoulouse/service/subscription_service.dart';
import 'package:velotoulouse/ui/screens/US-4_book_a_bike/view_model/book_a_bike_view_model.dart';
import 'package:velotoulouse/ui/screens/US-4_book_a_bike/widgets/book_a_bike_content.dart';
import 'package:velotoulouse/ui/states/station_state.dart';
import 'package:velotoulouse/ui/states/user_state.dart';

class BookABikeScreen extends StatelessWidget {
  final String slotId;
  const BookABikeScreen({super.key, required this.slotId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookABikeViewModel(
        stationState: context.read<StationState>(),
        userState: context.read<UserState>(),
        slotId: slotId, 
        bookingService: context.read<BookingService>(), 
        subscriptionService: context.read<SubscriptionService>(),
      ),
      child: const BookABikeContent(),
    );
  }
}
