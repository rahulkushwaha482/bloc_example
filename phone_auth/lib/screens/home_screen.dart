import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/cubit/auth_cubit/auth_cubit.dart';
import 'package:phone_auth/cubit/auth_cubit/auth_state.dart';
import 'package:phone_auth/screens/sign_in_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          BlocConsumer<AuthCubit, AuthState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(right: 15),
                child: InkWell(
                    onTap: () {
                      BlocProvider.of<AuthCubit>(context).logOut();
                    },
                    child: Icon(Icons.logout)),
              );
            },
            listener: (context, state) {
              if (state is AuthLoggedOutState) {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (co) => SignInScreen()));
              }
            },
          )
        ],
      ),
      body: Center(
        child: Text('User Logged In!!'),
      ),
    );
  }
}
