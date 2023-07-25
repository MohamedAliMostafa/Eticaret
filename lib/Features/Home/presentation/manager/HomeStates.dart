import 'package:eticaret/Features/Home/data/models/AddToWatchList.dart';
import 'package:eticaret/Features/Home/data/models/AddtoChart.dart';
import 'package:eticaret/Features/Home/data/models/GetWatchList.dart';
import 'package:eticaret/Features/Home/data/models/ModelBrands.dart';
import 'package:eticaret/Features/Home/data/models/ModelCategory.dart';
import 'package:eticaret/Features/Home/data/models/ModelProduct.dart';
import 'package:eticaret/Features/Home/data/models/RemoveToWatchList.dart';

abstract class HomeStates {}
class HomeInit extends HomeStates{}
class HomeLoading extends HomeStates{}
class HomeCateSuccess extends HomeStates{
  ModelCategory category;

  HomeCateSuccess(this.category);
}
class HomeCateError extends HomeStates{
  String msg;

  HomeCateError(this.msg);
}
class HomeBrandsSuccess extends HomeStates{
  ModelBrands brands;

  HomeBrandsSuccess(this.brands);
}
class HomeBrandsError extends HomeStates{
  String msg;

  HomeBrandsError(this.msg);
}
class HomeProductSuccess extends HomeStates{
  ModelProduct brands;

  HomeProductSuccess(this.brands);

}
class HomeProductError extends HomeStates{
  String msg;

  HomeProductError(this.msg);
}
class ADDToCartLoading extends HomeStates{}
class AddtoCartSuccess extends HomeStates{
  AddToCart addToCart;

  AddtoCartSuccess(this.addToCart);

}
class AddtoCartError extends HomeStates{
  String msg;

  AddtoCartError(this.msg);
}
class AddtoWatchListSuccess extends HomeStates{
  AddToWatchList addToWatchList;

  AddtoWatchListSuccess(this.addToWatchList);

}
class AddtoWatchListError extends HomeStates{
  String msg;

  AddtoWatchListError(this.msg);
}
class RemovetoWatchListSuccess extends HomeStates{
  RemoveToWatchList removeToWatchList;

  RemovetoWatchListSuccess(this.removeToWatchList);

}
class RemoveoWatchListError extends HomeStates{
  String msg;

  RemoveoWatchListError(this.msg);
}
class GETWatchListSuccess extends HomeStates{
  GetWatchList getWatchList;

  GETWatchListSuccess(this.getWatchList);

}
class GetWatchListError extends HomeStates{
  String msg;

  GetWatchListError(this.msg);
}