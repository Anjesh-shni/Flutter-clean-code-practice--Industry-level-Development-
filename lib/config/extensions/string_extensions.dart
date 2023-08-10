import 'package:flutter/material.dart';
import '../../translation/app_localization.dart';


extension StringExtension on String {
  String intelliTrim() {
    return this.length > 5 ? '${this.substring(0, 5)}...' : this;
  }

  String t(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this) ?? '';
  }
}
