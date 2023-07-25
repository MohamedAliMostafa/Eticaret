import 'package:dartz/dartz.dart';

import '../../../../Core/Error/faiular.dart';
import '../../data/models/KeyReq.dart';
import '../../data/models/ModelAuthRequest.dart';
import '../../data/models/ModelCart.dart';
import '../../data/models/OrderID.dart';

abstract class RepoDomCart
{
  Future<Either<Failures, ModelCart>> GetCart();
  Future<Either<Failures, ModelCart>> remove(String id);
  Future<Either<Failures, ModelAuthRequest>> AuthRequest();
  Future<Either<Failures, OrderId>> orderID();
  Future<Either<Failures, KeyReq>> keyRequest( );
}