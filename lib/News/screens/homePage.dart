// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/cubit/cuoit.dart';
import '../shared/cubit/states.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCupit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCupit cupit = AppCupit.get(context);
        return Scaffold(
          body: cupit.screens,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              cupit.hel = [];
              cupit.getHel();
              Future.delayed(const Duration(seconds: 1)).then(
                    (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: cupit.mainColor,
                      content: Text(
                        !(cupit.isEnglish)
                            ? "تم تحديث الاخبار بنجاح"
                            : "The News Has Been Updated Successfully",
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
