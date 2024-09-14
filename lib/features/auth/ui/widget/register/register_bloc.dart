import 'dart:developer';

import 'package:fitness_app/core/widget/gradient_button.dart';
import 'package:fitness_app/features/auth/logic/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterBloc extends StatelessWidget {
  const RegisterBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          log(state.message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.message}'),
              duration: Duration(seconds: 3),
            ),
          );
          GoRouter.of(context).go('/login');
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Sign-up failed. Please try again ${state.errMessage}'),
              duration: Duration(seconds: 6),
            ),
          );
          log('Sign-up failed. Please try again.*********** ${state.errMessage}********');
        }
      },
      builder: (context, state) {
        if (state is SignUpLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GradientButton(
            text: 'Register',
            onPressed: () {
              if (context
                  .read<RegisterCubit>()
                  .registerFormKey
                  .currentState!
                  .validate()) {
                context.read<RegisterCubit>().signUp();
              }
            },
          );
        }
      },
    );
  }
}
