import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_example/core/cubit/cubit.dart';
import 'package:intro_example/core/cubit/states.dart';
import 'package:intro_example/features/custom%20widgets/my_form_field.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {

   TextEditingController emailController = TextEditingController(),
      nameController = TextEditingController(),
      passwordController = TextEditingController(),
      repasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is SignUpDoneState) {
          Navigator.of(context).pushReplacementNamed('/Home');
        }
        if (state is SignUpErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
            ),
          );
        }
        if (state is SignUpLoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.blue,
              content: Text('Loading...'),
            ),
          );
        }
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: const Color(0xff00B4D8),
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
                       const Align(
                        alignment: Alignment.topLeft,
                         child: Text(
                          'Sign Up with Email.',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                       ),
                      SizedBox(height: deviceSize.height * 0.07),
                      MyFormField(
                        label: 'Name',
                        hint: 'Enter your name',
                        prefixIcon: Icons.person,
                        controller: nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your name';
                          }
                        },
                      ),
                      SizedBox(height: deviceSize.height * 0.02),
                      MyFormField(
                        label: 'Email',
                        hint: 'Enter your email',
                        prefixIcon: Icons.email,
                        controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your email';
                          }
                        },
                      ),
                      SizedBox(height: deviceSize.height * 0.02),
                      MyFormField(
                        label: 'Password',
                        hint: 'Enter your password',
                        prefixIcon: Icons.lock,
                        isPassword: isPassword,
                        controller: passwordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                        },
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: isPassword ? Colors.grey : Colors.blue,
                          ),
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                        ),

                      ),
                      SizedBox(height: deviceSize.height * 0.02),
                      MyFormField(
                        label: 'Re-Password',
                        hint: 'Enter your password again',
                        prefixIcon: Icons.lock,
                        isPassword: isPassword,
                        controller: repasswordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password again';
                          } else if (value != passwordController.text) {
                            return 'Password not match';
                          }
                        },
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: isPassword ? Colors.grey : Colors.blue,
                          ),
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                        ),

                        onSubmit: (value) {
                          if (_formKey.currentState!.validate()) {
                            cubit.signUp(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            );
                          }
                        },
                      ),
                      SizedBox(height: deviceSize.height * 0.02),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            cubit.signUp(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            );
                          }
                          FocusScope.of(context).unfocus();
                        },
                        child: const Text('Sign Up'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          elevation: 5,
                          shadowColor: Colors.black,
                          backgroundColor: const Color(0xff71bbff),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: Size(
                            deviceSize.width * 1,
                            deviceSize.height * 0.075,
                          ),
                        ),
                      ),
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
      },
    );
  }
}
