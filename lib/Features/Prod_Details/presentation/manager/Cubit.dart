import 'package:bloc/bloc.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Features/Home/data/models/ModelProduct.dart';
import 'package:eticaret/Features/Prod_Details/data/data_sources/DtoDetails.dart';
import 'package:eticaret/Features/Prod_Details/data/repositories/RepoDataDetails.dart';
import 'package:eticaret/Features/Prod_Details/domain/repositories/DetailRepoDomain.dart';
import 'package:eticaret/Features/Prod_Details/domain/use_cases/ProdUserCase.dart';
import 'package:eticaret/Features/Prod_Details/presentation/manager/DetailsState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsStates>
{
  DetailsDto detailsDto;
  DetailsCubit(this.detailsDto):super(DetailsInit());
  static DetailsCubit get(context)=>BlocProvider.of(context);


num totalPrice=0;
  void  inc(int ?p)
  {
    emit(DetailsInit());
    count++;
    totalPrice=count*p!;
    emit(state);
  }
  void  dec(int?p)
  {
    emit(DetailsInit());
    if(count>1)
      {
        count--;
        totalPrice=count*p!;
      }

    emit(state);
  }
int count=1;
  Dproduct? OneProduct;
  Future<void> getDetails(String id)
  async {
    emit(DetailsLoading());
    RepoDomainDetails repoDomain=RepoDataDetails(detailsDto);
    ProdUseCase prodUseCase =ProdUseCase(repoDomain);
    var res= await prodUseCase.call(id);
    res.fold((l) =>emit(DetailsCateError(l.msg)), (r) {
      OneProduct=r.data!;
      totalPrice=OneProduct!.price??0;
      emit( DetailsCateSuccess(r));

    });
  }


}