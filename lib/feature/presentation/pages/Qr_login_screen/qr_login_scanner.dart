import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/qr_login_bloc/qr_bloc.dart';
import '../../bloc/qr_login_bloc/qr_state.dart';

class QRCodeLoginScreen extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey();

  QRCodeLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Login'),
      ),
      body: Center(
        child: BlocProvider<QRCodeLoginBloc>(
          create: (context) => QRCodeLoginBloc(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // QRView(
              //   key: qrKey,
              //   onQRViewCreated: (controller) {
              //     controller.scannedDataStream.listen((scanData) {
              //       BlocProvider.of<QRCodeLoginBloc>(context)
              //           .add(ScanQRCodeEvent(scanData.code));
              //     });
              //   },
              // ),
              const SizedBox(height: 20),
              BlocBuilder<QRCodeLoginBloc, QRCodeLoginState>(
                builder: (context, state) {
                  if (state is QRCodeLoginInitialState) {
                    return const Text('Scan the QR code to log in');
                  } else if (state is QRCodeLoginSuccessState) {
                    return Text('Logged in as ${state.userId}');
                  } else if (state is QRCodeLoginErrorState) {
                    return Text('Error: ${state.errorMessage}');
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
