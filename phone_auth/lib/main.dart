import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/cubit/auth_cubit/auth_cubit.dart';
import 'package:phone_auth/cubit/auth_cubit/auth_state.dart';
import 'package:phone_auth/screens/home_screen.dart';
import 'package:phone_auth/screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthInitialState) {
              return SignInScreen();
            } else if (state is AuthLoggedInState) {
              return HomePage();
            } else {
              return SignInScreen();
            }
          },
          buildWhen: (oldState, newState) {
            return oldState is AuthInitialState;
          },
        ),
      ),
    );
  }
}
