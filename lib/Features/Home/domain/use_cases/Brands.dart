import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Home/data/models/ModelBrands.dart';
import 'package:eticaret/Features/Home/domain/repositories/HomeRepoDomain.dart';

class BrandsUseCase
{
  HomeRepoDomain homeRepoDomain;

  BrandsUseCase(this.homeRepoDomain);

  Future<Either<Failures, ModelBrands>> Call() =>homeRepoDomain.getBrands();
}