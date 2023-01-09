import 'package:flutter/material.dart';

class forgotten extends StatefulWidget {
  const forgotten({Key? key}) : super(key: key);

  @override
  State<forgotten> createState() => _forgottenState();
}

class _forgottenState extends State<forgotten> {
  final TextEditingController emailController = TextEditingController(),
      nameController = TextEditingController(),
      passwordController = TextEditingController(),
      repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueAccent.shade400,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: deviceSize.height * 0.07),
                Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Center(
                            child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            hintText: 'Email',
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        )))),
                const SizedBox(height: 12),
                SizedBox(
                    height: deviceSize.height * 0.05,
                    width: deviceSize.width,
                    child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: InkWell(
                            onTap: () {},
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Center(
                                child: Text('Get New password',
                                    style: TextStyle(
                                        color: Colors.blue.shade500,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800)))))),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
