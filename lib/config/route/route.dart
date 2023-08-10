import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_app/app/homepage.dart';
import 'package:pos_app/config/route/route_name.dart';
import 'package:pos_app/feature/presentation/bloc/app_level_bloc/app_bloc.dart';
import 'package:pos_app/feature/presentation/pages/table_screen/tables.dart';
import '../../core/global.dart';
import '../../feature/presentation/bloc/login_bloc/log_in_bloc.dart';
import '../../feature/presentation/bloc/on_boarding_bloc/welcome_bloc.dart';
import '../../feature/presentation/bloc/qr_login_bloc/qr_bloc.dart';
import '../../feature/presentation/bloc/signIn_bloc/sign_up_bloc.dart';
import '../../feature/presentation/pages/forgot_password/forgot_password.dart';
import '../../feature/presentation/pages/login_screen/login_screen.dart';
import '../../feature/presentation/pages/new_password/new_password.dart';
import '../../feature/presentation/pages/on_boarding/on_boarding_screen.dart';
import '../../feature/presentation/pages/signup_screen/sign_up_screen.dart';

class AppRoutes {
  //pages route list
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoute.initial,
        page: const OnBoardingSceen(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoute.signIn,
        page: const LoginScreen(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoute.signUp,
        page: const SignUpScreen(),
        bloc: BlocProvider(create: (_) => SignUpBloc()),
      ),
      PageEntity(
        route: AppRoute.qrLogin,
        page: const SignUpScreen(),
        bloc: BlocProvider(create: (_) => QRCodeLoginBloc()),
      ),
      PageEntity(
        route: AppRoute.resetPassword,
        page: const ForgotPasswordScreen(),
        bloc: BlocProvider(create: (_) => ApplicationBloc()),
      ),
      PageEntity(
        route: AppRoute.newPassword,
        page: const NewPasswordScreen(),
        bloc: BlocProvider(create: (_) => ApplicationBloc()),
      ),
      PageEntity(
        route: AppRoute.tablePage,
        page: const TablePage(),
        bloc: BlocProvider(create: (_) => ApplicationBloc()),
      ),
      PageEntity(
        route: AppRoute.application,
        page: const AppHomePage(),
        bloc: BlocProvider(create: (_) => ApplicationBloc()),
      ),
    ];
  }

//all bloc loop through once and get supplied
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProvider = <dynamic>[];

    for (var bloc in routes()) {
      blocProvider.add(bloc.bloc);
    }
    return blocProvider;
  }

  //OnGenerate route
  // ignore: non_constant_identifier_names
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //checkin for routeName matching when navigatorgets triggered

      var pageResult =
          routes().where((element) => element.route == settings.name);
      if (pageResult.isNotEmpty) {
        //checking if the app is booted first time or not
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

        if (pageResult.first.route == AppRoute.initial && deviceFirstOpen) {
          return MaterialPageRoute(
              builder: (_) => const AppHomePage(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => pageResult.first.page, settings: settings);
      }
    }
    debugPrint("This is Invalid route name: ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const OnBoardingSceen(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.route,
    required this.page,
    required this.bloc,
  });
}
