import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubit/cubit.dart';
import 'package:news_app/Cubit/states.dart';

import '../Shared/Componanet/component.dart';

class SportsScreen extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountCubit, CounterStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var lists=CountCubit.get(context).Sports;
        return ConditionalBuilder(
            condition: lists.length >0
            , builder: (context) => ListView.separated(
            physics:BouncingScrollPhysics(),  //متخليش العلامة الزرقه اللي بتجيلي لما اسكرول لتحت
            itemBuilder: (context, index) => buildArticalItem(lists[index],context),
            separatorBuilder: (context, index)=>Container(width: double.infinity,height: 1,color: Colors.grey)
            , itemCount: lists.length)
            , fallback: (context) => Center(child: CircularProgressIndicator())

        );
      },


    );


  }
}
