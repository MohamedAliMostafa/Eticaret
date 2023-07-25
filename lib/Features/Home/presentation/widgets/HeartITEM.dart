import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/HomeCubit.dart';

class HeartITEM extends StatelessWidget {
String imageCover;
String title;
String id;
String catName;
String brandName;
int price;

HeartITEM({required this.imageCover, required this.title, required this.id, required this.catName, required this.brandName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.symmetric(vertical: 16,horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(15.r)
        ),
        width:398.w ,
        height: 113.h,
        child:Row(
          children: [
            Container(
              width: 120.w,
              height: 113.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(fit:BoxFit.fill,image: NetworkImage(imageCover))
              ),
            ),
            Padding(
              padding:  REdgeInsets.symmetric(horizontal: 8,vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 220.w,
                          child: Text(title,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,color: Colors.black87,overflow: TextOverflow.ellipsis),maxLines: 1,)),
                      InkWell(
                        onTap: () {
                          HomeCubit.get(context).removeToWatchList(id);
                        },
                        child: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.all(Radius.circular(32.r)),
                              image:DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/OIP.jpeg"),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(catName,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                  Text(brandName,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                  Row(
                    children: [
                      Text("EGP${price}"),
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        "EGP${price+20}",
                        style: const TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),

                ],),
            )
          ],
        ) ,
      ),
    );
  }
}
