import 'package:flutter/material.dart';
import 'package:revision_app/components/detail_item_header.dart';
import 'package:revision_app/constant.dart';
import 'package:revision_app/model/detail_screen_argument.dart';
import 'package:revision_app/model/items_model.dart';
import 'package:revision_app/sizeConfig.dart';

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
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

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
