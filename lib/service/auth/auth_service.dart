class AuthService {
  String? _currentUserId;

  String? get currentUserId => _currentUserId;

  bool get isLoggedIn => _currentUserId != null;

  void login(String userId) {
    _currentUserId = userId;
  }

  void logout() {
    _currentUserId = null;
  }
}
