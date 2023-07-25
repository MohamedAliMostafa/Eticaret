
import 'package:eticaret/Core/utilis/CachHelper.dart';
import 'package:eticaret/Features/Cart/presentation/pages/Cart.dart';
import 'package:eticaret/Features/Home/presentation/pages/Home.dart';
import 'package:eticaret/Features/Login/presentation/pages/Login.dart';
import 'package:eticaret/Features/Prod_Details/presentation/pages/Details.dart';
import 'package:eticaret/Features/SignUp/presentation/pages/SignUP.dart';
import 'package:eticaret/SplashScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        var user=CacheHelper.getData("User");
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute:user!=null?Home.RouteName:Splash.RouteName ,
          routes: {
            SignUp.RouteName:(context)=>SignUp(),
            Login.RouteName:(context)=>Login(),
            Home.RouteName:(context)=>Home(),
            Details.routeName:(context)=>Details(),
            CartScreen.RouteName:(context)=>CartScreen(),
            Splash.RouteName:(context)=>Splash(),

          },
        );
      },

    );
  }
}
