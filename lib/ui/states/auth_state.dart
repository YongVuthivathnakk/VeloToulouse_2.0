import 'package:flutter/widgets.dart';
import 'package:velotoulouse/service/auth/auth_service.dart';

class AuthState extends ChangeNotifier {
  final AuthService authService;

  String? get userId => authService.currentUserId;
  bool get isLoggedIn => userId != null;

  AuthState(this.authService);
}
