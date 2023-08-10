class AuthenticState {
  final String email;
  final String password;

  AuthenticState({this.email = "", this.password = ""});

  AuthenticState copyWith({String? email, String? password}) {
    return AuthenticState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
