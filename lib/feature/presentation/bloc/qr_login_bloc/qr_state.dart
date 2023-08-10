abstract class QRCodeLoginState {}

class QRCodeLoginInitialState extends QRCodeLoginState {}

class QRCodeLoginSuccessState extends QRCodeLoginState {
  final String userId;

  QRCodeLoginSuccessState(this.userId);
}

class QRCodeLoginErrorState extends QRCodeLoginState {
  final String errorMessage;

  QRCodeLoginErrorState(this.errorMessage);
}
