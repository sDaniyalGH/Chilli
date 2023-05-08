import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {},
          color: Color(0xff212435),
          iconSize: 24,
        ),
        Column(
          children: [
            Text(
              "خوش آمدید",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontFamily: 'Vazir',
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "کاوه حاجی نجف",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Vazir',
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}