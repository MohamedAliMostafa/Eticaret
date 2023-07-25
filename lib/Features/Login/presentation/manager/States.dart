import 'package:eticaret/Features/Login/data/models/ForgPass.dart';
import 'package:eticaret/Features/Login/data/models/ModelLog.dart';

import '../../data/models/Verif.dart';
import '../../data/models/resetPass.dart';

abstract class LogStates {
}
class LogInitStates extends LogStates{}
class LogLoadingStates extends LogStates{}
class LogSuccessStates extends LogStates{
  ModelLog modelLog;

  LogSuccessStates(this.modelLog);
}
class LogErrorStates extends LogStates{
  String msg;
  LogErrorStates(this.msg);
}
class ForGetPassSuccessStates extends LogStates{
  ForgPass forgPass;

  ForGetPassSuccessStates(this.forgPass);
}
class ForGetPassErrorStates extends LogStates{
  String msg;
  ForGetPassErrorStates(this.msg);
}
class VerifySuccessStates extends LogStates{
  Verif verif;

  VerifySuccessStates(this.verif);
}
class VerifyErrorStates extends LogStates{
  String msg;
  VerifyErrorStates(this.msg);
}
class ResetSuccessStates extends LogStates{
  ResetPass resetPass;

  ResetSuccessStates(this.resetPass);
}
class ResetErrorStates extends LogStates{
  String msg;
  ResetErrorStates(this.msg);
}
