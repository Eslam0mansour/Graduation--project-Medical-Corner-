// ignore_for_file: avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_example/shared/cubit/states.dart';
import '../../../netWork/dio_helper.dart';
import '../shared_preferences.dart';
import '../../screens/News/screens/health.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit():super(IntiAppState());
  
  static AppCubit get(contixt)=>BlocProvider.of(contixt);
  var screens=const Hel();
  bool more = false;

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
void getmore(){
  more = !more;
  emit(GetMore());
}

  var isEnglish=(
      CachHelper.getLan(key:"lan")==null)?true:CachHelper.getLan(key: "lan");
  void changLang(value){
    isEnglish=value;
    CachHelper.setLan(key: "lan", value: isEnglish).then((value)
    {
      emit(ChangLange());
    }
    );
    print('english is $isEnglish');
  }


}