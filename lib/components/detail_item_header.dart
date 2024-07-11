import 'package:flutter/material.dart';

import '../constant.dart';
import '../sizeConfig.dart';

class DetailItemHeader extends StatelessWidget {
  const DetailItemHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockW! * 4),
      child: Row(
        children: [
          Material(
            color: Colors.white.withOpacity(0.21),
            borderRadius: BorderRadius.circular(10),
            child: const BackButton(
              color: kPrimaryLightColor,
            ),
          ),
          Spacer(),
          Text(
            "Detail Food",
            style: TextStyle(fontSize: 20, color: kPrimaryLightColor),
          ),
          Spacer(),
          Material(
            color: Colors.white.withOpacity(0.21),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: SizeConfig.blockH! * 5,
                width: SizeConfig.blockW! * 11,
                alignment: Alignment.center,
                child: Icon(
                  Icons.favorite_border,
                  color: kPrimaryLightColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
