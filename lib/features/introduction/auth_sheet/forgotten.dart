import 'package:flutter/material.dart';
import 'package:intro_example/features/custom%20widgets/my_form_field.dart';

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
      backgroundColor: const Color(0xff17c1ff),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: deviceSize.height * 0.07),
                MyFormField(
                  controller: emailController,
                  hint: 'Email',
                  prefixIcon: Icons.email,
                  isPassword: false,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.white,
                    minimumSize: Size(deviceSize.width * 1, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Get New password'),
                ),
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
