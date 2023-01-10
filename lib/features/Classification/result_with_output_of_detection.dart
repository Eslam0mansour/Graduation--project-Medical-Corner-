import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_example/core/cubit/cubit.dart';
import 'package:intro_example/core/cubit/states.dart';

class Result1 extends StatelessWidget {
  AppCubit cubit;

  Result1({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 802.9;
    return Container(
      height: height * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.lightBlueAccent,
      ),
      child: Column(
        children: [
          Image.file(
            cubit.iimage!,
            fit: BoxFit.contain,
            height: height * 0.48,
            width: 350,
          ),
          Container(
            width: double.infinity,
            height: height * 0.1,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  "Result: ${cubit.outputs![0]["label"]}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  "Rate: ${cubit.outputs![0]["confidence"] * 100} %",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    );
  }
}

// Container(
// height: height * 0.6,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(30),
// color: Colors.lightBlueAccent,
// ),
// child: Column(
// children: [
// Image.file(
// cubit.iimage!,
// fit: BoxFit.contain,
// height: height * 0.48,
// width: width * 0.9,
// ),
// Container(
// width: double.infinity,
// height: height * 0.1,
// padding: const EdgeInsets.all(8),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// color: Colors.white,
// ),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const Spacer(),
// Text(
// "Result: ${cubit.outputs![0]["label"]}",
// style: const TextStyle(
// color: Colors.black,
// fontSize: 18,
// fontWeight: FontWeight.w500),
// ),
// const Spacer(),
// Text(
// "Rate: ${cubit.outputs![0]["confidence"]*100} %",
// style: const TextStyle(
// color: Colors.black,
// fontSize: 20,
// fontWeight: FontWeight.w500),
// ),
// const Spacer(),
// ],
// ),
// ),
// SizedBox(
// height: height * 0.02,
// ),
// ],
// ),
// );