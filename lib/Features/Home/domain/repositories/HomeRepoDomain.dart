import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Home/data/models/ModelBrands.dart';
import 'package:eticaret/Features/Home/data/models/ModelCategory.dart';
import 'package:eticaret/Features/Home/data/models/ModelProduct.dart';

import '../../data/models/AddToWatchList.dart';
import '../../data/models/AddtoChart.dart';
import '../../data/models/GetWatchList.dart';
import '../../data/models/RemoveToWatchList.dart';

abstract class HomeRepoDomain{

  Future<Either<Failures, ModelCategory>>GetCategory();
  Future<Either<Failures, ModelBrands>>getBrands();
  Future<Either<Failures, ModelProduct>>getProduct();
  Future<Either<Failures, AddToCart>> addToCart(String productId);
  Future<Either<Failures, AddToWatchList>> addToWList(String productId);
  Future<Either<Failures, RemoveToWatchList>> removeToWList(String productId);
  Future<Either<Failures,GetWatchList>> getWatchList() ;
}