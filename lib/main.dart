import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/Cubit/NewCubit.dart';
import 'package:news_app/Cubit/NewStates.dart';
import 'package:news_app/Cubit/cubit.dart';

import 'package:news_app/Layout/NewsApp.dart';
import 'package:news_app/Network/Local/Cache_Helper.dart';
import 'package:news_app/Network/remote/Dio_helper.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();  // دي ضرورية علشان تشغل اي await main
  DioHelper.init();
 await  CacheHalper.init();
 bool? isDark= CacheHalper.getdata(key: 'isDark');
  runApp( MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp( this.isDark);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context)=>CountCubit()
        ..getBuisness() ..getSports()..getScience()..getSearch(),),
      BlocProvider(create: (context)=>NewCubit()
        ..ChangemodeApp( FromeShared: isDark),)

      ],
      child: BlocConsumer< NewCubit, NewStates >
        (
        listener:(context,state){},
       builder: (context,state)
       {
        var cubit= NewCubit.get(context);

         return MaterialApp(
           theme:ThemeData(
               primarySwatch: Colors.orange,     // بتاع اللي  بيلف
               scaffoldBackgroundColor:Colors.white ,
               appBarTheme: AppBarTheme(
                 titleSpacing:20,
                   backwardsCompatibility:false ,    //states Bare
                   systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
                   backgroundColor: Colors.white,
                   elevation: 0.0,
                   titleTextStyle: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                   iconTheme: IconThemeData(color: Colors.orange)
               ),

               bottomNavigationBarTheme:
               BottomNavigationBarThemeData(
                 type: BottomNavigationBarType.fixed,
                 selectedItemColor:   Colors.orange,
                 unselectedItemColor:Colors.grey,
                 backgroundColor: Colors.white,
                 elevation: 20.0,
               ),
               textTheme: TextTheme
                 (
                   bodyText1:
                   TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black)
               )
           ),
           ///////////////////////////////////////////////////////////
           darkTheme: ThemeData(
               scaffoldBackgroundColor: HexColor('333739'),
               primarySwatch: Colors.orange,     // بتاع اللي  بيلف
               appBarTheme: AppBarTheme(
                 titleSpacing: 20,
                   backwardsCompatibility:false ,    //states Bare
                   systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:HexColor('333739'),
                       statusBarIconBrightness: Brightness.light
                   ),
                   backgroundColor: HexColor('333739'),
                   elevation: 0.0,
                   titleTextStyle: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
                   iconTheme: IconThemeData(color: Colors.white)
               ),
               bottomNavigationBarTheme: BottomNavigationBarThemeData(
                 type: BottomNavigationBarType.fixed,
                 selectedItemColor:   Colors.orange,
                 unselectedItemColor:Colors.grey,
                 backgroundColor: HexColor('333739'),
                 elevation: 20.0,
               ),
               textTheme: TextTheme
                 (
                   bodyText1: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white)
               )

           ),
 //////////////////////////////////////////////////////////////////////////
           themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,

           home:Directionality(
               textDirection: TextDirection.ltr,
               child: Newsapp()) ,
           debugShowCheckedModeBanner: false,

         );

       }
       ),
      );


  }
}
