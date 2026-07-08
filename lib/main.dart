import 'package:dreams_app/screens/documents.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/draft_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/personal_details.dart';
import 'screens/profile_screen.dart';
import 'screens/review_screen.dart';
import 'screens/van_inspection_form.dart';
import 'screens/van_inspection_screen.dart';
import 'screens/vehicle_parts.dart';
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
          GoRoute(
            path: '/documents',
            name: 'documents',
            builder: (BuildContext context, GoRouterState state) {
              return const VehicleDocuments();
            },
          ),
          GoRoute(
            path: '/personal-details',
            name: 'personal-details',
            builder: (BuildContext context, GoRouterState state) {
              return const PersonalDetails();
            },
          ),
          GoRoute(
            path: '/draft',
            name: 'draft',
            builder: (BuildContext context, GoRouterState state) {
              return const DraftScreen();
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