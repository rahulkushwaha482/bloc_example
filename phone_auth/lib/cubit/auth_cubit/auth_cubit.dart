import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/cubit/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitialState()) {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      emit(AuthLoggedInState(currentUser));
    } else {
      emit(AuthLoggedOutState());
    }
  }

  String? _verificationId;

  void sendOtp(String phoneNumber) async {
    emit(AuthLoadingState());
    await _auth.verifyPhoneNumber(
      verificationCompleted: (phoneAuthCredential) {
        signinwithPhone(phoneAuthCredential);
      },
      verificationFailed: (e) {
        emit(AuthErrorState(e.message.toString()));
      },
      codeSent: (id, token) {
        _verificationId = id;
        emit(AuthCodeSendState());
      },
      codeAutoRetrievalTimeout: (id) {
        _verificationId = id;
      },
      phoneNumber: phoneNumber,
    );
  }

  void verifyOtp(String otp) {
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);
    signinwithPhone(credential);
  }

  void signinwithPhone(PhoneAuthCredential phoneAuthCredential) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      if (userCredential.user != null) {
        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch (ex) {
      emit(AuthErrorState(ex.message.toString()));
    }
  }

  void logOut()async{
    await _auth.signOut();
    emit(AuthLoggedOutState());
  }
}
