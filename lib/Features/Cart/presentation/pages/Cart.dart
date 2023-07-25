import 'package:eticaret/Features/Cart/data/data_sources/DtoCart.dart';
import 'package:eticaret/Features/Cart/presentation/manager/CartCubit.dart';
import 'package:eticaret/Features/Cart/presentation/manager/CartStates.dart';
import 'package:eticaret/Features/Cart/presentation/widgets/CartITEM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class  CartScreen extends StatelessWidget {

static const String RouteName="Cart";
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (context) => CartCubit(RemoteDtoCart())..getCarts(),
    child: BlocConsumer<CartCubit,CartStates>(
      listener: (context, state) {
        if(state is CartStatesLoading)
          {
            showDialog<void>(
              barrierColor: Colors.white,
              context: context,
              builder: (BuildContext dialogContext) {
                return const Center(
                    child: CircularProgressIndicator(backgroundColor: Colors.white,color: Colors.black,));
              },

            );
            Navigator.pop(context);
            }
       else if(state is CartStatesSuccess)
        {
        }



      },
      builder: (context, state) {
        if(state is CartStatesSuccess)
          {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: IconButton(onPressed: () {
                  Navigator.pop(context);
                },icon: const Icon(Icons.keyboard_backspace_sharp,color: Colors.black,)),
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: const Text("Cart",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffFF2D00)),),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
            itemCount: state.modelCart.data!.products!.length,
            itemBuilder: (context, index) {
                    var item=state.modelCart.data!.products;
           return  CartItem(imageCover: item![index].product!.imageCover??"", title: item[index].product!.title??"", id: item[index].product!.id??"", catName: item[index].product!.category!.name??"", brandName: item[index].product!.brand!.name??"", price: item[index].price??0);
          },),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child:Row(
                      children: [
                        Column(
                          children: [
                            Text("Total Price",style: TextStyle(color: const Color(0xff7F1600),fontSize: 20.sp,fontWeight: FontWeight.bold),),
                            SizedBox(height: 12.h,),
                            Text("EGP ${state.modelCart.data!.totalCartPrice}",style:const TextStyle(fontWeight: FontWeight.bold,color: Color(0xff00697F)),),
                          ],
                        ),
                        SizedBox(width: 33.w,),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffFF2D00),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r)
                                )
                              ),
                              onPressed: (){
                                CartCubit.get(context).getKeyReq();
                              }, child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Check Out",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              Icon(Icons.arrow_right_alt_outlined,color: Colors.white,)
                            ],
                          )),
                        ),
                        SizedBox(width: 20.w,),
                      ],
                    ),
                  )
                ],
              )
        );

    }
        else
          {
            return const CircularProgressIndicator();
          }
      },

    )
    );
  }
}