import 'package:flutter/material.dart';
import 'package:restaurant/mainPage.dart';
import 'package:restaurant/menuPage.dart';

import 'Widgets/bottomNavigation.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigation(
          onTap: (int nowIndex) {
            setState(() {
              selected = nowIndex;
            });
          },
        ),
        body: IndexedStack(
          index: selected,
          children: [
            MainPage(),
            MenuPage(),
          ],
    ));
  }
}
