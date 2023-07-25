
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eticaret/Core/utilis/CachHelper.dart';
import 'package:eticaret/Core/utilis/Strings.dart';
import 'package:eticaret/Features/Home/data/data_sources/HomeDto.dart';
import 'package:eticaret/Features/Home/presentation/manager/HomeCubit.dart';
import 'package:eticaret/Features/Home/presentation/manager/HomeStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  static const String RouteName="home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context) => HomeCubit(RemoteDto())..getCate()..getBrands()..getProduct()..getToWatchList(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {
          if(state is HomeLoading)
            {
              showDialog<void>(
              context: context,
              builder: (BuildContext dialogContext) {
                return const Center(child: CircularProgressIndicator());
              },
            );
          }
          else if(state is HomeCateError)
          {
            showDialog(context: context, builder: (context) {
              return  AlertDialog(title: const Text("Error"),
                content: Text(state.msg),
              );
            },);
          }
          else if(state is HomeBrandsError)
          {
            showDialog(context: context, builder: (context) {
              return  AlertDialog(title: const Text("Error"),
                content: Text(state.msg),
              );
            },);
          }
          else if(state is HomeProductError)
          {
            showDialog(context: context, builder: (context) {
              return  AlertDialog(title: const Text("Error"),
                content: Text(state.msg),
              );
            },);
          }
          else if(state is HomeCateSuccess)
            {


            }
          else if(state is AddtoCartError)
          {
            showDialog(context: context, builder: (context) {
              return  AlertDialog(title: const Text("Error"),
                content: Text(state.msg),
              );
            },);
          }
          else if(state is AddtoCartSuccess)
          {

          }
          else if(state is AddtoWatchListError)
          {
            showDialog(context: context, builder: (context) {
              return  AlertDialog(title: const Text("Error"),
                content: Text(state.msg),
              );
            },);
          }
          else if(state is AddtoWatchListSuccess)
          {
           // Navigator.pop(context);

          }
          else if(state is RemoveoWatchListError)
          {
            showDialog(context: context, builder: (context) {
              return  AlertDialog(title: const Text("Error"),
                content: Text(state.msg),
              );
            },);
          }
          else if(state is RemovetoWatchListSuccess)
          {
            Navigator.pop(context);

          }
          else if(state is GetWatchListError)
          {
            showDialog(context: context, builder: (context) {
              return  AlertDialog(title: const Text("Error"),
                content: Text(state.msg),
              );
            },);
          }
          else if(state is GETWatchListSuccess)
          {


          }



        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              height: 60.h,
          backgroundColor: Colors.red,
          items: HomeCubit.get(context).iconsBottomNav,
              onTap: (value) {
                HomeCubit.get(context).setIndex(value);
              },
          ),
            body: HomeCubit.get(context).tabs[HomeCubit.get(context).initIndex],
          );
        },
      ),

    );
  }
}
