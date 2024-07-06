import 'package:flutter/material.dart';
import 'package:revision_app/constant.dart';
import 'package:revision_app/sizeConfig.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topHeader(),
        SizedBox(
          height: SizeConfig.blockH! * 4,
        ),
        title(),
        SizedBox(
          height: SizeConfig.blockH! * 2,
        ),
        searchBar(),
        SizedBox(
          height: SizeConfig.blockH! * 1.5,
        ),
        categorySelection(),
      ],
    );
  }
}

class categorySelection extends StatefulWidget {
  const categorySelection({
    super.key,
  });

  @override
  State<categorySelection> createState() => _categorySelectionState();
}

class _categorySelectionState extends State<categorySelection> {
  int indexCategory = 0;
  @override
  Widget build(BuildContext context) {
    List list = [
      "All",
      "Fruits",
      "Vegetables",
      "Grocery",
      "Fruits",
      "Vegetables",
      "Grocery"
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockW! * 3),
      child: SizedBox(
        height: SizeConfig.blockH! * 10,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    indexCategory = index;
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: SizeConfig.blockW! * 2,
                          left: SizeConfig.blockW! * 4),
                      child: Text(
                        list[index],
                        style: TextStyle(
                            fontSize: 18,
                            color: indexCategory == index
                                ? kPrimaryColor
                                : Colors.black45,
                            fontWeight: indexCategory == index
                                ? FontWeight.w500
                                : FontWeight.normal),
                      ),
                    )),
              );
            }),
      ),
    );
  }
}

class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockW! * 5),
      padding: EdgeInsets.only(right: SizeConfig.blockW! * 1),
      decoration: BoxDecoration(
        color: kAccrent1Color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: [
        Expanded(
            child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "search food",
              hintStyle: TextStyle(color: Colors.black54),
              prefixIcon: Icon(
                Icons.search,
                color: kPrimaryColor,
              )),
        )),
        Material(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            child: Container(
              height: SizeConfig.blockH! * 5,
              width: SizeConfig.blockW! * 12,
              alignment: Alignment.center,
              child: Icon(
                Icons.insert_emoticon_sharp,
                color: kPrimaryLightColor,
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class title extends StatelessWidget {
  const title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockW! * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi Nabin",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: kPrimaryColor),
          ),
          Text("Find Your Food",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ],
      ),
    );
  }
}

class topHeader extends StatelessWidget {
  const topHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockW! * 4),
      child: Row(
        children: [
          Material(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: SizeConfig.blockW! * 12,
                height: SizeConfig.blockH! * 6,
                child: Icon(
                  Icons.menu_open_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Spacer(),
          const Icon(
            Icons.location_pin,
            color: kPrimaryColor,
          ),
          Text(
            "ABC Karachi",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
          ),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/images/profileImg.png",
              width: SizeConfig.blockW! * 12,
              height: SizeConfig.blockH! * 8,
            ),
          ),
        ],
      ),
    );
  }
}
