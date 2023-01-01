import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';


class Result1 extends StatelessWidget {
  const Result1 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: ( context, state) { },
      builder: ( context,  state) {
        AppCubit cubit = AppCubit.get(context);
        return Container(
          color: Colors.white,
          child: Stack(
            children: [
              Image.file(cubit.iimage!),
              const SizedBox(
                height: 30,
              ),
              cubit.outputs == null ? Container() : Positioned(
                bottom:0,
                right: 50,
                child: Text(
                  "${cubit.outputs![0]["label"]}",
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
      },
    );
  }
}
