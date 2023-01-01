import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_example/router/app_router.dart';
import 'package:intro_example/shared/cubit/cubit.dart';
import 'package:intro_example/shared/cubit/observer.dart';
import 'package:intro_example/shared/cubit/states.dart';
import 'shared/shared_preferences.dart';
import 'netWork/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.inti();
  await CachHelper.inti();
  BlocOverrides.runZoned(
          () {runApp(MyApp(app: AppCubit()..getHel(),));},
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
