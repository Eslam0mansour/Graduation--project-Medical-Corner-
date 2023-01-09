// ignore_for_file: avoid_print
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intro_example/core/Network/news%20api%20service/dio_helper.dart';
import 'package:intro_example/core/cubit/states.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite/tflite.dart';


class AppCubit extends Cubit<AppState>{
  AppCubit():super(IntiAppState());

  static AppCubit get(context)=>BlocProvider.of(context);

  Future loadModel() async {
    Tflite.close();
    emit(ModelLoadedSTate());
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",

    ).then((value) {
      loading = false;
      emit(ModelLoadedSTate());

    });
  }
  // bool loading = true;
  // File? image;
  // List? output;
  //
  // Future pickImage() async {
  //   emit(PickImageState());
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   image = File(pickedFile!.path);
  //   emit(PickImageState());
  // }
  // Future pickCamera() async {
  //   emit(PickImageState());
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.camera);
  //   image = File(pickedFile!.path);
  //   emit(PickImageState());
  // }
  // Future classifyImage() async {
  //   emit(ClassifyImageState());
  //   output = await Tflite.runModelOnImage(
  //     path: image!.path,
  //     numResults: 2,
  //     threshold: 0.5,
  //     imageMean: 127.5,
  //     imageStd: 127.5,
  //   );
  //   emit(ClassifyImageState());
  // }
  //
  // List? get getOutput => output;
  // File? get getImage => image;
  // bool get getLoading => loading;

  final ImagePicker _picker = ImagePicker();
  Future pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    loading = true;
    iimage  = File(image.path);
    emit(pickedState());
    classifyImage(File(image.path));
    emit(ClassifyState());
  }

  late List? outputs;
  File? iimage;
  late bool loading = true;
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
    print(outputs);
    emit(FinalResultState());
  }

  Future<String>  save(Uint8List bytes) async
  {
    await [Permission.storage].request();
    const name = 'result of Xray';
    final result = await ImageGallerySaver.saveImage(bytes , name : name);
    return result['filepath'];
  }

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
            print('the error is ${onError.toString()}');
            emit(GetHeErorrState(onError.toString()));
          });
    }else{
     emit(GetHeSuccSTate());
    }
  }
}
