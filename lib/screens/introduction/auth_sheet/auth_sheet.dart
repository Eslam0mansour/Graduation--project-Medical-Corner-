import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intro_example/screens/introduction/auth_sheet/forgotten.dart';
import 'package:intro_example/screens/introduction/auth_sheet/sign_up.dart';
import 'package:intro_example/screens/introduction/components/paints/auth_sheet_paint/auth_sheet_paint.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../Network/services/auth.dart';
import '../../home.dart';
class AuthSheet extends StatefulWidget {
  final Function() expandCallback;
  bool isExpanded;
  AuthSheet({Key? key, required this.expandCallback, this.isExpanded = true})
      : super(key: key);

  @override
  State<AuthSheet> createState() => _AuthSheetState();
}

class _AuthSheetState extends State<AuthSheet> {
  final TextEditingController
  emailController = TextEditingController(),
      nameController = TextEditingController(),
      passwordController = TextEditingController();
  late bool expandAuthSheet;

  @override
  void initState() {
    super.initState();
    expandAuthSheet = false;
  }
  final _formKeya = GlobalKey<FormState>();
  late String _email = '', _password = '';
  AuthBase authBase = AuthBase();
  final FirebaseAuth  auth = FirebaseAuth.instance;
  Future<void> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if(googleSignInAccount != null) {

      final userr = FirebaseAuth.instance.currentUser;
      final _store = FirebaseFirestore.instance;

      if( userr != null) {
        _store.collection('users').doc(userr.uid).set({
          'name': userr.displayName,
          'uid' : userr.uid,
          'email' : userr.email,
          'gender': null ,
          'imageurl' : null,
          'imageurl2' : null,

        });
      }
      else
      {
        print('try later ');
      }
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>  const Homepage())
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      width: deviceSize.width,
      height: deviceSize.height ,
      child: CustomPaint(
        painter: AuthSheetPaint(),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            margin: EdgeInsets.only(top: deviceSize.height * 0.075),
            width: deviceSize.width * 0.8,
            height: deviceSize.height * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: InkWell(
                    hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    widget.expandCallback.call();
                      },
                     child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(flex: 2),
                      InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            widget.expandCallback.call();
                          },
                          child: const Text('Sign in',
                              style: TextStyle(
                                color: Color(0xff03045E) ,
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                              ))),
                      const Spacer(flex: 2),
                    ],
                  ),
                )),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Welcome to sign up page.,',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                // sign in
                Expanded(
                  flex: 9,
                  child: Form(
                    key: _formKeya,
                    child: Column(
                      children: [
                        Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.white,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Center(
                                    child: TextFormField(
                                      onChanged: (value) {
                                        _email = value;
                                      },
                                      validator: (value) =>
                                      value!.isEmpty ? 'You must enter a valid email' : null,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade400),
                                    hintText: 'Email',
                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                )))),//دا الايميل
                        const SizedBox(height: 12),
                        Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Center(
                                    child: TextFormField(
                                      onChanged: (value) {
                                        _password = value;
                                      },
                                      validator: (value) =>
                                      value!.length <= 6 ?
                                      'Your password must be larger than 6 characters'
                                          : null,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade400),
                                    hintText: 'Password',

                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                )))), // دا الباسورد
                        const SizedBox(height: 12),
                        SizedBox(
                          height: deviceSize.height * 0.05,
                            width: deviceSize.width,
                            child: Material(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: InkWell(
                                  onTap: () async {
                                 if (_formKeya.currentState!.validate()) {
                                     await authBase.login(_email, _password);
                                     final user = FirebaseAuth.instance.currentUser;
                                     if (user != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Homepage(),
                                        ),
                                      );
                                      print('ok');
                                    }
                                     else {
                                        showOkAlertDialog(
                                         context: context,
                                         title: 'Error',
                                         message: 'you must enter a valid email and password.',
                                       );
                                     }

                                 }
                                    FocusScope.of(context).unfocus();
                                  },
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: const Center(
                                        child: Text('Sign in',
                                            style: TextStyle(
                                                color: Color(0xff03045E),
                                                fontSize: 20,
                                                fontWeight:
                                                    FontWeight.w800)
                                        )
                                    )
                                )
                            )),// زرار sign in
                        const SizedBox(height: 12),
                        SizedBox(
                            height: 24,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          hoverColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          highlightColor:
                                          Colors.transparent,
                                          focusColor: Colors.transparent,
                                          onTap: () {
                                            FocusScope.of(context).unfocus();

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const forgotten() ,
                                              ),
                                            );
                                          },
                                          child: const Text(
                                              'Forgotten Password?',
                                              style: TextStyle(
                                                  color: Colors.white)))
                                    ]))),
                        const SizedBox(height: 12),
                        const Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 16,
                          ),
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                                style: const TextStyle(color: Colors.grey),
                                children: [
                                  const TextSpan(
                                      text: 'Don\'t have an account? ',
                                      style: TextStyle(
                                          color: Colors.white
                                      )

                                  ),
                                  TextSpan(
                                    text: ' Register Now',
                                    style: const TextStyle(
                                        color: Color(0xff03045E),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      FocusScope.of(context).unfocus();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Sign_up() ,
                                        ),
                                      );
                                    },
                                  ),
                                ]
                            ),
                          ),
                        ),
                        const SizedBox(
                          height:10
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0xff03045E),
                            backgroundColor: Colors.white,
                            maximumSize: const Size(300,50),
                            minimumSize: const Size(300,50),
                          ),
                          onPressed: () async {
                            await googleSignIn();
                          },
                          icon: SvgPicture.asset(
                              "assets/googleicon.svg",
                            height: 35,
                          ),
                          label: const Text(
                            'Sign up with Google',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
