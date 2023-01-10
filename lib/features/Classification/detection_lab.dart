import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_example/core/cubit/cubit.dart';
import 'package:intro_example/core/cubit/states.dart';
import 'package:intro_example/features/Classification/result_with_output_of_detection.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';

class Result extends StatelessWidget {
  String lottieAnimationName;
  double imageMean;
  double imageStd;
  int numResults;
  double threshold;
  final controllerr = ScreenshotController();

  Result({
    Key? key,
    required this.lottieAnimationName,
    required this.imageMean,
    required this.imageStd,
    required this.numResults,
    required this.threshold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                title: const Text(
                  'My Detection Lab',
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
                            cubit.iimage == null
                                ? Container(
                                    child: Lottie.asset(
                                        'assets/lottie_animations/$lottieAnimationName.json'),
                                  )
                                : Result1(
                                    cubit: cubit,
                                  ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  cubit.iimage == null
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(100, 50),
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            onPressed: () async {
                                              final imageee = await controllerr
                                                  .captureFromWidget(Result1(
                                                cubit: cubit,
                                              ));
                                              await AppCubit.get(context)
                                                  .saveImage(imageee);
                                            },
                                            child: const Text(
                                              'save to the Gallery',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ),
                                  cubit.iimage == null
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(100, 50),
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            onPressed: () {},
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
              bottomNavigationBar: BottomAppBar(
                elevation: 0,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 20, right: 20, left: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      backgroundColor: Colors.blue,
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      cubit.pickImage(
                        imageMean: imageMean,
                        imageStd: imageStd,
                        numResults: numResults,
                        threshold: threshold,
                      );
                    },
                    child: const Text(
                      'Classify',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
      listener: (context, state) {
        if (state is FinalResultState) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    AppCubit.get(context).outputs![0]['label'],
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                    ),
                  ),
                  content: const Text(
                    'Warning: this result may not accurate so you need to consulting a doctor as soon as possible\n(The accuracy of the results is 91%)',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  actions: [
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(100, 50),
                        ),
                      ),
                    ),
                  ],
                );
              });
        }
      },
    );
  }
}

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
