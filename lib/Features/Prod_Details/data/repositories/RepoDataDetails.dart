import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Prod_Details/data/data_sources/DtoDetails.dart';
import 'package:eticaret/Features/Prod_Details/data/models/ModelDetails.dart';
import 'package:eticaret/Features/Prod_Details/domain/repositories/DetailRepoDomain.dart';

class RepoDataDetails implements RepoDomainDetails
{
  DetailsDto detailsDto;

  RepoDataDetails(this.detailsDto);

  @override
  Future<Either<Failures, ModelDetails>>  getSpProduct(String id) =>detailsDto.getSpProduct(id);

}