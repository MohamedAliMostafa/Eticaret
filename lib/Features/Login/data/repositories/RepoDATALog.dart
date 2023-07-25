import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Login/data/data_sources/LogDataSource.dart';
import 'package:eticaret/Features/Login/data/models/ModelLog.dart';
import 'package:eticaret/Features/Login/domain/repositories/repoDomainLog.dart';

import '../models/ForgPass.dart';
import '../models/Verif.dart';
import '../models/resetPass.dart';

class RepoDataLog implements RepoDlog
{
  LogDataSource logDataSource;

  RepoDataLog(this.logDataSource);

  @override
  Future<Either<Failures,ModelLog>> SignIn(String Email,String pass) =>logDataSource.SignIn(Email,pass);
  Future<Either<Failures,ForgPass>> ForgetPass(String Email)=>logDataSource.ForgetPass(Email);
  Future<Either<Failures,Verif>> verifyCode(String Code)=>logDataSource.verifyCode(Code);
  Future<Either<Failures,ResetPass>> resetPass(String Email,String pass)=>logDataSource.resetPass(Email, pass);

}