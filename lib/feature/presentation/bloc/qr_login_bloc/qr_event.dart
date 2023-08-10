// Define the events and states for the QR code login feature
abstract class QRCodeLoginEvent {}

class ScanQRCodeEvent extends QRCodeLoginEvent {
  final String qrCodeData;

  ScanQRCodeEvent(this.qrCodeData);
}
