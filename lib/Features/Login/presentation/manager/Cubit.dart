import 'package:bloc/bloc.dart';
import 'package:eticaret/Features/Login/data/data_sources/LogDataSource.dart';
import 'package:eticaret/Features/Login/data/repositories/RepoDATALog.dart';
import 'package:eticaret/Features/Login/domain/repositories/repoDomainLog.dart';
import 'package:eticaret/Features/Login/domain/use_cases/USEcase.dart';
import 'package:eticaret/Features/Login/presentation/manager/States.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogCubit extends Cubit<LogStates>
{
  LogDataSource logDataSource;
  LogCubit(this.logDataSource): super(LogInitStates());

 static LogCubit get(context)=>BlocProvider.of(context);

  var EmailCont=TextEditingController();
  var passCont=TextEditingController();
  var emailF=TextEditingController();
  var codeCont=TextEditingController();
  var Email=TextEditingController();
  var NewPass=TextEditingController();


  String error="";

  Future<void> SignIn() async {
    emit(LogLoadingStates());
    RepoDlog repoDlog=RepoDataLog(logDataSource);
    UseCaseLog useCaseLog = UseCaseLog(repoDlog);
    var res=await useCaseLog.call(EmailCont.text, passCont.text);


    res.fold((l) => emit(LogErrorStates(l.msg)), (r) {
      emit(LogSuccessStates(r));
      print(r.message);
    });


  }

 void ForgetP()   async {
    emit(LogLoadingStates());
    RepoDlog repoDlog=RepoDataLog(logDataSource);
    UseCaseLog useCaseLog = UseCaseLog(repoDlog);
    var res=await useCaseLog.FP(emailF.text);
print(res.toString());

    res.fold((l) {
      emit(ForGetPassErrorStates(l.msg));
    }, (r) {
      emit(ForGetPassSuccessStates(r));

    });


  }
  void verifyPass()   async {
    emit(LogLoadingStates());
    RepoDlog repoDlog=RepoDataLog(logDataSource);
    UseCaseLog useCaseLog = UseCaseLog(repoDlog);
    var res=await useCaseLog.verf(codeCont.text);

    res.fold((l) => emit(VerifyErrorStates(l.msg)), (r) {
      emit(VerifySuccessStates(r));
    });


  }
  void resetP()   async {
    emit(LogLoadingStates());
    RepoDlog repoDlog=RepoDataLog(logDataSource);
    UseCaseLog useCaseLog = UseCaseLog(repoDlog);
    var res=await useCaseLog.resetps(Email.text,NewPass.text);

    res.fold((l) => emit(ResetErrorStates(l.msg)), (r) {
      emit(ResetSuccessStates(r));
    });


  }
}