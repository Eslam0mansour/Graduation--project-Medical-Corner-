import 'package:flutter/material.dart';
import 'package:intro_example/router/custom_page_route.dart';
import 'package:intro_example/screens/Classification/Pneumonia_screen.dart';
import 'package:intro_example/screens/Classification/brain_tumour.dart';
import 'package:intro_example/screens/Nvdrawer/Contactus.dart';
import 'package:intro_example/screens/Nvdrawer/aboutus.dart';
import 'package:intro_example/screens/Nvdrawer/profile.dart';
import 'package:intro_example/screens/Prediction/Diabetes_screen.dart';
import 'package:intro_example/screens/Prediction/Heart_screen.dart';
import 'package:intro_example/screens/home.dart';
import 'package:intro_example/screens/introduction/introduction.dart';
import 'package:intro_example/screens/splash.dart';
import 'package:intro_example/const/screens_Names.dart' as screens;

import '../screens/News/screens/health.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const SplashScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homepage:
        return CustomPageRoute(
            direction: AxisDirection.left, child: const Homepage());
      case screens.introductionPage:
        return MaterialPageRoute(builder: (_) => const IntroductionPage());
      case screens.newsPage:
        return CustomPageRoute(
            direction: AxisDirection.up, child: const NewsPage());
      case screens.pneumoniaScreen:
        return CustomPageRoute(
            direction: AxisDirection.left, child: const PneumoniaScreen());
      case screens.brainScreen:
        return CustomPageRoute(
            direction: AxisDirection.left, child: const BrainScreen());
      case screens.diabetesScreen:
        return CustomPageRoute(
            direction: AxisDirection.left, child: const DiabetesScreen());
      case screens.heartDisease:
        return CustomPageRoute(
            direction: AxisDirection.left, child: const HeartDisease());
      case screens.profile:
        return CustomPageRoute(
            direction: AxisDirection.right, child: Profile());
      case screens.aboutus:
        return CustomPageRoute(
            direction: AxisDirection.right, child: const Aboutus());
      case screens.contactus:
        return CustomPageRoute(
            direction: AxisDirection.right, child: const Contactus());
      default:
        return null;
    }
  }
}
