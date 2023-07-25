import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Home/data/data_sources/HomeDto.dart';
import 'package:eticaret/Features/Home/data/models/AddtoChart.dart';
import 'package:eticaret/Features/Home/data/models/ModelBrands.dart';
import 'package:eticaret/Features/Home/data/models/ModelCategory.dart';
import 'package:eticaret/Features/Home/data/models/ModelProduct.dart';
import 'package:eticaret/Features/Home/domain/repositories/HomeRepoDomain.dart';

import '../models/AddToWatchList.dart';
import '../models/GetWatchList.dart';
import '../models/RemoveToWatchList.dart';

class HomeRepoData  implements HomeRepoDomain
{
  HomeDto homeDto;

  HomeRepoData(this.homeDto);

  @override
  Future<Either<Failures,ModelCategory>> GetCategory() =>homeDto.GetCategory();

  @override
  Future<Either<Failures, ModelBrands>> getBrands()=>homeDto.getBrands();

  @override
  Future<Either<Failures, ModelProduct>> getProduct()=>homeDto.getProduct();

  @override
  Future<Either<Failures, AddToCart>> addToCart(String productId) =>homeDto.addToCart(productId);
  Future<Either<Failures, AddToWatchList>> addToWList(String productId)=>homeDto.addToWList(productId);
  Future<Either<Failures, RemoveToWatchList>> removeToWList(String productId)=>homeDto.removeToWList(productId);
  Future<Either<Failures,GetWatchList>> getWatchList()=>homeDto.getWatchList();





}