import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubit/NewStates.dart';
import 'package:news_app/Network/Local/Cache_Helper.dart';

class NewCubit extends Cubit<NewStates> {

  NewCubit() : super(initialeStates());


  static NewCubit get(context) => BlocProvider.of(context);

  bool isDark = true;
  void ChangemodeApp({bool ?FromeShared}) {
    if (FromeShared != null)
      isDark = FromeShared;
    else
      isDark = !isDark;
    CacheHalper.Putdata(key: 'isDark', value: isDark).then((value) {
      emit(ChangetheModeApp(isDark));
    });
  }


}