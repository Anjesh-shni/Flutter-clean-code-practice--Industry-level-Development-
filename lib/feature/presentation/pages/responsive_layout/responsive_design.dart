import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget smallMobile;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.smallMobile,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200 &&
      MediaQuery.of(context).size.width >= 768;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
  @override
  Widget build(BuildContext context) {
    
    final Size size = MediaQuery.of(context).size;
    
    if (size.width >= 1200) {
      return desktop;
    }
    // If width it less then 1200 and more then 768 we consider it as tablet
    else if (size.width >= 768) {
      return tablet;
    }
    // Or less then that we called it mobile
    else if (size.width >= 376 && size.width <= 768) {
      return mobile;
    } else {
      return smallMobile;
    }
  }
}
