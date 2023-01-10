// ignore_for_file: avoid_print
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intro_example/core/Network/news%20api%20service/dio_helper.dart';
import 'package:intro_example/core/cubit/states.dart';
import 'package:intro_example/features/News/data_models/News.dart';
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
      print('pneumonia model loaded');
    });
  }
  Future loadBrainTumourModel() async {
    Tflite.close();
    emit(ModelLoadedSTate());
    await Tflite.loadModel(
      model: "assets/model_brain_tumour.tflite",
      labels: "assets/labels_brain_tumour.txt",

    ).then((value) {
      loading = false;
      emit(ModelLoadedSTate());
      print( 'brain tumour model loaded');
    });
  }

  final ImagePicker _picker = ImagePicker();
  Future pickImage({
    required double imageMean,
    required double imageStd,
    required int numResults,
    required double threshold,
}) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    loading = true;
    iimage  = File(image.path);
    emit(PickedImageState());
    classifyImage(
      image: File(image.path),
      imageMean: imageMean,
      imageStd: imageStd,
      numResults: numResults,
      threshold: threshold,
    );
    emit(ClassifyImageState());
  }

  late List? outputs;
  File? iimage;
  late bool loading = true;
  void classifyImage({
    required File image,
    required double imageMean,
    required double imageStd,
    required int numResults,
    required double threshold,
  }) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: numResults,
        threshold: threshold,
        imageMean: imageMean,
        imageStd: imageStd,
        asynch: true
    );
    loading = false;
    outputs = output!;
    print(outputs);
    print(imageStd);
    emit(FinalResultState());
  }

  //make iimage and output = null function
  void clearImage() {
    iimage = null;
    outputs = null;
    emit(ClearState());
  }

  //save image to gallery function and permission function
  Future<void> saveImage(Uint8List bytes) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(bytes.buffer.asUint8List()));
      print(result);
    } else {
      print('permission denied');
    }
  }

  News news = News();
  void getNews() async {
    emit(NewsLoadState());
    await DioHelper.getData(
      url: 'top-headlines',
      query: {
        'country': 'gb',
        'category': 'health',
        'apiKey': 'c806ed6527df4f2aadc50d564e6923d4',
      },
    ).then((value) {
      news = News.fromJson(value.data);
      print(news.articles![0].title);
      emit(NewsDoneState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsErrorState( error.toString()));
    });
  }
}
