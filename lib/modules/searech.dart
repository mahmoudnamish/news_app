import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubit/cubit.dart';
import 'package:news_app/Cubit/cubit.dart';
import 'package:news_app/Cubit/cubit.dart';
import 'package:news_app/Cubit/cubit.dart';
import 'package:news_app/Cubit/states.dart';
import 'package:news_app/Shared/Componanet/component.dart';
import 'package:news_app/Shared/Componanet/context/Constance.dart';
import 'package:news_app/modules/searech.dart';

import '../Cubit/cubit.dart';
import '../Cubit/cubit.dart';
class Search extends StatelessWidget {

  var TextForemfieldControler= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountCubit,CounterStates>(
      listener:(context, state) {},
      builder: (context,state)
      {
        var lists= CountCubit.get(context).Search;
        return  Scaffold(appBar: AppBar(),

          body: Column(children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defoultTextForme(type: TextInputType.text,
                  icon:Icons.search,
                  controle:TextForemfieldControler,
                  textlable: 'Search',
                  validator: (String? value)
                  {
                    if(value!.isEmpty)
                    {
                      return'please enter the value';
                    }
                    return null!;
                  },
                  onchange: (value)
                  {

                  CountCubit.get(context).getSearch(value: value);

                  }
              ),
            ),
            Expanded(
              child: ConditionalBuilder(
                  condition: lists.length > 0
                  , builder: (context) => ListView.separated(
                  physics:BouncingScrollPhysics(),  //متخليش العلامة الزرقه اللي بتجيلي لما اسكرول لتحت
                  itemBuilder: (context, index) => buildArticalItem(lists[index],context), //context withe Style dart
                  separatorBuilder: (context, index)=>Container(width: double.infinity,height: 1,color: Colors.grey)
                  , itemCount: lists.length)
                  , fallback: (context) => Center(child: CircularProgressIndicator())

              ),
            )

          ]),

        );
      },

    );
  }
}
