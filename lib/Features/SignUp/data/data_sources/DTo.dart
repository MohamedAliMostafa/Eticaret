import 'package:dartz/dartz.dart';
import 'package:eticaret/Features/SignUp/data/models/SignUpModel.dart';

import '../../../../Core/Error/faiular.dart';
import '../../domain/entities/UserData.dart';

abstract class DataSource
{
  Future<Either<Failures, SignUpModel>> SignUP(UserData userData) ;
}