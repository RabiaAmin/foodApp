import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revision_app/constant.dart';
import 'package:revision_app/homeScreen.dart';
import 'package:revision_app/model/items_model.dart';
import 'package:revision_app/onBoardingScreen.dart';
import 'package:revision_app/model/model.dart';
import 'package:revision_app/productDetail.dart';
import 'package:revision_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.onBoarding,
      routes: {
        Routes.home: (context) => HomeScreen(),
        Routes.detail: (context) => ProductDetail(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: kPrimaryLightColor,
        useMaterial3: true,
      ),
      home: OnBoardingScreen(),
    );
  }
}
