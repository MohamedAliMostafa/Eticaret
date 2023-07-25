import 'package:eticaret/Features/SignUp/data/models/SignUpModel.dart';

abstract class SignUpStates{}
class SignUpInit extends SignUpStates{}
class SignUpLoading extends SignUpStates{}
class SignUpSuccess extends SignUpStates{
  SignUpModel  signUpModel;

  SignUpSuccess(this.signUpModel);
}
class SignUpError extends SignUpStates{
  String msg;
  SignUpError(this.msg);
}