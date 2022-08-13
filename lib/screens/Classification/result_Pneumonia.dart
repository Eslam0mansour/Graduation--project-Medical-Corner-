import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';
import 'package:tflite/tflite.dart';
import 'package:permission_handler/permission_handler.dart';
class Result extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Result> {
  List? _outputs;
  File? _image;
  File? _imagee;
  bool _loading = false;
   String? url;
  File? _pickedImage;

  late File selectedImage;
  late File selectedImagee;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  final ImagePicker _picker = ImagePicker();
  final controllerr = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: controllerr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _loading
            ? Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
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
                _image == null ? Container(
                  child: Lottie.asset('assets/3.json'),
                ) : result1(),
                _image == null ? Container() : Padding(
                  padding: const EdgeInsets.only(
                    top: 30
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                    ),
                    onPressed: () async {
                      final imageee = await controllerr.captureFromWidget(result1());
                      if (imageee == null)
                        return ;
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
                SizedBox(
                  height: 20,
                ),
                _image == null ? Container() : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                  ),
                  onPressed: pickImagetocloud,
                  child: const Text(
                    'save result to the Cloud',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _image == null ? Container() : const Text(
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
          onPressed: pickImage,
          child: Icon(Icons.image),
        ),
      ),
    );
  }
  Future pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = selectedImage = File(image.path);
    });
    classifyImage(File(image.path));
  }
  Future pickImagetocloud() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _loading = true;

      _pickedImage = pickedImageFile;
    });
    upload( File(_pickedImage!.path));
  }
  // for upload to cloud
  Future upload( File imagee) async {
    final user = FirebaseAuth.instance.currentUser;
    final _id = user!.uid;
    final ref = FirebaseStorage.instance.ref().
    child('userImages').child(_id+'.Pneumonia.jpg');
    await ref.putFile(File(imagee.path));
    url = await ref.getDownloadURL();
    if( user != null) {
      await FirebaseFirestore.instance.collection('users').
      doc(user.uid).update({
        'imageurl': url,
      });
      setState(() {
        _loading = false;
      });
    }
    else {
      print('erorrrrrr');
    }
  }

   Future<String>  save(Uint8List bytes) async
   {
     await [Permission.storage].request();
     final name = 'result of Xray';
     final result = await ImageGallerySaver.saveImage(bytes , name : name);
     return result['filepath'];
  }

  Widget result1() => Container(
    color: Colors.white,
    child: Stack(

    children: [
      Image.file(_image!),
      const SizedBox(
        height: 30,
      ),
      _outputs == null ? Container() : Positioned(
        bottom:0,
        right: 50,
        child: Text(
          "${_outputs![0]["label"]}",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            background: Paint()..color = Colors.white,
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      )
    ],
),
  );

   Future classifyImage( File image ) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.2,
      imageMean: 0.0,
      imageStd: 180.0,
      asynch: true
    );
    setState(() {
      _loading = false;
      _outputs = output!;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",

    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}

