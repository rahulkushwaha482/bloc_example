abstract class SignInEvenet {}

class SignInTextChangedEvent extends SignInEvenet {
  final String email;
  final String password;

  SignInTextChangedEvent(this.email, this.password);
}

class SignInSubmitedEvent extends SignInEvenet {
  final String email;
  final String password;

  SignInSubmitedEvent(this.email, this.password);

  void stopLoading(){

  }



}
