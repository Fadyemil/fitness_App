import 'package:fitness_app/features/login/logic/login/login_cubit.dart';
import 'package:fitness_app/features/login/logic/register/register_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerFactory<LoginCubit>(() => LoginCubit());
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit());
}
