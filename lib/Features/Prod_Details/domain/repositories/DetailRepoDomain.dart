import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Prod_Details/data/models/ModelDetails.dart';

abstract class RepoDomainDetails
{
  Future<Either<Failures, ModelDetails>> getSpProduct(String id);
}