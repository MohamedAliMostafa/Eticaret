import 'package:eticaret/Core/utilis/Widgets/Widgets.dart';
import 'package:eticaret/Features/Cart/presentation/pages/Cart.dart';
import 'package:eticaret/Features/Home/presentation/manager/HomeCubit.dart';
import 'package:eticaret/Features/Home/presentation/manager/HomeStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class HomeTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(numofChart: HomeCubit.get(context).numofChart.toString(),ToCart: () {
            ADDToCartLoading();
            Navigator.pushNamed(context, CartScreen.RouteName);
          },),
          body: ListView(
                  children: [
                    ImageSlideshow(
                      indicatorColor: Colors.transparent,
                      indicatorBackgroundColor: Colors.transparent,
                      width: 398.w,
                      height: 200.h,
                      initialPage: 0,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: HomeCubit.get(context).images.map((e) {
                        return Image.asset(e);
                      }).toList(),
                    ),
                    SizedBox(height: 24.h,),
                    Padding(
                      padding:  REdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                        Text("Categories",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
                        Text("view all",style: TextStyle(color: Colors.black,fontSize: 14),),
                      ],),
                    ),
                    SizedBox(height: 16.h,),
                    Container(
                        height: 310.h,
                        child:state is HomeLoading?const Center(child: CircularProgressIndicator()): GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: HomeCubit.get(context).Cate.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 16), itemBuilder: (context, index) {
                            var list=HomeCubit.get(context).Cate;
                          return Column(children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(list[index].image??""),
                              radius: 40.r,
                            ),
                            SizedBox(height: 6.h,),
                            Text(list[index].name??"")
                          ],);
                        },),
                      ),

                    SizedBox(height: 24.h,),
                    Padding(
                      padding:  REdgeInsets.only(left: 16),
                      child: Row(children: const [
                        Text("Brands",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
                      ],),
                    ),
                     SizedBox(
                          height: 280.h,
                          child:state is HomeLoading?const Center(child: CircularProgressIndicator()): GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: HomeCubit.get(context).Brand.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 16), itemBuilder: (context, index) {
                            var list=HomeCubit.get(context).Brand;
                            return Column(children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(list[index].image??""),
                                radius: 40.r,
                              ),
                              SizedBox(height: 6.h,),
                              Text(list[index].name??"")
                            ],);
                          },),
                        ),







                  ],


          ),
        );

      },

    );
  }
}
