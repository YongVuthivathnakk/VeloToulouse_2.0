import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/app_starter.dart';
import 'package:velotoulouse/firebase_options.dart';
import 'package:velotoulouse/ui/screens/map/map_screen.dart';
import 'package:velotoulouse/ui/screens/pass/pass_screen.dart';
import 'package:velotoulouse/ui/themes/theme.dart';
import 'package:velotoulouse/ui/widgets/booking_panel.dart';
import 'package:firebase_core/firebase_core.dart';

///
/// Launch the application with the given list of providers
///
void mainCommon(List<InheritedProvider> providers) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: providers,
      child: MaterialApp(debugShowCheckedModeBanner: false, home: AppStarter(), theme: ThemeData(),),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [MapScreen(), PassScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex],

          const Positioned(left: 0, right: 0, bottom: 0, child: BookingPanel()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey500,
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(Icons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number_outlined),
            activeIcon: Icon(Icons.confirmation_number_rounded),
            label: "Pass",
          ),
        ],
      ),
    );
  }
}
