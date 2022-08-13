import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/news_component.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';



class Hel extends StatelessWidget {
  const Hel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppState>(
      listener: (context,state){},
      builder: (context,state){
        List mylist =AppCubit.get(context).hel;
        if ((mylist.isEmpty)) {
          return const Center(child: CircularProgressIndicator(),);
        }else {
          return myList(mylist,context);
        }
      }
    );
  }
}