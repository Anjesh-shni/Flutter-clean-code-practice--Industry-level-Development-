import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/presentation/bloc/app_level_bloc/app_bloc.dart';
import '../../feature/presentation/bloc/app_level_bloc/app_state.dart';

class MyHome extends StatelessWidget {
  final Widget child;
  const MyHome({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  color: Colors.teal,
                ),
                Expanded(
                  flex: 9,
                  child: child,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
