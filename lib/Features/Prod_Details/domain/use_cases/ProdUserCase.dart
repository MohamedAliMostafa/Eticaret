import 'package:dartz/dartz.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Prod_Details/data/models/ModelDetails.dart';
import 'package:eticaret/Features/Prod_Details/domain/repositories/DetailRepoDomain.dart';

class ProdUseCase
{
RepoDomainDetails repoDomainDetails;

ProdUseCase(this.repoDomainDetails);

Future<Either<Failures, ModelDetails>> call(String id) => repoDomainDetails.getSpProduct(id);
}