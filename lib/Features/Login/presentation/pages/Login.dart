import 'package:eticaret/Core/utilis/Colors.dart';
import 'package:eticaret/Features/Login/presentation/widgets/SignInCal.dart';
import 'package:eticaret/Features/SignUp/presentation/pages/SignUP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  static const String RouteName="Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: REdgeInsets.only(top: 85,left: 30),
              width: 300.w,
              height: 200.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange,width: 5.w),
                  borderRadius: BorderRadius.circular(32.r),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/ima1.webp"))
              ),
            ),
            SignInCal(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Don't Have an a account ?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
                InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignUp.RouteName);
                    },
                    child: Text("Create Account",style: TextStyle(fontWeight: FontWeight.bold,color: primary),)),
              ],),
            )

          ],
        ),


    );
  }
}
