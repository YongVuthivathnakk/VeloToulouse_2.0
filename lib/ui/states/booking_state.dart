import 'dart:async';
import 'package:flutter/material.dart';
import 'package:velotoulouse/models/booking_view_data.dart';
import 'package:velotoulouse/service/booking/booking_service.dart';

class BookingState extends ChangeNotifier {
  final BookingService service;
  final String userId;

  BookingViewData? currentBookingData;
  StreamSubscription? _sub;

  BookingState({required this.service, required this.userId});

  void startListening() {
    _sub = service.watchCurrentBookingView(userId).listen((data) {
      currentBookingData = data;
      notifyListeners();
    });
  }

  bool get hasBooking => currentBookingData != null;

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
