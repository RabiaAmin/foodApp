import 'package:flutter/material.dart';

import '../constant.dart';
import '../model/detail_screen_argument.dart';
import '../sizeConfig.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({
    super.key,
    required this.args,
  });

  final DetailScreenArgument args;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockH! * 40,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: SizeConfig.blockH! * 25,
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(250),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 22,
                      offset: Offset(0, 22))
                ],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(250),
                  child: Image.network(
                    args.food.image,
                    height: SizeConfig.blockH! * 30,
                    width: SizeConfig.blockW! * 60,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
