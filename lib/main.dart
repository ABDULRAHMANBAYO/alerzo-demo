import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'routes/routes_object.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        initialRoute: Routes.initialRoute,
        onGenerateRoute: routes);
  }
}
