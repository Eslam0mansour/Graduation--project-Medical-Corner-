import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);
  @override
  State<Sign_up> createState() => _Sign_upState();
}
class _Sign_upState extends State<Sign_up> {

  final TextEditingController
  emailController = TextEditingController(),
      nameController = TextEditingController(),
      genderController = TextEditingController(),
      passwordController = TextEditingController(),
      repasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _store = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff00B4D8),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to sign up page.,',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: deviceSize.height * 0.07),
                  Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8),
                          child: Center(
                              child: TextFormField(
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
                  Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8),
                          child: Center(
                              child: TextFormField(
                                validator: (value) =>
                                value!.isEmpty ? 'You must enter a valid name' : null,
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400),
                                  hintText: 'name',
                                  border: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                              )))),//دا الاسم
                  const SizedBox(height: 12),
                  Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8),
                          child: Center(
                              child: TextFormField(
                                validator: (value) =>
                                value!.isEmpty ? 'You must enter a valid gender' : null,
                                controller: genderController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400),
                                  hintText: 'Gender',
                                  border: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                              )))),//دا النوع
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
                              if (_formKey.currentState!.validate()) {
                                 await FirebaseAuth.instance.
                                createUserWithEmailAndPassword
                                  (email: emailController.text, password: passwordController.text );
                                final user = FirebaseAuth.instance.currentUser;
                                if( user != null) {
                                  _store.collection('users').doc(user.uid).set({
                                    'name': nameController.text,
                                    'uid' : user.uid,
                                    'email' : user.email,
                                    'gender':genderController.text,
                                    'imageurl' : null,
                                    'imageurl2' : null,

                                  });
                                }
                                else
                                {
                                  print('try later ');
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homepage() ,
                                  ),
                                );
                              }
                              FocusScope.of(context).unfocus();
                            },
                              child: Center(
                                  child: Text('Sign up',
                                      style: TextStyle(
                                          color: Color(0xff03045E),
                                          fontSize: 20,
                                          fontWeight:
                                          FontWeight.w800)
                                  )
                              )
                          ),
                      )
                  ),// زرار sign in
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
