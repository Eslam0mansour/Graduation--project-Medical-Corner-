import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_example/core/cubit/cubit.dart';
import 'package:intro_example/core/cubit/states.dart';



class Result1 extends StatelessWidget {
  const Result1 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: ( context, state) { },
      builder: ( context,  state) {
        AppCubit cubit = AppCubit.get(context);
        //use media query to get the height and width of the screen
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;

        return Container(
          color: Colors.black45,
          child: Stack(
            children: [
              SizedBox(
                height: height * 0.65,
                child: Image.file(
                    cubit.iimage!,
                    fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Positioned(
                bottom:0,
                right: 50,
                child: Text(
                  ">>${cubit.outputs![0]["label"]} \n >>${cubit.outputs![0]["confidence"]} %",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    background: Paint()..color = Colors.yellowAccent,
                  ),
                  textAlign: TextAlign.center,

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
