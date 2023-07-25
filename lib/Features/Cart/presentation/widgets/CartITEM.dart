import 'package:eticaret/Features/Cart/presentation/manager/CartCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  String imageCover;
  String title;
  String id;
  String catName;
  String brandName;
  int price;


  CartItem({required this.imageCover, required this.title, required this.id, required this.catName, required this.brandName,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 220.w,
                          child: Text(title,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: Colors.black87,overflow: TextOverflow.ellipsis),maxLines: 1,)),
                      InkWell(
                        onTap: () {
                          CartCubit.get(context).remove(id);
                        },
                        child: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(32.r)),

                          ),
                          child: const Icon(Icons.delete,color: Colors.red,),
                        ),
                      ),
                    ],
                  ),
                  Text(catName,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w800,color: Colors.orange),),
                  Text(brandName,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w800,color: Colors.orange),),
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
