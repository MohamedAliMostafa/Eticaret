import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Core/api/BaseURL.dart';
import 'package:eticaret/Core/api/EndPoints.dart';
import 'package:eticaret/Features/SignUp/data/data_sources/DTo.dart';
import 'package:eticaret/Features/SignUp/data/models/SignUpModel.dart';
import 'package:eticaret/Features/SignUp/domain/entities/UserData.dart';

class RemoteDTO implements DataSource
{
  @override
  Future<Either<Failures, SignUpModel>> SignUP(UserData userData) async {
    Dio dio=Dio();
    try{
      var resp=await dio.post("$signUpBaseURL$signUpEndPoint",data: {
        "name": userData.name,
        "email":userData.email,
        "password":userData.pass,
        "rePassword":userData.repass,
        "phone":userData.phone
      });
      SignUpModel signUpModel=SignUpModel.fromJson(resp.data);

      return Right(signUpModel);
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