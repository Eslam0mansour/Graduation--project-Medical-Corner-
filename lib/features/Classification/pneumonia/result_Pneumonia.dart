
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_example/core/cubit/cubit.dart';
import 'package:intro_example/core/cubit/states.dart';
import 'package:intro_example/features/custom%20widgets/result_with_output.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';


class Result extends StatelessWidget {
  final controllerr = ScreenshotController();
   Result({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: ( context, state) {
        if(state is ModelLoadedSTate){
          AppCubit.get(context).iimage = null;
          AppCubit.get(context).outputs = null;
        }
        if(state is FinalResultState) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title:  Text(
                      AppCubit
                          .get(context)
                          .outputs![0]['label'],
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                    ),
                  ),
                  content: const Text(
                    'Warning: this result may not accurate so you need to consulting a doctor as soon as possible\n(The accuracy of the results is 91%)',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'))
                  ],
                );
              });
        }
        },
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          cubit.iimage == null ? Container() : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 50),
                              ),
                              onPressed: () async {
                                final imageee = await controllerr.captureFromWidget(const Result1());
                                if (imageee == null) {
                                  return ;
                                }
                                await cubit.save(imageee);
                              },
                              child: const Text(
                                'save to the Gallery',
                                style: TextStyle(
                                    fontSize: 17
                                ),
                              ),
                            ),
                          ),
                          cubit.iimage == null ? Container() : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 50),
                              ),
                              onPressed: (){},
                              child: const Text(
                                'save to the Cloud',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 50),
                backgroundColor: Colors.transparent,
                elevation: 1.5,
              ),
              onPressed: (){
                cubit.pickImage();
              },
              child: const Text(
                'classify',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            )
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

  // loadModel() async {
  //   await Tflite.loadModel(
  //     model: "assets/model.tflite",
  //     labels: "assets/labels.txt",
  //   );
  // }
  // @override
  // void dispose() {
  //   Tflite.close();
  //   super.dispose();
  // }
}

