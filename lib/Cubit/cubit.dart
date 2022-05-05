import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubit/states.dart';
import 'package:news_app/Network/Local/Cache_Helper.dart';
import 'package:news_app/Network/remote/Dio_helper.dart';
import 'package:news_app/modules/buisness.dart';
import 'package:news_app/modules/satting.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sports.dart';

class CountCubit extends Cubit<CounterStates>{
  CountCubit() : super(InitialeStates());

  static CountCubit get(context)=> BlocProvider.of(context);

  int Curentindex = 0;

  List< BottomNavigationBarItem>Bottonitem=
  [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'البزنس'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'الرياضة'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'العلوم'),


  ];
  List<Widget>Screen=[
    BuisnessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SittingScreen()
  ];
  List<String>Title=[
    'صفحة البزنس',
    'صفحة الرياضة',
    'صفحة العلوم',
  ];




  void change (int index){
    Curentindex=index;
    if(index==1){
      return getSports();
    }
    else if( index==2) {

      return getScience();
    }
    emit(StatechangeBottonnav());
  }

 List <dynamic> tasks=[];

  void getBuisness()
  {
    if(tasks.length==0 ){
      emit(NewGetLoding());
      DioHelper.getData(Url: 'v2/top-headlines',
          query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'dba90520a2b243ffaaa8296d5b973d47'
      }
      ).then((value) {
        tasks=value.data['articles'];
        emit(NewGetBuisnesSuccess());
      }).catchError((Error){print('error${Error.toString()}');
      emit(NewGetBuisnesErrorSuccess(Error.toString()));

      });

    }else{emit(NewGetBuisnesSuccess());}

  }

  List <dynamic> Sports=[];
  void getSports()
  {

    if(Sports.length==0)
    {
      emit(NewGetLodingSports());
      DioHelper.getData(Url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'dba90520a2b243ffaaa8296d5b973d47'
      }
      ).then((value) {
        print(value.data);
        Sports=value.data['articles'];
        //print(value.toString());
        emit(NewGetSportsSuccess());
      }).catchError((Error){print('error${Error.toString()}');
      emit(NewGetSportsErrorSuccess(Error.toString()));

      });


    }else{
      emit(NewGetSportsSuccess());
    }


  }

  List <dynamic> Science=[];
  void getScience()
  {

    if(Science.length==0)
    {
      emit(NewGetLodingScience());
      DioHelper.getData(Url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'dba90520a2b243ffaaa8296d5b973d47'
      }
      ).then((value) {
        print(value.data);
        Science=value.data['articles'];
        //print(value.toString());
        emit(NewGetScienceSuccess());
      }).catchError((Error){print('error${Error.toString()}');
      emit(NewGetScienceErrorSuccess(Error.toString()));

      });

    }else
    {
      emit(NewGetScienceSuccess());
    }



  }

  List <dynamic> Search=[];

  void getSearch({String ?value})
  {
    emit(NewGetLodingSearch());

    DioHelper.getData(
        Url: 'v2/everything',
        query: {
          'q': '$value',
          'from':'2022-05-04',
          'apiKey': '8264300126e04b3fa7932e458e11b934',
        }
    ).then((value) {
      //print(value.data);
      Search=value.data['articles'];
      //print(value.toString());
      emit(NewGetSearchSuccess());
    }).catchError((Error){print('error${Error.toString()}');
    emit(NewGetSearchErrorSuccess(Error.toString()));

    }
    );





  }



}



