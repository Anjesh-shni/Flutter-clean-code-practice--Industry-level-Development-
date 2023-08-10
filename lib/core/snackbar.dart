import 'package:flutter/material.dart';
import 'package:pos_app/utils/constant/app_colors.dart';

class TopSnackbar {
  //Notification that will display at bottom
  static void show(BuildContext context, String message) {
    final snackBarBottom = SnackBar(
        backgroundColor: fontgrey,
        content: Text(
          message,
          style: const TextStyle(color: buttonColor, fontSize: 13),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarBottom);
  }

  //Notification that will display at top
  static void showTop(BuildContext context, String message) {
    final banner = MaterialBanner(
      content: Text(message),
      actions: [
        TextButton(
          child: const Text('Dismiss'),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
        ),
      ],
    );
    ScaffoldMessenger.of(context).showMaterialBanner(banner);
  }
}
