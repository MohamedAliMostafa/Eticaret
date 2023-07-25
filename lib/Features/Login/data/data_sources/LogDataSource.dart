import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Login/data/models/ForgPass.dart';
import 'package:eticaret/Features/Login/data/models/ModelLog.dart';

import '../models/Verif.dart';
import '../models/resetPass.dart';

abstract class LogDataSource
{
  Future<Either<Failures,ModelLog>> SignIn(String Email,String pass);
  Future<Either<Failures,ForgPass>> ForgetPass(String Email);
  Future<Either<Failures,Verif>> verifyCode(String Code);
  Future<Either<Failures,ResetPass>> resetPass(String Email,String pass);
}