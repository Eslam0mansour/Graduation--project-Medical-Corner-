import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_example/core/cubit/cubit.dart';
import 'package:intro_example/core/cubit/observer.dart';
import 'package:intro_example/core/cubit/states.dart';
import 'package:intro_example/core/router/app_router.dart';
import 'core/Network/news api service/dio_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  BlocOverrides.runZoned(
          () {runApp(MyApp(app: AppCubit()..getNews(),));},
      blocObserver: MyBlocObserver()
  );
}

class MyApp extends StatelessWidget {
  final AppCubit app;

  const MyApp({Key? key,required this.app}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   BlocProvider<AppCubit>(
      create: (context) => app,
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter().onGenerateRoute,
          );
        },
      ),
    );
  }
}
