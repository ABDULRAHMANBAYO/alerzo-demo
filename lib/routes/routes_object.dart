import 'package:alerzo_demo/screens/home.dart';
import 'package:alerzo_demo/screens/login.dart';
import 'package:alerzo_demo/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'animation/slide_right.dart';
import 'routes.dart';

//  ignore: top_level_function_literal_block
var routes = (RouteSettings settings) {
  switch (settings.name) {
    case Routes.initialRoute:
      return SlideRightRoute(page: LoginScreen());

    // case Routes.login:
    //   return SlideRightRoute(page: LoginScreen());

    case Routes.home:
      return SlideRightRoute(page: HomeScreen());

    case Routes.signUp:
      return SlideRightRoute(page: SignUpScreen());

    default:
  }
  return null;
};
