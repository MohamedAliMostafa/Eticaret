import 'package:eticaret/Core/utilis/Colors.dart';
import 'package:eticaret/Core/utilis/Widgets/Widgets.dart';
import 'package:eticaret/Features/Login/presentation/pages/Login.dart';
import 'package:eticaret/Features/SignUp/data/data_sources/Remote.dart';
import 'package:eticaret/Features/SignUp/presentation/manager/Cubit.dart';
import 'package:eticaret/Features/SignUp/presentation/manager/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpCol extends StatefulWidget {

  @override
  State<SignUpCol> createState() => _SignUpColState();
}

class _SignUpColState extends State<SignUpCol> {
bool obs=true;
var ke=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SignUpCubit,SignUpStates> (
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
        builder:(context, state) {
          return Form(
            key: ke,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defaultText("Full Name"),
                defaultTextform(
                  con: SignUpCubit.get(context).nameCont,
                  hintText: "enter your full name",type: TextInputType.name,vali: (p0) {
                  if(p0!.isEmpty)
                  {
                    return "Requried faild";
                  }
                },),
                defaultText("Mobile Number"),
                defaultTextform(
                  con: SignUpCubit.get(context).phoneCont,
                  hintText: "enter your mobile no",type: TextInputType.phone,vali: (p0) {
                  if(p0!.length<11 || p0.length>11)
                  {
                    return "please enter 11 num";
                  }
                  else if(p0.isEmpty)
                    {
                      return "requried Field";
                    }
                  return null;
                },),
                defaultText("E-mail address"),
                defaultTextform(con: SignUpCubit.get(context).emailCont,hintText: "enter your email address",type: TextInputType.emailAddress,vali: (p0) {
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
                },con: SignUpCubit.get(context).passCont, Ico:  IconButton(icon:obs==true?const Icon(Icons.visibility_off):const Icon(Icons.visibility) ,onPressed: () {
                  setState(() {
                    obs=!obs;
                  });

                },), hintText: "enter your Password",type: TextInputType.visiblePassword,obs: obs),

               SizedBox(height: 15.h,),
                Padding(
                  padding:  REdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r)
                        )
                      ),
                      onPressed: ()  {
                    if(ke.currentState!.validate()){
                      SignUpCubit.get(context).SignUP();

                    }
                  }, child: Padding(
                    padding:  REdgeInsets.all(16.0),
                    child: const Center(child: Text("Sign UP")),
                  )),
                )
              ],
            ),
          );
        },
      );
  }
}
