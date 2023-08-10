import 'package:bloc/bloc.dart';
import 'package:pos_app/feature/presentation/bloc/qr_login_bloc/qr_event.dart';
import 'package:pos_app/feature/presentation/bloc/qr_login_bloc/qr_state.dart';

class QRCodeLoginBloc extends Bloc<QRCodeLoginEvent, QRCodeLoginState> {
  QRCodeLoginBloc() : super(QRCodeLoginInitialState());

  Stream<QRCodeLoginState> mapEventToState(QRCodeLoginEvent event) async* {
    if (event is ScanQRCodeEvent) {
      try {
        // Perform validation and login logic based on the scanned QR code data
        String userId = await validateQRCode(event.qrCodeData);

        if (userId.isNotEmpty) {
          yield QRCodeLoginSuccessState(userId);
        } else {
          yield QRCodeLoginErrorState('Invalid QR code');
        }
      } catch (e) {
        yield QRCodeLoginErrorState('Error occurred while scanning QR code');
      }
    }
  }

  Future<String> validateQRCode(String qrCodeData) async {
    await Future.delayed(const Duration(seconds: 2));
    return 'user123';
  }
}
