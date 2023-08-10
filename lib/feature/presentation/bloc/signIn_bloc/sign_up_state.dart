class SignUpState {
  final String userName;
  final String email;
  final String password;
  final String reTypePassword;

  SignUpState({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.reTypePassword = "",
  });

  SignUpState copyWith({
    String? userName,
    String? email,
    String? password,
    String? reTypePassword,
  }) {
    return SignUpState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      reTypePassword: reTypePassword ?? this.reTypePassword,
    );
  }
}
