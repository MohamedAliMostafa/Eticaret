import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eticaret/Core/api/EndPoints.dart';
import 'package:eticaret/Core/utilis/CachHelper.dart';
import 'package:eticaret/Core/utilis/Strings.dart';
import 'package:eticaret/Features/Cart/data/models/KeyReq.dart';
import 'package:eticaret/Features/Cart/data/models/ModelAuthRequest.dart';
import 'package:eticaret/Features/Cart/data/models/OrderID.dart';

import '../../../../Core/Error/faiular.dart';
import '../../../../Core/api/BaseURL.dart';
import '../models/ModelCart.dart';

abstract class CartDto
{
  Future<Either<Failures, ModelCart>> GetCart();
  Future<Either<Failures, ModelCart>> remove(String id);
  Future<Either<Failures, ModelAuthRequest>> AuthRequest();
  Future<Either<Failures, OrderId>> orderID();
  Future<Either<Failures, KeyReq>> keyRequest( );


}
class RemoteDtoCart implements CartDto
{


  @override
  Future<Either<Failures, ModelCart>> GetCart() async {
    Dio dio=Dio();
    try{
      var resp=await dio.get("$signUpBaseURL$getCartEndPoint",options: Options(
        headers: {
          "token":CacheHelper.getData("User")
        }
      ));
      ModelCart modelCart=ModelCart.fromJson(resp.data);
      return Right(modelCart);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ModelCart>> remove(String id) async {
    Dio dio=Dio();
    try{
      var resp=await dio.delete("$signUpBaseURL$getCartEndPoint/$id",options: Options(
          headers: {
            "token":CacheHelper.getData("User")
          }
      ));
      ModelCart modelCart=ModelCart.fromJson(resp.data);

      return Right(modelCart);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ModelAuthRequest>> AuthRequest() async {
    Dio dio=Dio();
    try{
      var resp=await dio.post("$BaseUrlPayment$authReq",data: {
        "api_key":api_keyPayment
      });
      ModelAuthRequest modelAuthRequest=ModelAuthRequest.fromJson(resp.data);
      authToken=modelAuthRequest.token!;
      print(authToken);
      return Right(modelAuthRequest);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failures, OrderId>> orderID() async {
    Dio dio=Dio();
    try{
      var resp=await dio.post("$BaseUrlPayment$OrderIdEndPoint",data: {
        "auth_token":  authToken,
        "delivery_needed": "false",
        "amount_cents": "12350",
        "currency": "EGP",
        "items": []
      });
      OrderId orderId=OrderId.fromJson(resp.data);
      Order_Id=orderId.id.toString();
      return Right(orderId);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failures, KeyReq>> keyRequest() async {
    Dio dio=Dio();
    try{

      var resp=await dio.post("$BaseUrlPayment$keyReqEndpoint",data:{
        {
          "auth_token": authToken,
          "amount_cents": "12530",
          "expiration": 3600,
          "order_id": Order_Id,
          "billing_data": {
            "apartment": "NA",
            "email": "mohamed@gmail.com",
            "floor": "NA",
            "first_name": "mohamed",
            "street": "NA",
            "building": "NA",
            "phone_number": "+86(8)9135210487",
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": "mostafa",
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": integrationId
        }
      },
        options: Options(headers:  {'Content-Type':'application/json'})
      );

      KeyReq keyReq=KeyReq.fromJson(resp.data);
      keyRequ=keyReq.token!;
      print(keyRequ);
      return Right(keyReq);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }
  }





}
class LocalDtoCart implements CartDto
{


  @override
  Future<Either<Failures, ModelCart>> GetCart() {
    // TODO: implement GetCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, ModelCart>> remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, ModelAuthRequest>> AuthRequest() {
    // TODO: implement AuthRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, OrderId>> orderID() {
    // TODO: implement orderID
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, KeyReq>> keyRequest( ) {
    // TODO: implement keyRequest
    throw UnimplementedError();
  }


}