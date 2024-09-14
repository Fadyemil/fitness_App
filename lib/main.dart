import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/router.dart';
import 'features/auth/logic/login/login_cubit.dart';
import 'features/auth/logic/register/register_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  final GoRouter router =
      await initializeRouter(); // Ensure the router is fully initialized

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

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
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          
        ),
      ),
    );
  }
}
