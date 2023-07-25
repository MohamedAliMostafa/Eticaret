import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/SignUp/data/data_sources/DTo.dart';
import 'package:eticaret/Features/SignUp/data/models/SignUpModel.dart';
import 'package:eticaret/Features/SignUp/domain/entities/UserData.dart';

class LocalDTO implements  DataSource
{
  @override
  Future<Either<Failures, SignUpModel>> SignUP(UserData userData) {
    // TODO: implement SignUP
    throw UnimplementedError();
  }

}