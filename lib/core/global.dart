import 'package:flutter/material.dart';
import '../services/storage_facility/storage_services.dart';

//This entity will initialize before app run app and help us to track the app status.
class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageService = await StorageService().init();
  }
}
