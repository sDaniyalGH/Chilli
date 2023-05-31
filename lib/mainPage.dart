// todo : line 80

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:restaurant/Widgets/header.dart';
import 'package:dio/dio.dart';
import 'package:restaurant/model/MenuStoryList.dart';
import 'EachProduct.dart';
import 'Widgets/bottomNavigation.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> titles = [
    'منو',
    'منو',
    'منو',
    'منو',
    'منو',
    'منو',
    'منو',
    'منو',
    'منو',
    'منو'
  ];

  late Future<List<MenuStoryList>> menuStoryList;

  Future<List<MenuStoryList>> getDateStoryList() async {
    List<MenuStoryList> model = [];

    Dio dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/photos');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      for (var item in data) {
        var id = item['id'];
        String title = item['title'];
        String imgurl = item['thumbnailUrl'];
        // Display the title and photo
        // print('Title: $title');
        // print('Photo URL: $imgurl');
        model.add(MenuStoryList(id, title, imgurl));
      }
      return model;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    menuStoryList = getDateStoryList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
        child: Column(children: [
        Header(),
        SearchBar(),
        FutureBuilder(
            future: menuStoryList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MenuStoryList> model = snapshot.data!;
                return MenuStory(models: model);
              } else {
                // change it later
                return Container();
              }
            }),
        Block1(title: 'پر فروش ترین ها'),
        Block1(title: 'پیشنهادی'),
      ]),
    ));
  }
}

class Block1 extends StatelessWidget {
  final String title;
  const Block1({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'نمایش همه',
                    style: TextStyle(color: Colors.red),
                  )),
              Text(
                title,
                style:
                    TextStyle(fontFamily: 'Vazir', fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ListBlock(),
        ],
      ),
    );
  }
}

class ListBlock extends StatelessWidget {
  const ListBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EachProduct(),
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 189,
        child: ListView.builder(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemBlock(
              title: 'چیزبرگر مخصوص',
              price: 'تومان ${replaceFarsiNumber('185000')}',
            );
          },
        ),
      ),
    );
  }

  String replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }
}

class ItemBlock extends StatelessWidget {
  final String title;
  final String price;

  const ItemBlock({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 207,
        height: 159,
        // color: Colors.orange,
        child: Stack(
          children: [
            Image.asset('assets/img/pic/pic1.png'),
            Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 90,
                  height: 189,
                  // color: Colors.red,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Vazir',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 126,
                    height: 35,
                    child: Center(
                      child: Text(
                        price,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Vazir',
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xff232734),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child: Center(child: Icon(CupertinoIcons.add)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      child: TextField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
            suffixIcon: Icon(CupertinoIcons.search),
            hintText: 'جستجو کنید'),
      ),
    );
  }
}

class MenuStory extends StatelessWidget {
  //final List<String> titles;
  final List<MenuStoryList> models;

  const MenuStory({
    super.key,
    //required this.titles,
    required this.models,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      //color: Colors.red,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemMenuStory(
              title: models[index].title,
              imgurl: models[index].imgurl,
            );
          }),
    );
  }
}

class ItemMenuStory extends StatelessWidget {
  final String title;
  final String imgurl;

  const ItemMenuStory({
    super.key,
    required this.title,
    required this.imgurl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          ItemNormal(
            imgurl: imgurl,
          ), // for clicked and unclicked
          Text(title)
        ],
      ),
    );
  }
}

class ItemNormal extends StatelessWidget {
  final String imgurl;
  const ItemNormal({
    super.key,
    required this.imgurl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 49,
      height: 49,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32), color: Color(0xffF1F1F1)),
      child: Image.network(
        imgurl,
        width: 32,
        height: 32,
        fit: BoxFit.cover,
      ),
      // child: Image.asset(
      //   'assets/img/icons/item1.png',
      //   width: 32,
      //   height: 32,
      // ),
    );
  }
}
