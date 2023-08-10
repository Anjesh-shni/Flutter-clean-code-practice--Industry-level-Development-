import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  //initialize later
  late Future googleFontsPending;

  //This theme will available when app is loading.
  final fontsPending = GoogleFonts.pendingFonts([
    GoogleFonts.poppins(),
    GoogleFonts.montserrat(fontStyle: FontStyle.italic),
  ]);


 // helper style.
  //  final pushButtonTextStyle = GoogleFonts.poppins(
  //   textStyle: Theme.of(context).textTheme.headlineMedium,
  // );
  // final counterTextStyle = GoogleFonts.montserrat(
  //   fontStyle: FontStyle.italic,
  //   textStyle: Theme.of(context).textTheme.displayLarge,
  // );
}
