import 'package:flutter/material.dart';
import 'package:revision_app/constant.dart';
import 'package:revision_app/model/detail_screen_argument.dart';
import 'package:revision_app/model/items_model.dart';
import 'package:revision_app/routes.dart';
import 'package:revision_app/sizeConfig.dart';

class ItemDisplay extends StatefulWidget {
  const ItemDisplay({super.key});

  @override
  State<ItemDisplay> createState() => _ItemDisplayState();
}

class _ItemDisplayState extends State<ItemDisplay> {
  List<bool> isFavoriteList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (foodsItems.isNotEmpty) {
      isFavoriteList = List<bool>.filled(foodsItems.length, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (foodsItems.isEmpty) {
      return Center(child: Text("No items to display"));
    } else {
      return GridView.builder(
          shrinkWrap: true,
          itemCount: foodsItems.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 256),
          itemBuilder: (context, index) {
            FoodDetail food = foodsItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.detail,
                  arguments: DetailScreenArgument(food: food),
                );
              },
              child: Container(
                height: SizeConfig.blockH! * 5,
                width: SizeConfig.blockW! * 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black12),
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockW! * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.blockH! * 1.5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(125),
                          child: Image.network(
                            food.image,
                            height: SizeConfig.blockH! * 15,
                            width: SizeConfig.blockW! * 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockH! * 1.5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockW! * 2),
                          child: Text(
                            food.name,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockH! * 0.5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockW! * 2),
                          child: Row(
                            children: [
                              Text(
                                food.cookingTime,
                                style: TextStyle(color: Colors.black45),
                              ),
                              Spacer(),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Text(
                                food.rate.toString(),
                                style: TextStyle(color: Colors.black45),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockW! * 2,
                              vertical: SizeConfig.blockH! * 2),
                          child: Text(
                            '\$${food.price}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFavoriteList[index] = !isFavoriteList[index];
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockW! * 36,
                          top: SizeConfig.blockH! * 1.5),
                      child: Icon(
                        isFavoriteList[index]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            isFavoriteList[index] ? Colors.red : Colors.black54,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Material(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: InkWell(
                        child: Padding(
                          padding: EdgeInsets.all(SizeConfig.blockW! * 2.5),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            );
          });
    }
  }
}
