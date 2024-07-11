import 'package:flutter/material.dart';
import 'package:revision_app/components/detail_item_header.dart';
import 'package:revision_app/constant.dart';
import 'package:revision_app/model/detail_screen_argument.dart';
import 'package:revision_app/model/items_model.dart';
import 'package:revision_app/sizeConfig.dart';

import 'components/detail_img.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DetailScreenArgument;

    double initialPrice = args.food.price;

    if (args == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('No arguments received!'),
        ),
      );
    }
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        children: [
          SizedBox(
            height: SizeConfig.blockH! * 2,
          ),
          DetailItemHeader(),
          DetailImage(args: args),
          Container(
            color: kPrimaryLightColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockW! * 4),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              args.food.name.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              '\$${(initialPrice * quantity).toString()}',
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: kPrimaryColor),
                            )
                          ],
                        )),
                        SizedBox(width: SizeConfig.blockW! * 2),
                        Material(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30),
                          child: Row(children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity -= 1;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: kPrimaryLightColor,
                                )),
                            SizedBox(width: SizeConfig.blockW! * 2),
                            Text(
                              quantity.toString(),
                              style: TextStyle(
                                  color: kPrimaryLightColor, fontSize: 18),
                            ),
                            SizedBox(width: SizeConfig.blockW! * 2),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity += 1;
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: kPrimaryLightColor,
                                )),
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockH! * 3,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        SizedBox(
                          width: SizeConfig.blockW! * 2,
                        ),
                        Text(
                          args.food.rate.toString(),
                          style: TextStyle(color: Colors.black38, fontSize: 16),
                        ),
                        Spacer(),
                        Icon(
                          Icons.fiber_manual_record,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: SizeConfig.blockW! * 2,
                        ),
                        Text(
                          '${args.food.kcal}kcal',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Spacer(),
                        Icon(
                          Icons.access_time_filled,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: SizeConfig.blockW! * 2,
                        ),
                        Text(
                          args.food.cookingTime,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockH! * 3,
                    ),
                    Text(
                      args.food.description,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    SizedBox(
                      height: SizeConfig.blockH! * 3,
                    ),
                    Material(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockW! * 4),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                                color: kPrimaryLightColor, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockH! * 4,
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
