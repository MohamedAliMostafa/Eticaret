import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/SignUp/data/models/SignUpModel.dart';

import '../entities/UserData.dart';

abstract class RepoDomain
{
  Future<Either<Failures,SignUpModel>>SignUP(UserData userData);
}