import 'package:eticaret/Core/utilis/Colors.dart';
import 'package:eticaret/Core/utilis/Widgets/Widgets.dart';
import 'package:eticaret/Features/SignUp/data/data_sources/Remote.dart';
import 'package:eticaret/Features/SignUp/presentation/manager/Cubit.dart';
import 'package:eticaret/Features/SignUp/presentation/manager/States.dart';
import 'package:eticaret/Features/SignUp/presentation/widgets/SignUpCol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utilis/CachHelper.dart';
import '../../../Login/presentation/pages/Login.dart';

class SignUp extends StatelessWidget {
static const String RouteName="up";
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (context) => SignUpCubit(RemoteDTO()),
      child: BlocConsumer<SignUpCubit,SignUpStates>(
      listener: (context, state) {
      if(state is SignUpLoading)
      {
        const Center(child: CircularProgressIndicator());
      }
      else if(state is SignUpError)
      {
        showDialog(context: context, builder: (context) {
          return  AlertDialog(title: const Text("Error"),
            content: Text(state.msg),
          );
        },);
      }
      else if(state is SignUpSuccess)
      {
        Navigator.pushReplacementNamed(context, Login.RouteName);
      }

      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: background,
          body: Column(
            children: [
              Container(
                margin: REdgeInsets.only(top: 85,left: 30),
                width: 250.w,
                height: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("Sign Up",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: primary),)),
                    Icon(Icons.person,color: primary,size: 40,),
                  ],
                ),
              ),
              SignUpCol(),
            ],
          ),

        );
      },
      )

      ,);
  }
}
