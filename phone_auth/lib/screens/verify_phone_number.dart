import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/cubit/auth_cubit/auth_cubit.dart';
import 'package:phone_auth/cubit/auth_cubit/auth_state.dart';
import 'package:phone_auth/screens/home_screen.dart';

class VerifyPhonePage extends StatelessWidget {
  VerifyPhonePage({Key? key}) : super(key: key);

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Very your phone'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              TextField(
                controller: otpController,
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '6-Digit OTP',
                  border: OutlineInputBorder(),
                  counterText: "",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoggedInState) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.errorString),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoggedInState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context)
                              .verifyOtp(otpController.text);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const HomePage()));
                        },
                        child: const Text('Verify OTP'));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
