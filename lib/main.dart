import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen/home_screen.dart';
import 'screen/login_screen.dart';
import 'screen/profile_screen.dart';
import 'screen/review_screen.dart';
import 'screen/van_inspection_form.dart';
import 'screen/van_inspection_screen.dart';
import 'screen/vehicle_parts.dart';
import 'utils/app_bar.dart';

void main() {
  runApp(const MyApp());
}

class WidgetWrapper extends StatelessWidget {
  final Widget child;
  const WidgetWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: child,
    );
  }
}


final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    ShellRoute(
        builder: (context, state, child) {
          return WidgetWrapper(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            name: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (BuildContext context, GoRouterState state) {
              return const ProfileScreen();
            },
          ),
          GoRoute(
            path: '/review',
            name: 'review',
            builder: (BuildContext context, GoRouterState state) {
              return const ReviewScreen();
            },
          ),
          GoRoute(
            path: '/van-form',
            name: 'van-form',
            builder: (BuildContext context, GoRouterState state) {
              return const VanInspectionForm();
            },
          ),
          GoRoute(
            path: '/van-inspection',
            name: 'van-inspection',
            builder: (BuildContext context, GoRouterState state) {
              return const VanInspectionScreen();
            },
          ),
          GoRoute(
            path: '/vehicle-parts',
            name: 'vehicle-parts',
            builder: (BuildContext context, GoRouterState state) {
              return const VehicleParts();
            },
          ),
    ])

  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Dreams App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff005baa),
          primary: const Color(0xff005baa),
        ),
      ),
    );
  }
}