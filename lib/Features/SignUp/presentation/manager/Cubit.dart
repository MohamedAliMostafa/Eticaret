import 'package:bloc/bloc.dart';
import 'package:eticaret/Features/SignUp/data/data_sources/DTo.dart';
import 'package:eticaret/Features/SignUp/data/repositories/ReopData.dart';
import 'package:eticaret/Features/SignUp/domain/entities/UserData.dart';
import 'package:eticaret/Features/SignUp/domain/repositories/repoDomain.dart';
import 'package:eticaret/Features/SignUp/domain/use_cases/SignUpUseCase.dart';
import 'package:eticaret/Features/SignUp/presentation/manager/States.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/SignUpModel.dart';

class SignUpCubit extends Cubit<SignUpStates>
{
  DataSource dataSource;
  SignUpCubit(this.dataSource):super(SignUpInit());
  static SignUpCubit  get(context)=>BlocProvider.of(context);
  var nameCont=TextEditingController();
  var emailCont=TextEditingController();
  var passCont=TextEditingController();
  var phoneCont=TextEditingController();



  Future<void> SignUP()
  async {
    emit(SignUpLoading());
    UserData userData=UserData(name: nameCont.text, email: emailCont.text,repass: passCont.text, pass: passCont.text, phone:phoneCont.text);
    RepoDomain repoDomain=RepoData(dataSource);
    UseCase useCase=UseCase(repoDomain);
    var res=await useCase.call(userData);
    res.fold((l) {
      print("sdasdasdassdas${l.toString()}");
      emit(SignUpError(l.msg));

    },(r) =>emit(SignUpSuccess(r)));
  }
}