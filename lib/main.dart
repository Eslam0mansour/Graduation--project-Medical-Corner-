import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_example/screens/Classification/Pneumonia_screen.dart';
import 'package:intro_example/screens/Classification/brain_tumour.dart';
import 'package:intro_example/screens/News/screens/homePage.dart';
import 'package:intro_example/screens/Predicition/Diabetes_screen.dart';
import 'package:intro_example/screens/Predicition/Heart_screen.dart';
import 'package:intro_example/screens/home.dart';
import 'package:intro_example/screens/introduction/introduction.dart';
import 'package:intro_example/shared/cubit/cubit.dart';
import 'package:intro_example/shared/cubit/observer.dart';
import 'package:intro_example/shared/cubit/states.dart';
import 'package:lottie/lottie.dart';
import 'shared/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';

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
            initialRoute: 'splash',
            routes: {
              'splash' :(context) =>  const SplashScreen(),
              'Home' :(context) =>  const Homepage(),
              'n' :(context) =>  const NewsPage(),
              'p' :(context) =>  const PneumoniaScreen(),
              'b' :(context) =>  const BrainScreen(),
              'd' :(context) =>  const DiabetesScreen(),
              'h' :(context) =>  const HeartDisease(),
            },
          );
        },
      ),
    );
  }
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/2.json'),
      backgroundColor: Colors.lightBlue,
      nextScreen: const IntroductionPage(),
      splashIconSize: 300,
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
