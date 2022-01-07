import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latestversion_news_app/network/local/cache_helper.dart';

import 'appstates.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool darkMode = false ;

  void changeDarkMode ({bool? fromShared}){
    if(fromShared!=null) {
      darkMode = fromShared;
    } else {
      darkMode=!darkMode;
    }
    CacheHelper.putData(key: 'darkMode', value: darkMode).then((value) => emit(DarkModeState()));

  }
}