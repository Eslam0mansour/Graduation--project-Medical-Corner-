import 'package:flutter/material.dart';
import 'package:intro_example/core/router/custom_page_route.dart';
import 'package:intro_example/features/Classification/pneumonia/Pneumonia_screen.dart';
import 'package:intro_example/features/Classification/brain%20tumour/brain_tumour.dart';
import 'package:intro_example/features/Nvdrawer/Contactus.dart';
import 'package:intro_example/features/Nvdrawer/aboutus.dart';
import 'package:intro_example/features/Nvdrawer/profile.dart';
import 'package:intro_example/features/Prediction/Diabetes_screen.dart';
import 'package:intro_example/features/Prediction/Heart_screen.dart';
import 'package:intro_example/features/home.dart';
import 'package:intro_example/features/introduction/auth_sheet/sign_up.dart';
import 'package:intro_example/features/introduction/introduction.dart';
import 'package:intro_example/features/splash.dart';
import 'package:intro_example/core/const/screens_Names.dart' as screens;


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
      case screens.signup:
        return CustomPageRoute(
            direction: AxisDirection.left, child: const Sign_up());
      case screens.introductionPage:
        return MaterialPageRoute(builder: (_) => const IntroductionPage());
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
