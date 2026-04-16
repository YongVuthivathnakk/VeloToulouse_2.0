import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/ui/screens/splash/splash_screen.dart';
import 'package:velotoulouse/ui/states/user_state.dart';
import 'package:velotoulouse/ui/states/auth_state.dart';

class AppStarter extends StatelessWidget {
  const AppStarter({super.key});

  Future<void> _initApp(BuildContext context) async {
    final authState = context.read<AuthState>();
    final userState = context.read<UserState>();

    // simulate login 
    if (!authState.isLoggedIn) {
      authState.authService.login("user_01");
    }

    await userState.loadUser();

    print("USER => ${userState.user?.id}");
    print("NAME => ${userState.user?.name}");

    await Future.delayed(const Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(onInit: () => _initApp(context));
  }
}
