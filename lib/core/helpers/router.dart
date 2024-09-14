import 'package:fitness_app/features/home/ui/screen/home_screen.dart';
import 'package:fitness_app/features/auth/ui/screen/login.dart';
import 'package:fitness_app/features/auth/ui/screen/register_screen.dart';
import 'package:fitness_app/features/onboarding/ui/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

GoRouter createRouter(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found')),
    ),
  );
}

Future<GoRouter> initializeRouter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isFirstTime = prefs.getBool('isFirstTime');
  bool? isLoggedIn = prefs.getBool('isLoggedIn');

  // Determine the initial location based on preferences
  String initialLocation = isFirstTime == null || isFirstTime
      ? '/onboarding'
      : (isLoggedIn ?? false ? '/home' : '/login');

  return createRouter(initialLocation);
}
