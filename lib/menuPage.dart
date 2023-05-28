import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'Widgets/bottomNavigation.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          color: Colors.black,
        ),
        // header ha ro az mainPage begir biar inja
        // Expanded(
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 100,
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ItemListView(
                  title: "چیزبرگر مخصوص",
                  description:
                      "250   خیارشور، گوجه, خیارشور، گوجه گوجه",
                  imgurl: "https://picsum.photos/200/300",
                  price: "185,000 تومان",
                );
              }),
        ),
        // )
      ]),
    )
    );
  }
}

class ItemListView extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imgurl;

  const ItemListView({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imgurl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            // border: Border.all(
            //   color: Colors.black,
            //   width: 1,
            // ),
            // borderRadius: BorderRadius.circular(24)
            ),
        width: 337,
        height: 125,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  imgurl,
                  width: 91,
                  height: 83,
                ),
                Text(price),
              ],
            ),
            Column(
              children: [
                Text(title),
                Text(
                  description,
                  //softWrap: true,
                  //maxLines: 2,
                  textAlign: TextAlign.right,
                   overflow: TextOverflow.clip,
                ),
                btn_add_to_cart(txt: "افزودن به سبد")
              ],
            )
          ],
        ),
      ),
    );
  }
}

class btn_add_to_cart extends StatelessWidget {
  final String txt;

  const btn_add_to_cart({
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(txt), Icon(CupertinoIcons.cart)],
      ),
    );
  }
}
