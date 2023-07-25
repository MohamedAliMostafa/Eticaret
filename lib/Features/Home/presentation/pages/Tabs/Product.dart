import 'package:eticaret/Features/Home/presentation/manager/HomeCubit.dart';
import 'package:eticaret/Features/Home/presentation/manager/HomeStates.dart';
import 'package:eticaret/Features/Home/presentation/widgets/ProductItem.dart';
import 'package:eticaret/Features/Prod_Details/presentation/pages/Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utilis/CachHelper.dart';
import '../../../../../Core/utilis/Strings.dart';
import '../../../../../Core/utilis/Widgets/Widgets.dart';
import '../../../../Cart/presentation/pages/Cart.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {
        if(state is AddtoCartSuccess)
          {
            Navigator.pop(context);
          }

      },
      builder: (context, state) {
        return Scaffold(
          appBar:  defaultAppBar(numofChart: HomeCubit.get(context).numofChart.toString(),ToCart: () {
            Navigator.pushNamed(context, CartScreen.RouteName);
          },),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    itemCount: HomeCubit.get(context).Product.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 16.w,mainAxisSpacing: 16.h,childAspectRatio: 4/5.11),
                    itemBuilder: (context, index) {
                      var pro=HomeCubit.get(context).Product;
                      var p=pro[index];
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Details.routeName,arguments: p.id);
                        },
                        child: ProductITem(pro: p,));

                  },),
                ),
              )



            ],


          ),
        );

      },

    );
  }
}
