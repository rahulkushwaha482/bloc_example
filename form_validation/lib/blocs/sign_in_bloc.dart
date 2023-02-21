import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/blocs/sign_in_event.dart';
import 'package:form_validation/blocs/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvenet, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if ( EmailValidator.validate(event.email) == false) {
        print(event.email);
        emit(SignInErrorState('Enter a valid email Address'));
      }else if( event.password.length<=8){
        emit(SignInErrorState('Enter 8 digit password'));
      }
      else{
        emit(SignInValidState());
      }
    });

    on<SignInSubmitedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
