// ignore_for_file: unused_field

import 'package:fitness_app/core/di/dependency_injection.dart';
import 'package:fitness_app/features/home/ui/screen/home_screen.dart';
import 'package:fitness_app/features/login/logic/login/login_cubit.dart';
import 'package:fitness_app/features/login/logic/register/register_cubit.dart';
import 'package:fitness_app/features/login/ui/screen/login.dart';
import 'package:fitness_app/features/onboarding/ui/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isFirstTime = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkFirstTimeAndLoginStatus();
  }

  Future<void> _checkFirstTimeAndLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool('isFirstTime');
    bool? isLoggedIn = prefs.getBool('isLoggedIn');

    // Check if the app is opened for the first time
    if (isFirstTime == null || isFirstTime) {
      setState(() {
        _isFirstTime = true;
      });
      // Save that the user has opened the app for the first time
      await prefs.setBool('isFirstTime', false);
    } else {
      setState(() {
        _isFirstTime = false;
        _isLoggedIn = isLoggedIn ?? false; // Default to false if null
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<LoginCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: _isFirstTime
              ? OnboardingScreen()
              : (_isLoggedIn ? HomeScreen() : LoginScreen()),
        ),
      ),
    );
  }
}
