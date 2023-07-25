import 'package:eticaret/Features/Home/data/models/ModelProduct.dart';
import 'package:eticaret/Features/Home/presentation/manager/HomeCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductITem extends StatefulWidget {
  Dproduct pro;

  ProductITem({required this.pro});

  @override
  State<ProductITem> createState() => _ProductITemState();
}

class _ProductITemState extends State<ProductITem> {
  bool click=false;

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: Colors.red)),
          width: 207.w,
          height: 253.h,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Column(
              children: [
                Container(
                  height: 128.h,
                  width: 207.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15..r),
                          topRight: Radius.circular(15.r)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.pro.imageCover ?? ""))),
                ),
                Container(
                  width: 207.w,
                  height: 125.h,
                  color: Colors.transparent,
                  margin: REdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.pro.title ?? "",
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                      Text(widget.pro.brand?.name ?? ""),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Text("EGP${widget.pro.price}"),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            "EGP${widget.pro.price! + 20}",
                            style: const TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Text("Review (${widget.pro.ratingsAverage})"),
                          SizedBox(
                            width: 4.w,
                          ),
                          const Icon(
                            Icons.star,
                            color: Color(0xffFDD835),
                            size: 15,
                          ),
                          const Spacer(),
                           InkWell(
                             onTap: () {
                               HomeCubit.get(context).AddTocart(widget.pro.id??"");
                             },
                             child: CircleAvatar(
                              radius: 13,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                          ),
                           )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          InkWell(
            onTap: () {
              setState(() {
                click=!click;
               if(click==true)
                 {
                   HomeCubit.get(context).addtowatchList(widget.pro.id??"");
                 }
               else
                 {
                   HomeCubit.get(context).removeToWatchList(widget.pro.id??"");
                 }
              });

            },
            child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32.r)),
                  image:DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(click==false?"assets/images/Heart-icon.png":"assets/images/OIP.jpeg"),
                  )
                ),
            ),
          ),
        ],
      ),
    );
  }
}
