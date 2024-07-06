import 'package:flutter/material.dart';
import 'package:revision_app/components/header.dart';
import 'package:revision_app/components/items_display.dart';
import 'package:revision_app/constant.dart';
import 'package:revision_app/sizeConfig.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kAccrent1Color,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'notification'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'favorite'),
          ]),
      body: ListView(
        children: [
          SizedBox(
            height: SizeConfig.blockH! * 2,
          ),
          Header(),
          ItemDisplay(),
        ],
      ),
    );
  }
}
