import 'package:eticaret/Core/utilis/Widgets/Widgets.dart';
import 'package:eticaret/Features/Home/data/data_sources/HomeDto.dart';
import 'package:eticaret/Features/Home/presentation/manager/HomeCubit.dart';
import 'package:eticaret/Features/Home/presentation/manager/HomeStates.dart';
import 'package:eticaret/Features/Home/presentation/widgets/HeartITEM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartListTab extends StatelessWidget {
  const HeartListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(listener: (context, state) {
        if(state is GetWatchListError)
        {
        showDialog(context: context, builder: (context) {
        return  AlertDialog(title: const Text("Error"),
        content: Text(state.msg),
        );
        },);
        }
        else if(state is AddtoWatchListSuccess)
        {


        }
        else if(state is GETWatchListSuccess)
        {
        Navigator.pop(context);

        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar:defaultAppBar(numofChart: HomeCubit.get(context).numofChart.toString()),
          body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: HomeCubit.get(context).ListWatchList.length,
                    itemBuilder: (context, index) {
                      var WList=HomeCubit.get(context).ListWatchList;


                    return HeartITEM(imageCover: WList[index].imageCover??"", title: WList[index].title??"", id:  WList[index].id??"", catName:  WList[index].category!.name??"", brandName:  WList[index].brand!.name??"", price:  WList[index].price??0);
                  },),
                ),
              ],
            ),
        );
      },
    );
  }
}
