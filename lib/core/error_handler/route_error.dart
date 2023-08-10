import 'package:flutter/material.dart';

class RouteError extends StatelessWidget {
  final String errorMsg;
  const RouteError({
    Key? key,
    required this.errorMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Error'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(errorMsg),
      ),
    );
  }
}
