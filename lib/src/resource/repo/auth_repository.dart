class AuthRepository {
  AuthRepository._();

  static AuthRepository _instance;

  factory AuthRepository() {
    if (_instance == null) _instance = AuthRepository._();
    return _instance;
  }
}
