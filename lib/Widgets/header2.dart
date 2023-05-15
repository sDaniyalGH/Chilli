import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header2 extends StatelessWidget {
  const Header2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {},
          color: Color(0xff212435),
          iconSize: 24,
        ),
        IconButton(
          icon: Icon(CupertinoIcons.profile_circled),
          onPressed: () {},
          color: Color(0xff212435),
          iconSize: 24,
        ),
      ],
    );
  }
}