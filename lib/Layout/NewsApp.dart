import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubit/NewCubit.dart';
import 'package:news_app/Cubit/cubit.dart';
import 'package:news_app/Cubit/states.dart';
import 'package:news_app/modules/searech.dart';

class Newsapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountCubit,CounterStates>(
       listener: (context,state){},
      builder: (context,state){
        var Cubit = CountCubit.get(context);

         return Scaffold(
           appBar: AppBar(
             title: Text(
                 Cubit.Title[Cubit.Curentindex] ),
             actions: [
               IconButton(onPressed: ()
               {
                 Navigator.push( context, MaterialPageRoute(builder: (context)=>Search()));
               },
                   icon: Icon(Icons.search,size: 30,)),

               IconButton(onPressed: ()
               {
                NewCubit.get(context).ChangemodeApp();

               }
                   , icon: Icon(Icons.brightness_4_outlined,size: 30,))
             ],
           ),
           bottomNavigationBar: BottomNavigationBar(items:Cubit.Bottonitem,
             currentIndex: Cubit.Curentindex,
             onTap: (index)
             {
             Cubit.change(index);
             }

           ),
           body: Cubit.Screen[Cubit.Curentindex],

         );

      },

    );
  }
}
