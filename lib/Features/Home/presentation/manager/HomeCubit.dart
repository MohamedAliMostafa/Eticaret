import 'package:bloc/bloc.dart';
import 'package:eticaret/Core/Error/faiular.dart';
import 'package:eticaret/Core/utilis/Images.dart';
import 'package:eticaret/Features/Home/data/data_sources/HomeDto.dart';
import 'package:eticaret/Features/Home/data/models/ModelBrands.dart';
import 'package:eticaret/Features/Home/data/models/ModelCategory.dart';
import 'package:eticaret/Features/Home/data/models/ModelProduct.dart';
import 'package:eticaret/Features/Home/data/repositories/HomeRepoData.dart';
import 'package:eticaret/Features/Home/domain/repositories/HomeRepoDomain.dart';
import 'package:eticaret/Features/Home/domain/use_cases/Brands.dart';
import 'package:eticaret/Features/Home/domain/use_cases/CateUseCase.dart';
import 'package:eticaret/Features/Home/domain/use_cases/ProductUseCase.dart';
import 'package:eticaret/Features/Home/presentation/manager/HomeStates.dart';
import 'package:eticaret/Features/Home/presentation/pages/Tabs/HeartList.dart';
import 'package:eticaret/Features/Home/presentation/pages/Tabs/Home.dart';
import 'package:eticaret/Features/Home/presentation/pages/Tabs/Info.dart';
import 'package:eticaret/Features/Home/presentation/pages/Tabs/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/GetWatchList.dart';

class HomeCubit extends Cubit<HomeStates>
{
  HomeDto homeDto;
  HomeCubit(this.homeDto):super(HomeInit());
 static HomeCubit get(context)=>BlocProvider.of(context);


 //initailize

 int numofChart=0;

 int initIndex=0;
void  setIndex(int  indx)
{
  emit(HomeInit());
  initIndex=indx;
  emit(state);
}
  void  setTab()
  {
    emit(HomeInit());
    const HeartListTab();
    emit(state);
  }

List<Widget>tabs=[HomeTab(),ProductTab(),HeartListTab(),InfoTab()];
  List<String>images=[slid1,slid2,slid3];
  List<Widget>iconsBottomNav=const[Icon(Icons.home),Icon(Icons.apps_outlined),Icon(Icons.heart_broken_outlined),Icon(Icons.person)];


  //---------------------------------------------------------------------------------


  //Cate
List<Data>Cate=[];
  Future<void> getCate()
  async {
    emit(HomeLoading());

    HomeRepoDomain repoDomain=HomeRepoData(homeDto);
    CateUseCase cateUseCase =CateUseCase(repoDomain);
    var res= await cateUseCase.call();
    res.fold((l) => emit(HomeCateError(l.msg)), (r) {
      Cate=r.data??[];
      emit(HomeCateSuccess(r));
    });
  }

///-----------------------------

//Brand
  List<Dbrands>Brand=[];
  getBrands()async {
    emit(HomeLoading());
    HomeRepoDomain repoDomain=HomeRepoData(homeDto);
    BrandsUseCase brandsUseCase =BrandsUseCase(repoDomain);
    var res= await brandsUseCase.Call();
    res.fold((l) => emit(HomeBrandsError(l.msg)), (r) {
      Brand=r.data!.cast<Dbrands>();
      emit(HomeBrandsSuccess(r));

    });
  }

  //-------------end Brand



  //Proudct
  List<Dproduct>Product=[];
  getProduct()async {
    emit(HomeLoading());
    HomeRepoDomain repoDomain=HomeRepoData(homeDto);
    ProductUseCase productUseCase =ProductUseCase(repoDomain);
    var res= await productUseCase.call();
    res.fold((l) => emit(HomeProductError(l.msg)), (r) {
      Product=r.data!.cast<Dproduct>();
      emit(HomeProductSuccess(r));

    });
  }

  // end product

//add to Cart
  AddTocart(String prod_Id)async {
    emit(HomeLoading());
    HomeRepoDomain repoDomain=HomeRepoData(homeDto);
    CateUseCase productUseCase =CateUseCase(repoDomain);
    var res= await productUseCase.execute(prod_Id);
    res.fold((l) => emit(AddtoCartError(l.msg)), (r) {
      numofChart=r.numOfCartItems??0;
      emit(AddtoCartSuccess(r));


    });
  }


  //add to WatchList
  addtowatchList(String prod_Id)async {
    emit(HomeLoading());
    HomeRepoDomain repoDomain=HomeRepoData(homeDto);
    ProductUseCase productUseCase =ProductUseCase(repoDomain);
    var res= await productUseCase.execute(prod_Id);
    res.fold((l) => emit(AddtoWatchListError(l.msg)), (r) {
      emit(AddtoWatchListSuccess(r));
      getToWatchList();


    });
  }
  //Remove to WatchList
  removeToWatchList(String prod_Id)async {
    emit(HomeLoading());
    HomeRepoDomain repoDomain=HomeRepoData(homeDto);
    ProductUseCase productUseCase =ProductUseCase(repoDomain);
    var res= await productUseCase.remove(prod_Id);
    res.fold((l) => emit(RemoveoWatchListError(l.msg)), (r) {
      getToWatchList();
      emit(RemovetoWatchListSuccess(r));
      setTab();





    });
  }

  //GetWatchLIST

  List<DwatchList> ListWatchList=[];
  getToWatchList()async {
    //emit(HomeLoading());
    HomeRepoDomain repoDomain=HomeRepoData(homeDto);
    ProductUseCase productUseCase =ProductUseCase(repoDomain);
    var res= await productUseCase.getW();
    res.fold((l) {
      print(l.msg);
      emit(GetWatchListError(l.msg));
    }, (r) {
      print(r.count);
      ListWatchList=r.data!;
      emit(GETWatchListSuccess(r));
     // emit(HomeInit());




    });
  }
}