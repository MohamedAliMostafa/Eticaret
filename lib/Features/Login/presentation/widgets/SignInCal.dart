import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eticaret/Core/utilis/CachHelper.dart';
import 'package:eticaret/Core/utilis/Widgets/Widgets.dart';
import 'package:eticaret/Features/Home/presentation/manager/HomeCubit.dart';
import 'package:eticaret/Features/Home/presentation/pages/Home.dart';
import 'package:eticaret/Features/Login/data/data_sources/RemoteData.dart';
import 'package:eticaret/Features/Login/presentation/manager/Cubit.dart';
import 'package:eticaret/Features/Login/presentation/manager/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utilis/Colors.dart';

class SignInCal extends StatefulWidget {


  @override
  State<SignInCal> createState() => _SignInCalState();
}

class _SignInCalState extends State<SignInCal> {
  bool t=true;
  bool obs=true;
  var ke=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogCubit(RemoteDataLog()),
      child: BlocConsumer<LogCubit,LogStates> (
        listener: (context, state) {
          if(state is LogLoadingStates)
          {
            const Center(child: CircularProgressIndicator());
          }
          else if(state is LogErrorStates)
          {

            showDialog(context: context, builder: (context) {
              return  AlertDialog(title: const Text("Error"),
                content: Text(state.msg),
              );
            },);
          }
          else if(state is LogSuccessStates)
            {
              CacheHelper.saveData(key: "User", value: state.modelLog.token);
             // CacheHelper.saveData(key: "Login", value: LogCubit.get(context).Email.text);
              Navigator.pushReplacementNamed(context, Home.RouteName);
            }
          else if(state is ForGetPassSuccessStates)
          {
            AwesomeDialog(
              dismissOnTouchOutside: false,
              context: context,
              dialogType: DialogType.infoReverse,
              animType: AnimType.bottomSlide,

              body: defaultTextform(hintText: " please enter your Code",type: TextInputType.number,con: LogCubit.get(context).codeCont,vali: (p0) {
                if(p0==null || p0.isEmpty)
                {

                  return "Rquried field ";
                }
                return null;
              },),
              title: 'Dialog Title',
              desc: "Email",
              btnOkOnPress: () {
                LogCubit.get(context).verifyPass();


              },
            ).show();
          }
          else if(state is VerifySuccessStates)
          {
            AwesomeDialog(
              dismissOnTouchOutside: false,
              context: context,
              dialogType: DialogType.infoReverse,
              animType: AnimType.bottomSlide,

              body: Column(
                children: [
                  defaultTextform(hintText: " please enter your Email",type: TextInputType.emailAddress,con: LogCubit.get(context).Email),
                  defaultTextform(hintText: " please enter New Password",type: TextInputType.visiblePassword,con: LogCubit.get(context).NewPass),
                ],
              ),
              title: 'Dialog Title',
              desc: "Email",
              btnOkOnPress: () {
                LogCubit.get(context).resetP();


              },
            ).show();
          }
          else if(state is ResetSuccessStates)
          {
            AwesomeDialog(
              dismissOnTouchOutside: false,
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.bottomSlide,

              body: Text("Congrats"),
              title: 'Dialog Title',
              desc: "Email",
              btnOkOnPress: () {
                LogCubit.get(context).resetP();


              },
            ).show();
          }

        },
        builder:(context, state) {
          return Form(
            key: ke,
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultText("Email"),
                  defaultTextform(
                    con: LogCubit.get(context).EmailCont,
                    hintText: "enter your Email",type: TextInputType.emailAddress,vali: (p0) {
                    final bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(p0!);
                    if(p0==null || p0.isEmpty)
                    {
                      return "Rquried field ";
                    }
                    else if(!emailValid)
                    {
                      return "email vaild";
                    }
                    return null;
                  },),
                  defaultText("Password"),
                  defaultTextform(vali:(p0) {
                    if(p0!.isEmpty)
                    {
                      return "requried Field";
                    }
                    return null;
                  },con: LogCubit.get(context).passCont, Ico:  IconButton(icon:obs==true?const Icon(Icons.visibility_off):const Icon(Icons.visibility) ,onPressed: () {
                    setState(() {
                      obs=!obs;
                    });

                  },), hintText: "enter your Password",type: TextInputType.visiblePassword,obs: obs),
                  InkWell(
                    onTap: () {
                      AwesomeDialog(
                        dismissOnTouchOutside: false,
                          context: context,
                          dialogType: DialogType.question,
                          animType: AnimType.bottomSlide,
                          body: defaultTextform(hintText: "enter your Email",type: TextInputType.emailAddress,con: LogCubit.get(context).emailF,vali: (p0) {
                            final bool emailValid =
                            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(p0!);
                            if(p0==null || p0.isEmpty)
                            {
                              return "Rquried field ";
                            }
                            else if(!emailValid)
                            {
                              return "email vaild";
                            }
                            return null;
                          },),
                      enableEnterKey: true,

                      btnOkOnPress: () {
                              LogCubit.get(context).ForgetP();


                      },
                      ).show();

                    },
                    child: Container(
                      margin: REdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        width: double.infinity,
                        child: Text("Forgot Password ?",textAlign: TextAlign.end,style: TextStyle(fontWeight: FontWeight.bold,color: primary),),
                        ),
                  ),

                  SizedBox(height: 15.h,),
                   Container(
                     margin: REdgeInsets.symmetric(horizontal: 50),
                     child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r)
                              )
                          ),
                          onPressed: ()   {
                            if(ke.currentState!.validate()){
                               LogCubit.get(context).SignIn();

                            }
                          }, child: Padding(
                        padding:  REdgeInsets.all(16.0),
                        child: const Center(child: Text("Login ")),
                      )),
                   ),
                  
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
