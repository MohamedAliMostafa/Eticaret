import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Core/api/BaseURL.dart';
import 'package:eticaret/Core/api/EndPoints.dart';
import 'package:eticaret/Features/Login/data/data_sources/LogDataSource.dart';
import 'package:eticaret/Features/Login/data/models/ForgPass.dart';
import 'package:eticaret/Features/Login/data/models/ModelLog.dart';
import 'package:eticaret/Features/Login/data/models/Verif.dart';

import '../models/resetPass.dart';

class RemoteDataLog implements LogDataSource
{
  @override
  Future<Either<Failures,ModelLog>> SignIn(String Email,String pass) async {

    Dio dio=Dio();
    try{
      var resp=await dio.post("$signUpBaseURL$signInEndPoint",data: {
        "email":Email,
        "password":pass
      });
      ModelLog modelLog=ModelLog.fromJson(resp.data);
      return Right(modelLog);
    }
    catch(e)
    {
      if(e is DioException) {
        return left(ServerError.fromDio(e));
      }
      else{
        return left(ServerError(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, ForgPass>> ForgetPass(String Email) async {
    Dio dio=Dio();
    try{
      var resp=await dio.post("$signUpBaseURL$ForgetPasEndPoint",data: {
        "email":Email,
      });
      ForgPass forgPass=ForgPass.fromJson(resp.data);
      return Right(forgPass);
    }
    catch(e)
    {
      if(e is DioException) {
      return left(ServerError.fromDio(e));
    }
    else{
      return left(ServerError(e.toString()));
    }
  }
  }

  @override
  Future<Either<Failures, Verif>> verifyCode(String Code) async {
    Dio dio=Dio();
    try{
      var resp=await dio.post("$signUpBaseURL$verifyEndPoint",data: {
        "resetCode":Code,
      });
      Verif verif=Verif.fromJson(resp.data);
      return Right(verif);
    }
    catch(e)
    {
      if(e is DioException) {
        return left(ServerError.fromDio(e));
      }
      else{
        return left(ServerError(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, ResetPass>> resetPass(String Email, String pass) async {
    Dio dio=Dio();
    try{
      var resp=await dio.put("$signUpBaseURL$resetPassEndPoint",data: {
        "email":Email,
        "newPassword":pass,
      });
      ResetPass resetPass=ResetPass.fromJson(resp.data);
      return Right(resetPass);
    }
    catch(e)
    {
      if(e is DioException) {
        return left(ServerError.fromDio(e));
      }
      else{
        return left(ServerError(e.toString()));
      }
    }
  }
}