import 'package:flutter/material.dart';
import 'package:revision_app/constant.dart';
import 'package:revision_app/sizeConfig.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockW! * 12),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: SizeConfig.blockH! * 15,
            ),
            Image.asset("assets/images/meal.png"),
            SizedBox(
              height: SizeConfig.blockH! * 3,
            ),
            const Text(
              "Fast Delivery at your doorstep!",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  color: kPrimaryLightColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.blockH! * 2,
            ),
            Text(
              "Home Delivery and online reservation systems for resturents & cafe",
              style: TextStyle(fontSize: 15, color: kPrimaryLightColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.blockH! * 12,
            ),
            Container(
              width: double.infinity,
              height: SizeConfig.blockH! * 6,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "let's Explore",
                  style: TextStyle(color: kPrimaryColor),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryLightColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
