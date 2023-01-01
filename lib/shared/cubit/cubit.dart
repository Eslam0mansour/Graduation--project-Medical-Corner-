// ignore_for_file: avoid_print
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intro_example/shared/cubit/states.dart';
import 'package:tflite/tflite.dart';
import '../../../netWork/dio_helper.dart';
import '../shared_preferences.dart';
import '../../screens/News/screens/health.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit():super(IntiAppState());
  
  static AppCubit get(contixt)=>BlocProvider.of(contixt);
  ////////////
  late List? outputs;
  File? iimage;
  late bool loading = true;
  final ImagePicker _picker = ImagePicker();

  Future loadModel() async {
    Tflite.close();
    emit(ModelLodedSTate());
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",

    ).then((value) {
      loading = false;
      emit(ModelLodedSTate());

    });
  }
  Future pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    loading = true;
    iimage  = File(image.path)  ;
    emit(pickedState());
    classifyImage(File(image.path));
    emit(ClassifyState());
  }
  void classifyImage( File image ) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 1,
        threshold: 0.2,
        imageMean: 0.0,
        imageStd: 180.0,
        asynch: true
    );
    loading = false;
    outputs = output!;
    emit(FinalResultState());
  }
/////////

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


void getmore({bool? m}){
          m != m ;
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

    // var moodl=(
    //     CachHelper.getMood(key: "mood")==null)
    //     ?true:CachHelper.getMood(key: "mood");
    // void changMood(value){
    //   moodl=value;
    //   CachHelper.setMood(key: "mood", value: moodl).then((value) {
    //     emit(Mood());
    //   }
    //   );
    //   print('l mood is $isEnglish');
    // }

  }


}