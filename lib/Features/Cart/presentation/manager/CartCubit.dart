import 'package:eticaret/Features/Cart/data/data_sources/DtoCart.dart';
import 'package:eticaret/Features/Cart/domain/repositories/RepoDomainCart.dart';
import 'package:eticaret/Features/Cart/domain/use_cases/CartUserCase.dart';
import 'package:eticaret/Features/Cart/presentation/manager/CartStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/RepoDataCart.dart';

class CartCubit extends Cubit<CartStates> {
  CartDto cartDto;

  CartCubit(this.cartDto) :super(CartInit());

  static CartCubit get(context) => BlocProvider.of(context);


  Future<void> getCarts()
  async {
    emit(CartStatesLoading());
    RepoDomCart repoDomain=RepoDataCart(cartDto);
    CartUsecase cateUseCase =CartUsecase(repoDomain);
    var res= await cateUseCase.Call();
    res.fold((l) {
      emit(CartStatesError(l.msg));
    }, (r) {
      emit(CartStatesSuccess(r));
    });
  }
  Future<void> remove(String id)
  async {
    emit(CartStatesLoading());
    RepoDomCart repoDomain=RepoDataCart(cartDto);
    CartUsecase cateUseCase =CartUsecase(repoDomain);
    var res= await cateUseCase.remov(id);
    res.fold((l) => emit(RemoveStatesError(l.msg)), (r) {
      emit(CartStatesSuccess(r));
    });
  }


  ///payment
  Future<void> getAuthReq()
  async {
    emit(AUthStatesLoading());
    RepoDomCart repoDomain=RepoDataCart(cartDto);
    CartUsecase cateUseCase =CartUsecase(repoDomain);
    var res= await cateUseCase.AuthR();
    res.fold((l) {
      emit(AuthReqStatesError(l.msg));
    }, (r) {
      emit(AuthReqStatesSuccess(r));
    });
  }
  Future<void> getOrderID()
  async {
    emit(OrderIDStatesLoading());
    RepoDomCart repoDomain=RepoDataCart(cartDto);
    CartUsecase cateUseCase =CartUsecase(repoDomain);
    var res= await cateUseCase.ordID();
    res.fold((l) {
print(l.msg);
      emit(OrderIDStatesError(l.msg));
    }, (r) {
      emit(OrderIDStatesSuccess(r));
    });
  }
  Future<void> getKeyReq()
  async {
    emit(KEYhStatesLoading());
    RepoDomCart repoDomain=RepoDataCart(cartDto);
    CartUsecase cateUseCase =CartUsecase(repoDomain);
    var res= await cateUseCase.keqst();
    res.fold((l) {
print(l.msg);
      emit(KeyReqStatesError(l.msg));
    }, (r) {
      emit(keyRStatesSuccess(r));
    });
  }


}