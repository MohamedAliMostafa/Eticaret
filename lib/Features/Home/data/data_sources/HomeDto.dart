import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Core/api/BaseURL.dart';
import 'package:eticaret/Core/api/EndPoints.dart';
import 'package:eticaret/Core/utilis/CachHelper.dart';
import 'package:eticaret/Features/Home/data/models/GetWatchList.dart';
import 'package:eticaret/Features/Home/data/models/ModelBrands.dart';
import 'package:eticaret/Features/Home/data/models/ModelCategory.dart';
import 'package:eticaret/Features/Home/data/models/ModelProduct.dart';

import '../models/AddToWatchList.dart';
import '../models/AddtoChart.dart';
import '../models/RemoveToWatchList.dart';

abstract class HomeDto
{
  Future<Either<Failures,ModelCategory>> GetCategory() ;
  Future<Either<Failures,ModelBrands>> getBrands() ;
  Future<Either<Failures,ModelProduct>> getProduct() ;
  Future<Either<Failures, AddToCart>> addToCart(String productId);
  Future<Either<Failures, AddToWatchList>> addToWList(String productId);
  Future<Either<Failures, RemoveToWatchList>> removeToWList(String productId);
  Future<Either<Failures,GetWatchList>> getWatchList() ;

}
class RemoteDto implements HomeDto
{

  // Cate gory
  @override
  Future<Either<Failures, ModelCategory>> GetCategory() async {
    Dio dio=Dio();
    try{
      var resp=await dio.get("$signUpBaseURL$categoryEndPoint");
      ModelCategory modelCategory=ModelCategory.fromJson(resp.data);
      return Right(modelCategory);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }

  }

  //end Cate
  //--------------------------------------------------------------------------


  //Brands
  @override
  Future<Either<Failures, ModelBrands>> getBrands() async {
    Dio dio=Dio();
    try{
      var resp=await dio.get("$signUpBaseURL$brandsEndPoint");
      ModelBrands modelBrands=ModelBrands.fromJson(resp.data);
      return Right(modelBrands);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }
  }
  //end Brands
//---------------------------------------------------


  //Product
  @override
  Future<Either<Failures, ModelProduct>> getProduct() async {
    Dio dio=Dio();
    try{
      var resp=await dio.get("$signUpBaseURL$productEndPoint");

      ModelProduct modelProduct=ModelProduct.fromJson(resp.data);
      return Right(modelProduct);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }
  }

  //end Proudct
  //----------------------------------------------------------------------------

  //AddtoCart
  @override
  Future<Either<Failures, AddToCart>> addToCart(String productId) async {
    Dio dio=Dio();
    try{
      var resp=await dio.post("$signUpBaseURL$addCartEndPoint",data: {
        "productId":productId
      },options: Options(headers: {
        "token":CacheHelper.getData("User")
      }));
      AddToCart addToCart=AddToCart.fromJson(resp.data);
      return Right(addToCart);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }
  }
// end addCart
//----------------------------------------------------------------------------



//Watch List
  @override
  Future<Either<Failures, AddToWatchList>> addToWList(String productId) async {
    Dio dio=Dio();
    try{
      var resp=await dio.post("$signUpBaseURL$WatchListEndPoint",data: {
        "productId":productId
      },options: Options(headers: {
        "token":CacheHelper.getData("User")
      }));
      AddToWatchList addToWatchList=AddToWatchList.fromJson(resp.data);
      return Right(addToWatchList);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failures, RemoveToWatchList>> removeToWList(String productId) async {
    Dio dio=Dio();
    try{
      var resp=await dio.delete("$signUpBaseURL$WatchListEndPoint/$productId",
          options: Options(headers: {
        "token":CacheHelper.getData("User")
      }));
      RemoveToWatchList removeToWatchList=RemoveToWatchList.fromJson(resp.data);
      return Right(removeToWatchList);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetWatchList>> getWatchList() async {
    Dio dio=Dio();
    try{
      var resp=await dio.get("$signUpBaseURL$WatchListEndPoint",
          options: Options(headers: {
            "token":CacheHelper.getData("User")
          }));
      GetWatchList getWatchList=GetWatchList.fromJson(resp.data);
      return Right(getWatchList);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }
  }

  //end watch List
//----------------------------//

}
class LocalDto implements HomeDto
{
  @override
  Future<Either<Failures, ModelCategory>> GetCategory() {
    // TODO: implement GetCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, ModelBrands>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, ModelProduct>> getProduct() {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, AddToCart>> addToCart(String productId) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, AddToWatchList>> addToWatchList(String productId) {
    // TODO: implement addToWatchList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, AddToWatchList>> addToWList(String productId) {
    // TODO: implement addToWList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, RemoveToWatchList>> removeToWList(String productId) {
    // TODO: implement removeToWList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, GetWatchList>> getWatchList() {
    // TODO: implement getWatchList
    throw UnimplementedError();
  }

}