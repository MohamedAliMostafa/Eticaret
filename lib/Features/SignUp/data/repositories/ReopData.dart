import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/SignUp/data/data_sources/DTo.dart';
import 'package:eticaret/Features/SignUp/data/models/SignUpModel.dart';
import 'package:eticaret/Features/SignUp/domain/repositories/repoDomain.dart';

import '../../domain/entities/UserData.dart';

class RepoData implements RepoDomain
{
  DataSource dataSource;

  RepoData(this.dataSource);

  @override
  Future<Either<Failures, SignUpModel>> SignUP(UserData userData)=> dataSource.SignUP(userData);

}