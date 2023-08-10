import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_app/app/main/home.dart';
import 'package:pos_app/feature/presentation/pages/login_screen/login_screen.dart';
import 'package:pos_app/feature/presentation/pages/table_screen/tables.dart';

import '../../core/error_handler/route_error.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'app');

///The reason, i'm using Go_router instead of normal routing or list routing
///because Go_router allow us to navigate at Top-level routes, Sub-routes,
///stack, push, inner routing and many more
///also able to redirect page if needed,

///using go_router, we have several option like context.push or context.go,
///help us to pass parameter over any pages.

// This scenario demonstrates how to set up nested navigation using ShellRoute,
// which is a pattern where an additional Navigator is placed in the widget tree
// to be used instead of the root navigator. This allows deep-links to display
// pages along with other UI components such as a BottomNavigationBar.

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    /// Application root level shell
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MyHome(child: child);
      },
      routes: <RouteBase>[
        /// The first screen to display in the bottom navigation bar.
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const TablePage();
          },
          routes: <RouteBase>[
            //The details screen to display stacked on the inner Navigator.
            // This will cover screen A but not the application shell.
            GoRoute(
              path: 'details',
              builder: (BuildContext context, GoRouterState state) {
                return const LoginScreen();
              },
            ),
          ],
        ),

        // /// Displayed when the second item in the the bottom navigation bar is
        // /// selected.
        // GoRoute(
        //   path: '/b',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const ScreenB();
        //   },
        //   routes: <RouteBase>[
        //     /// Same as "/a/details", but displayed on the root Navigator by
        //     /// specifying [parentNavigatorKey]. This will cover both screen B
        //     /// and the application shell.
        //     GoRoute(
        //       path: 'details',
        //       parentNavigatorKey: _rootNavigatorKey,
        //       builder: (BuildContext context, GoRouterState state) {
        //         return const DetailsScreen(label: 'B');
        //       },
        //     ),
        //   ],
        // ),

        // /// The third screen to display in the bottom navigation bar.
        // GoRoute(
        //   path: '/c',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const ScreenC();
        //   },
        //   routes: <RouteBase>[
        //     // The details screen to display stacked on the inner Navigator.
        //     // This will cover screen A but not the application shell.
        //     GoRoute(
        //       path: 'details',
        //       builder: (BuildContext context, GoRouterState state) {
        //         return const DetailsScreen(label: 'C');
        //       },
        //     ),
        //   ],
        // ),
      ],
    ),
  ],
  // redirect to the login page if the user is not logged in
  // redirect: (BuildContext context, GoRouterState state) async {

  //   final bool loggedIn ="" as bool;
  //   final bool loggingIn = state.matchedLocation == '/login';
  //   if (!loggedIn) {
  //     return '/login';
  //   }

  //   // if the user is logged in but still on the login page, send them to
  //   // the home page
  //   if (loggingIn) {
  //     return '/';
  //   }

  //   // no need to redirect at all
  //   return null;
  // },

  ///In case of route path invalid
  errorBuilder: (context, state) => RouteError(
    errorMsg: state.error.toString(),
    key: state.pageKey,
  ),
);
