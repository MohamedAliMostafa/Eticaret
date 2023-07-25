import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Home/data/models/ModelCategory.dart';
import 'package:eticaret/Features/Home/domain/repositories/HomeRepoDomain.dart';

import '../../data/models/AddtoChart.dart';

class CateUseCase
{
  HomeRepoDomain repoDomain;

  CateUseCase(this.repoDomain);

  Future<Either<Failures, ModelCategory>>  call()=>repoDomain.GetCategory();
  Future<Either<Failures, AddToCart>> execute(String productId)=>repoDomain.addToCart(productId);
}