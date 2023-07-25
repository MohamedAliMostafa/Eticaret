import 'package:eticaret/Features/Prod_Details/data/data_sources/DtoDetails.dart';
import 'package:eticaret/Features/Prod_Details/presentation/manager/Cubit.dart';
import 'package:eticaret/Features/Prod_Details/presentation/manager/DetailsState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Details extends StatelessWidget {
  static const String routeName="details";


  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as String ;
    return BlocProvider(
      create: (context) => DetailsCubit(RemoteDtoDetails())..getDetails(args),
    child:BlocConsumer<DetailsCubit,DetailsStates>(
      listener: (context, state) {
        if(state is DetailsLoading)
          {
            const Center(child: CircularProgressIndicator());
          }
        else if(state is DetailsCateSuccess)
          {

          }
        else if(state is DetailsCateError)
          {
            showDialog<void>(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: Text('Error'),
                    content: Text(state.msg),
                  );
                },
              );
            }
      },
      builder: (context, state) {
        var listImage= DetailsCubit.get(context).OneProduct?.images??[];
        var prod=DetailsCubit.get(context).OneProduct;
        var c=DetailsCubit.get(context).count;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon:const Icon(Icons.keyboard_backspace_outlined,color: Colors.black,)),
            actions: [
              Container(
                margin: REdgeInsets.only(right: 35),
                  width: 24.w,
                  height: 24.h,
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined,color: Colors.red,size: 30,)))
            ],

            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text("Product Details",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),),
          body:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlideshow(
                indicatorColor: Colors.red,
                indicatorBackgroundColor: Colors.grey,
                width: 398.w,
                height: 300.h,
                initialPage: 0,
                autoPlayInterval: 3000,
                isLoop: true,

                children:listImage.map((e) {
                  return Container(
                    padding: REdgeInsets.all(15),
                      margin: REdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15.r)
                      ),
                      child: Image.network(e,fit: BoxFit.fill,));
                }).toList(),
              ),
              SizedBox(height: 24.h,),
              Padding(
                padding:  REdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                      width: 200.w,
                      child: Text(prod?.title??"",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),maxLines: 1,)),
                  Text("EGP ${prod?.price}",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w500)),
                ],),
              ),
              SizedBox(height: 16.h,),
              Padding(
                padding:  REdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  children: [
                    Container(
                      height: 34.h,
                      width: 102.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(child: Text("${prod?.sold} Sold")),
                    ),
                    SizedBox(width: 16.w,),
                    const Icon(Icons.star,color: Color(0xffF4B400),size: 15,),
                    SizedBox(width: 4.w,),
                    Text("${prod?.ratingsAverage}"),
                    Spacer(),
                    Container(
                      width: 122.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              DetailsCubit.get(context).dec(prod?.price);
                            },
                            child: Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r) ,
                                border: Border.all(color: Colors.white)
                              ),
                              child: const Center(child: Icon(Icons.remove,color: Colors.white,size: 10,)),
                            ),
                          ),
                          Text("${c}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.sp),),
                          InkWell(
                            onTap: () {
                              DetailsCubit.get(context).inc(prod?.price);
                            },
                            child: Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r) ,
                                  border: Border.all(color: Colors.white)
                              ),
                              child: const Center(child: Icon(Icons.add,color: Colors.white,size: 10,)),
                            ),
                          ),

                        ],
                      ),
                    )
                  ],),
              ),
              SizedBox(height: 16.h,),
              Padding(
                padding:  REdgeInsets.symmetric(horizontal: 32),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start  ,
                  children: [
                    Text("Description",textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8.h,),
                    Container(
                        height: 54.h,
                        width: 381.w,
                        child: Text(prod?.description??"",textAlign: TextAlign.start,style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w600),maxLines: 3,)),

                  ],
                )
              ),
              SizedBox(height: 200.h,),

              Padding(
                  padding:  REdgeInsets.symmetric(horizontal: 32),
                  child:Column(
                    children: [
                      Text("Total Price",style:TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                      SizedBox(height: 12.h,),
                      Text("EGP ${DetailsCubit.get(context).totalPrice} "),
                      
                    ],
                  )
                  ),


            ],
          )
        );
      },
    )
    );
  }
}
