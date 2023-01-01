

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
import 'package:intro_example/router/screens_Names.dart' as screens;

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
        return MaterialPageRoute(builder: (_) => const NewsPage());
      case screens.pneumoniaScreen:
        return MaterialPageRoute(builder: (_) => const PneumoniaScreen());
      case screens.brainScreen:
        return MaterialPageRoute(builder: (_) => const BrainScreen());
      case screens.diabetesScreen:
        return MaterialPageRoute(builder: (_) => const DiabetesScreen());
      case screens.heartDisease:
        return MaterialPageRoute(builder: (_) => const HeartDisease());
      case screens.profile:
        return MaterialPageRoute(builder: (_) =>  Profile());
      case screens.aboutus:
        return MaterialPageRoute(builder: (_) => const Aboutus());
      case screens.contactus:
        return MaterialPageRoute(builder: (_) => const Contactus());
      default:
        return null;
    }
  }
}
