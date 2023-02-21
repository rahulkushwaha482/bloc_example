import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/cubit/auth_cubit/auth_cubit.dart';
import 'package:phone_auth/cubit/auth_cubit/auth_state.dart';
import 'package:phone_auth/screens/verify_phone_number.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in with Phone'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              TextField(
                controller: _phoneController,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(),
                  counterText: "",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
                if (state is AuthCodeSendState) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VerifyPhonePage()));
                }
              }, builder: (context, state) {
                if (state is AuthLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else {
                  return ElevatedButton(
                    onPressed: () {
                      String phoneNumber = "+91" + _phoneController.text;
                      BlocProvider.of<AuthCubit>(context).sendOtp(phoneNumber);

                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const VerifyPhonePage()));
                    },
                    child: const Text('Sign In'),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
