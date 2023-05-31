import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:restaurant/Widgets/header.dart';

import 'Widgets/bottomNavigation.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [
       Header(),
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
                      "12345678912345678912345678912123456789123456789",
                  imgurl: "https://picsum.photos/200/300",
                  price: "185,000 تومان",
                );
              }),
        ),
        // )
      ]),
    ));
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
            border: Border.all(
              color: Color(0xffA7A7A7),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(24)),
        width: 337,
        height: 125,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      imgurl,
                      width: 91,
                      height: 83,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'vazir',
                        color: Color(0xff434343)
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'vazir',
                      ),
                    ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    Container(
                      width: 250,
                      child: Text(
                        description,
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          color: Color(0xff878787),
                          fontSize: 12,
                          fontFamily: 'vazir',
                        ),
                      ),
                    ),
                    btn_add_to_cart(txt: "افزودن به سبد")
                  ],
                ),
              )
            ],
          ),
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
      //padding: EdgeInsets.all(4),
      width: 116,
      height: 24,
      decoration: BoxDecoration(
          color: Color(0xff232734), borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            txt,
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontFamily: 'vazir'),
          ),
          Icon(
            size: 16,
            CupertinoIcons.cart,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
