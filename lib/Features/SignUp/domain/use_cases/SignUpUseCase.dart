import 'package:dartz/dartz.dart';
import 'package:eticaret/Features/SignUp/data/models/SignUpModel.dart';
import 'package:eticaret/Features/SignUp/domain/entities/SignUpEntity.dart';
import 'package:eticaret/Features/SignUp/domain/repositories/repoDomain.dart';

import '../../../../Core/Error/faiular.dart';
import '../entities/UserData.dart';

class UseCase
{
RepoDomain repoDomain;

UseCase(this.repoDomain);

Future<Either<Failures,SignUpModel>>call(UserData userData)=>repoDomain.SignUP(userData);
}