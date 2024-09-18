// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:fitness_app/core/widget/gradient_button.dart';
import 'package:fitness_app/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is SignInSuccess) {
          log('************************done login***************************************');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Done Login '),
              duration: Duration(seconds: 3),
            ),
          );
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          GoRouter.of(context).go('/home');
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Sign-up failed. Please try again ${state.errMessage}'),
              duration: const Duration(seconds: 6),
            ),
          );
          log('Sign-up failed. Please try again.*********** ${state.errMessage}********');
        } else if (state is SignInLoading) {
          log('***********SignIn Loading************* login***************************************');
        }
      },
      builder: (context, state) {
        if (state is SignInLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GradientButton(
            text: 'Login',
            onPressed: () {
              if (context
                  .read<LoginCubit>()
                  .loginFormKey
                  .currentState!
                  .validate()) {
                context.read<LoginCubit>().signIn();
              }
            },
            iconData: Iconsax.login,
          );
        }
      },
    );
  }
}
