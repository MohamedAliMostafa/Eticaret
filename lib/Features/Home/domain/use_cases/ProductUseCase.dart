import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Home/data/models/ModelProduct.dart';
import 'package:eticaret/Features/Home/domain/repositories/HomeRepoDomain.dart';

import '../../data/models/AddToWatchList.dart';
import '../../data/models/GetWatchList.dart';
import '../../data/models/RemoveToWatchList.dart';

class ProductUseCase
{
  HomeRepoDomain homeRepoDomain ;

  ProductUseCase(this.homeRepoDomain);

  Future<Either<Failures, ModelProduct>>  call()=>homeRepoDomain.getProduct();
  Future<Either<Failures, AddToWatchList>> execute(String productId)=>homeRepoDomain.addToWList(productId);
  Future<Either<Failures, RemoveToWatchList>> remove(String productId)=>homeRepoDomain.removeToWList(productId);
  Future<Either<Failures,GetWatchList>> getW()=>homeRepoDomain.getWatchList();
}