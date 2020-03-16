import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xFFFF6700));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitcoin Price',
      theme: ThemeData(
        primaryColor: Color(0xFFFF6700),
      ),
      initialRoute: Modular.initialRoute,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
