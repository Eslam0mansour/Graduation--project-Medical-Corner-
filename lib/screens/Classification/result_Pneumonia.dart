
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intro_example/cubit/cubit.dart';
import 'package:intro_example/cubit/states.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../components/result_with_output.dart';
class Result extends StatelessWidget {
  final controllerr = ScreenshotController();
   Result({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: ( context, state) {  },
      builder: ( context,  state) {
        AppCubit cubit = AppCubit.get(context);
        return Screenshot(
          controller: controllerr,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded , size: 30, color: Colors.black,),
              ),
              title: const Text(
                'My Detection Lap',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'seguisb',
                  color: Color(0xff03045E),
                ),
              ),
            ),
            body: cubit.loading
                ? Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            )
                : Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cubit.iimage == null ? Container(
                      child: Lottie.asset('assets/3.json'),
                    ) : const Result1(),
                    cubit.iimage == null ? Container() : Padding(
                      padding: const EdgeInsets.only(
                          top: 30
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                        ),
                        onPressed: () async {
                          final imageee = await controllerr.captureFromWidget(const Result1());
                          if (imageee == null) {
                            return ;
                          }
                          await save(imageee);
                        },
                        child: const Text(
                          'save result to the Gallery',
                          style: TextStyle(
                              fontSize: 22
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    cubit.iimage == null ? Container() : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                      ),
                      onPressed: (){},
                      child: const Text(
                        'save result to the Cloud',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    cubit.iimage == null ? Container() : const Text(
                      ' Warning: this result may not accurate so you need to consulting a doctor as soon as possible(The accuracy of the results is 91%)',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                cubit.pickImage();
              },
              child: const Icon(Icons.image),
            ),
          ),
        );
      },
    );
  }


  // Future classifyImage( File image ) async {
  //   var output = await Tflite.runModelOnImage(
  //       path: image.path,
  //       numResults: 1,
  //       threshold: 0.2,
  //       imageMean: 0.0,
  //       imageStd: 180.0,
  //       asynch: true
  //   );
  //   setState(() {
  //     _loading = false;
  //     _outputs = output!;
  //   });
  // }
  // Future pickImage() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image == null) return null;
  //   setState(() {
  //     _loading = true;
  //     _image = selectedImage = File(image.path);
  //   });
  //   classifyImage(File(image.path));
  // }
  // Future pickImagetocloud() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.getImage(source: ImageSource.gallery);
  //   final pickedImageFile = File(pickedImage!.path);
  //   setState(() {
  //     _loading = true;
  //
  //     _pickedImage = pickedImageFile;
  //   });
  //   upload( File(_pickedImage!.path));
  // }
  // // for upload to cloud
  // Future upload( File imagee) async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   final _id = user!.uid;
  //   final ref = FirebaseStorage.instance.ref().
  //   child('userImages').child(_id+'.Pneumonia.jpg');
  //   await ref.putFile(File(imagee.path));
  //   url = await ref.getDownloadURL();
  //   if( user != null) {
  //     await FirebaseFirestore.instance.collection('users').
  //     doc(user.uid).update({
  //       'imageurl': url,
  //     });
  //     setState(() {
  //       _loading = false;
  //     });
  //   }
  //   else {
  //     print('erorrrrrr');
  //   }
  // }
   Future<String>  save(Uint8List bytes) async
   {
     await [Permission.storage].request();
     const name = 'result of Xray';
     final result = await ImageGallerySaver.saveImage(bytes , name : name);
     return result['filepath'];
  }
  // loadModel() async {
  //   await Tflite.loadModel(
  //     model: "assets/model.tflite",
  //     labels: "assets/labels.txt",
  //
  //   );
  // }
  // @override
  // void dispose() {
  //   Tflite.close();
  //   super.dispose();
  // }
}

