import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CachHelper.dart';
import '../Strings.dart';

Widget defaultTextform({TextEditingController? con,Widget?Ico, TextInputType? type,String? Function(String?)? vali,bool obs=false,required String hintText})
{
  return Padding(
    padding:  REdgeInsets.symmetric(horizontal: 16,vertical: 5),
    child: TextFormField(
      controller: con,
      keyboardType: type,
      style: const TextStyle(color: Colors.black),
      obscureText: obs,
      validator: vali,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          suffixIcon: Ico,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)))
    ),
  );
}

Widget defaultText(String txt)
{
  return Container(
      margin: REdgeInsets.only(left: 16,top: 25),
      child: Text(txt,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp),));
}
Widget defaultTextf(String txt)
{
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: const Color(0xffFF2D00))
    ),
      margin: REdgeInsets.only(left: 16,top: 25),
      padding: REdgeInsets.symmetric(vertical: 18,horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(txt,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp),),
          const Icon(Icons.edit,color: Colors.red,size: 15,)
        ],
      ));
}

AppBar defaultAppBar({required String numofChart,void Function()? ToCart})
{
  return AppBar(
    toolbarHeight: 112,
    elevation: 0,

    backgroundColor: Colors.transparent,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Padding(
          padding: REdgeInsets.only(left: 20,bottom: 20),
          child: Text("$NameProject",style: TextStyle(color: const Color(
              0xffff0000),fontSize: 30.sp,fontWeight: FontWeight.bold),),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 348.w,
              height: 50.h,
              child: TextFormField(
                decoration: InputDecoration(
                  hintStyle:  const TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                  hintText: "what do you Search for ?",
                  prefixIcon: const Icon(Icons.search,color: Colors.black,size: 24,),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.r))) ,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.r))),
                ),
              ),
            ),

            InkWell(
              onTap: ToCart,
              child: Container(
                  margin: REdgeInsets.only(bottom: 24),
                  width: 24.w,
                  height: 24.h,
                  child:    Badge(
                    backgroundColor: Colors.blue,
                    textColor: Colors.black87,
                    label: Text(numofChart,style: TextStyle(fontWeight: FontWeight.bold),),
                    child:IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined,color: Colors.red,size: 30,) ,
                    ),)),
            )
          ],
        )
      ],
    ),
  );
}