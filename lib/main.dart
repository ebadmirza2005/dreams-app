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
  final GoRouterState state;

  const WidgetWrapper({super.key, required this.child, required this.state});

  int _selectedIndexForPath(String path) {
    switch (path) {
      case '/profile':
        return 1;
      default:
        return 0;
    }
  }

  void _onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 1:
        context.go('/profile');
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
        break;
      default:
        context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          width: MediaQuery.of(context).size.width * 0.82,
          child: SafeArea(
            child: NavigationDrawer(
              selectedIndex: _selectedIndexForPath(state.uri.path),
              onDestinationSelected: (index) => _onDestinationSelected(context, index),
              children: const [
                SizedBox(height: 10,),
                NavigationDrawerDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationDrawerDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: Text('Profile'),
                ),
                NavigationDrawerDestination(
                  icon: Icon(Icons.logout, color: Colors.black),
                  selectedIcon: Icon(Icons.logout, color: Colors.black),
                  label: Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ),
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
          return WidgetWrapper(state: state, child: child);
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