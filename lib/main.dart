import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_app/config/go_route/route.dart';
import 'package:pos_app/services/dependency_injecton/service_locator.dart';
import 'config/route/route.dart';
import 'utils/constant/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("=======APP STARTED=======");
    return MultiBlocProvider(
      providers: [...AppRoutes.allBlocProviders(context)],
      child: MaterialApp.router(
        title: 'POS System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColor.mainBackGround,
          appBarTheme: const AppBarTheme(
            color: AppColor.mainBackGround,
          ),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
