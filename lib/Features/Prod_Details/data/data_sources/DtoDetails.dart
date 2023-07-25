import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Core/api/BaseURL.dart';
import 'package:eticaret/Core/api/EndPoints.dart';
import 'package:eticaret/Features/Prod_Details/data/models/ModelDetails.dart';

abstract class DetailsDto
{
  Future<Either<Failures, ModelDetails>>  getSpProduct(String id);

}
class RemoteDtoDetails implements DetailsDto
{
  @override
  Future<Either<Failures, ModelDetails>> getSpProduct(String id) async {
    Dio dio=Dio();
    try{
      var resp=await dio.get("$signUpBaseURL$detailsEndPoint$id");
      print(resp.data.toString());
      ModelDetails details=ModelDetails.fromJson(resp.data);
      return Right(details);
    }
    catch(e)
    {
      return left(ServerError(e.toString()));
    }
  }





}
class LocalDto implements DetailsDto
{
  @override
  Future<Either<Failures, ModelDetails>> getSpProduct(String id) {
    // TODO: implement getSpProduct
    throw UnimplementedError();
  }


}