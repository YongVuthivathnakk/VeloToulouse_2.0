import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/ui/screens/view_bike_at_a_station/view_bike_at_a_station_screen.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

///
/// Launch the application with the given list of providers
///
void mainCommon(List<InheritedProvider> providers) {
  runApp(
    MultiProvider(
      providers: providers,
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ViewBikeAtAStationScreen();
  }
}
