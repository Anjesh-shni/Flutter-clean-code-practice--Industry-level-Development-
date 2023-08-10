abstract class SignUpEvent{
  SignUpEvent();
}

class UserNameEvent extends SignUpEvent{
final String username;
UserNameEvent(this.username);
}

class EmailEvent extends SignUpEvent {
  final String email;

  EmailEvent(this.email);
}

class PasswordEvent extends SignUpEvent {
  final String password;

  PasswordEvent(this.password);
}

class RetypePasswordEvent extends SignUpEvent {
  final String reTypePassword;

  RetypePasswordEvent(this.reTypePassword);
}
