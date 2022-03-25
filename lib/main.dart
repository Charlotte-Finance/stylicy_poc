import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poc/blocs/bloc_observer.dart';
import 'package:poc/blocs/home/home/carousel/carousel_bloc.dart';
import 'package:poc/repositories/login/authentication_repository.dart';
import 'package:poc/repositories/login/email_repository.dart';
import 'package:poc/repositories/login/user_repository.dart';
import 'package:poc/repositories/products/product_repository.dart';

import 'app.dart';
import 'blocs/counter/counter_bloc.dart';
import 'blocs/home/navigation/navigation_cubit.dart';
import 'blocs/login/authentication_bloc/authentication_bloc.dart';
import 'blocs/login/login_bloc/login_bloc.dart';
import 'blocs/login/register_bloc/register_bloc.dart';
import 'blocs/login/reset_password_bloc/forgot_password_bloc.dart';
import 'blocs/products/product_list_bloc/product_list_bloc.dart';

void main() async {
  // Allow to use native code
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(MySystemUiOverlayStyle.dark);

  // Native code
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () {
      runApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (_) => AuthenticationRepository()),
            RepositoryProvider(create: (_) => UserRepository()),
            RepositoryProvider(create: (_) => EmailRepository()),
            RepositoryProvider(create: (_) => ProductRepository()),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthenticationBloc>(
                create: (BuildContext context) => AuthenticationBloc(
                  authenticationRepository:
                      context.read<AuthenticationRepository>(),
                  userRepository: context.read<UserRepository>(),
                ),
              ),
              BlocProvider<LoginBloc>(
                create: (BuildContext context) => LoginBloc(
                  authenticationRepository:
                      context.read<AuthenticationRepository>(),
                ),
              ),
              BlocProvider<RegisterBloc>(
                create: (BuildContext context) => RegisterBloc(
                  authenticationRepository:
                      context.read<AuthenticationRepository>(),
                  userRepository: context.read<UserRepository>(),
                ),
              ),
              BlocProvider<ForgotPasswordBloc>(
                create: (BuildContext context) => ForgotPasswordBloc(
                  emailRepository:
                  context.read<EmailRepository>(),
                ),
              ),
              BlocProvider<NavigationCubit>(
                  create: (BuildContext context) => NavigationCubit()),
              BlocProvider<CarouselBloc>(
                  create: (BuildContext context) => CarouselBloc()),
              BlocProvider<CounterBloc>(
                create: (BuildContext context) => CounterBloc(),
              ),
              BlocProvider<ProductListBloc>(
                create: (BuildContext context) => ProductListBloc(
                  productRepository: context.read<ProductRepository>(),
                ),
              ),
            ],
            child: AppView(),
          ),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
    storage: storage,
  );
}
