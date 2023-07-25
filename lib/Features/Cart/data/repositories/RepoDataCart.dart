import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Cart/data/data_sources/DtoCart.dart';
import 'package:eticaret/Features/Cart/data/models/ModelCart.dart';
import 'package:eticaret/Features/Cart/domain/repositories/RepoDomainCart.dart';

import '../models/KeyReq.dart';
import '../models/ModelAuthRequest.dart';
import '../models/OrderID.dart';

class RepoDataCart implements RepoDomCart
{
  CartDto cartDto;

  RepoDataCart(this.cartDto);

  @override
  Future<Either<Failures, ModelCart>> GetCart()  =>cartDto.GetCart();
  Future<Either<Failures, ModelCart>> remove(String id)=>cartDto.remove(id);
  Future<Either<Failures, ModelAuthRequest>> AuthRequest()=>cartDto.AuthRequest();
  Future<Either<Failures, OrderId>> orderID()=>cartDto.orderID();
  Future<Either<Failures, KeyReq>> keyRequest()=>cartDto.keyRequest();

}