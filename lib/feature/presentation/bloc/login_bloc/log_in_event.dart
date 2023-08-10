abstract class AuthenticEvent {
  AuthenticEvent();
}

class EmailEvent extends AuthenticEvent {
  final String email;
  EmailEvent(this.email,);
}

class PasswordEvent extends AuthenticEvent {
  final String password;
  PasswordEvent(this.password);
}
