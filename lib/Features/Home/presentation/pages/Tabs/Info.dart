import 'package:eticaret/Core/utilis/Widgets/Widgets.dart';
import 'package:eticaret/Features/Login/presentation/manager/Cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utilis/CachHelper.dart';
import '../../../../Login/presentation/pages/Login.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: REdgeInsets.only(top: 30,left: 30,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Eticaret",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30.sp),),
                IconButton(onPressed: (){
                  CacheHelper.RemoveData("User");
                  Navigator.pushNamedAndRemoveUntil(context, Login.RouteName, (route) => false);
                }, icon: const Icon(Icons.logout_outlined,color: Color(
                    0xfffb0303),)),
              ],
            ),
            Text("Welcome,Mohamed",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Mohamed123789@gmail.com",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp,color: Colors.blue),),
            SizedBox(height: 40,),
            defaultText("Your Full Name"),
            defaultTextf("Mohamed ali mostafa"),
            defaultText("Your E_mail"),
            defaultTextf("Mohamed123789@gmail.com"),
            defaultText("Your Mobile "),
            defaultTextf("0114243555"),
            defaultText("Your Address "),
            defaultTextf("Dar Elslam - Cairo "),


          ],
        ),
      ),
    );
  }
}
