// ignore_for_file: avoid_print
import 'package:intro_example/News/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../netWork/dio_helper.dart';
import '../../screens/health.dart';
import '../components/shared_preferences.dart';

class AppCupit extends Cubit<AppState>{
  AppCupit():super(IntiAppState());
  
  static AppCupit get(contixt)=>BlocProvider.of(contixt);
  var screens=const Hel();

  List<dynamic> hel=[];
  void getHel(){
    emit(GetHeLodinState());
    if(hel.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          q_p: {
            'country':'gb',
            'category':'health',
            'apiKey':'c806ed6527df4f2aadc50d564e6923d4',
          }).then((value) {
           print('title is ${value.data['articles'][0]['title']}');
            hel=value.data['articles'];
            emit(GetHeSuccSTate());
          }).catchError((onError){
            print('the erorr is ${onError.toString()}');
            emit(GetHeErorrState(onError.toString()));
          });
    }else{
     emit(GetHeSuccSTate());
    } 
  }

  var moodl=(CachHelper.getMood(key: "mood")==null)?true:CachHelper.getMood(key: "mood");
  void changMood(value){
    moodl=value;
    CachHelper.setMood(key: "mood", value: moodl).then((value) {emit(Mood());});
    print('l mood is $isEnglish');
  }

  var isEnglish=(CachHelper.getLan(key:"lan")==null)?true:CachHelper.getLan(key: "lan");
  void changLang(value){
    isEnglish=value;
    CachHelper.setLan(key: "lan", value: isEnglish).then((value) {emit(ChangLange());});
    print('english is $isEnglish');
  }

  Color mainColor=(CachHelper.getColor(key: "color")==null)?Colors.blue:Color(CachHelper.getColor(key:"color"));
  void changeMainColor(color){
    mainColor=color;
    CachHelper.setColor(key:"color",colorValue:mainColor.value).then((value) {
      emit(ChangColor());
    });
    print('main color is ${mainColor.toString()}');
  }

}