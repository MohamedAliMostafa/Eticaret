import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Login/data/models/ModelLog.dart';
import 'package:eticaret/Features/Login/domain/repositories/repoDomainLog.dart';

import '../../data/models/ForgPass.dart';
import '../../data/models/Verif.dart';
import '../../data/models/resetPass.dart';

class UseCaseLog
{
RepoDlog dlog;
  UseCaseLog(this.dlog);

Future<Either<Failures,ModelLog>> call(String Email,String pass)=>dlog.SignIn(Email,pass);
Future<Either<Failures,ForgPass>> FP(String Email)=>dlog.ForgetPass(Email);
Future<Either<Failures,Verif>> verf(String Code)=>dlog.verifyCode(Code);
Future<Either<Failures,ResetPass>> resetps(String Email,String pass)=>dlog.resetPass(Email, pass);
}