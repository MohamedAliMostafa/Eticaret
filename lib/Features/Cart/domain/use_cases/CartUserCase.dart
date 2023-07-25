import 'package:dartz/dartz.dart';
import 'package:eticaret/Features/Cart/data/models/ModelCart.dart';
import 'package:eticaret/Features/Cart/domain/repositories/RepoDomainCart.dart';

import '../../../../Core/Error/faiular.dart';
import '../../data/models/KeyReq.dart';
import '../../data/models/ModelAuthRequest.dart';
import '../../data/models/OrderID.dart';

class CartUsecase
{
  RepoDomCart repoDomCart;


  CartUsecase(this.repoDomCart);

  Future<Either<Failures, ModelCart>> Call() =>repoDomCart.GetCart();
  Future<Either<Failures, ModelCart>> remov(String id)=>repoDomCart.remove(id);
  Future<Either<Failures, ModelAuthRequest>> AuthR()=>repoDomCart.AuthRequest();
  Future<Either<Failures, OrderId>> ordID()=>repoDomCart.orderID();
  Future<Either<Failures, KeyReq>> keqst( )=>repoDomCart.keyRequest();
}