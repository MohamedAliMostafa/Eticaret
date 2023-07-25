import 'package:eticaret/Features/Cart/data/models/KeyReq.dart';
import 'package:eticaret/Features/Cart/data/models/ModelAuthRequest.dart';
import 'package:eticaret/Features/Cart/data/models/ModelCart.dart';
import 'package:eticaret/Features/Cart/data/models/OrderID.dart';

abstract class CartStates {}
class CartInit extends CartStates{}
class CartStatesLoading extends CartStates{}
class CartStatesSuccess extends CartStates{
  ModelCart modelCart;

  CartStatesSuccess(this.modelCart);
}
class CartStatesError extends CartStates{
  String msg;

  CartStatesError(this.msg);
}
class RemoveStatesSuccess extends CartStates{
  ModelCart modelCart;

  RemoveStatesSuccess(this.modelCart);
}
class RemoveStatesError extends CartStates{
  String msg;

  RemoveStatesError(this.msg);
}
class AUthStatesLoading extends CartStates{}
class AuthReqStatesSuccess extends CartStates{
  ModelAuthRequest modelAuthRequest;

  AuthReqStatesSuccess(this.modelAuthRequest);
}
class AuthReqStatesError extends CartStates{
  String msg;

  AuthReqStatesError(this.msg);
}
class OrderIDStatesLoading extends CartStates{}
class OrderIDStatesSuccess extends CartStates{
  OrderId OD;

  OrderIDStatesSuccess(this.OD);
}
class OrderIDStatesError extends CartStates{
  String msg;

  OrderIDStatesError(this.msg);
}
class KEYhStatesLoading extends CartStates{}
class keyRStatesSuccess extends CartStates{
  KeyReq OD;

  keyRStatesSuccess(this.OD);
}
class KeyReqStatesError extends CartStates{
  String msg;

  KeyReqStatesError(this.msg);
}