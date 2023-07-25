import 'package:eticaret/Features/Prod_Details/data/models/ModelDetails.dart';

abstract class DetailsStates {}
class DetailsInit extends DetailsStates{}
class DetailsLoading extends DetailsStates{}
class DetailsCateSuccess extends DetailsStates{
  ModelDetails category;

  DetailsCateSuccess(this.category);
}
class DetailsCateError extends DetailsStates{
  String msg;

  DetailsCateError(this.msg);
}