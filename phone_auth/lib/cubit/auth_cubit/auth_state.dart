import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoggedInState extends AuthState {
  final User firebaseUser;
  AuthLoggedInState(this.firebaseUser);


}

class AuthLoggedOutState extends AuthState {}

class AuthCodeSendState extends AuthState {}

class AuthCodeVerifiedState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState{

  final String errorString;
  AuthErrorState(this.errorString);
}
