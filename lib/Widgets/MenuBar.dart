import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/mainPage.dart';
import 'package:restaurant/model/MenuStoryList.dart';

class MenuBaar extends StatelessWidget {
  const MenuBaar({
    super.key,
    required this.menuStoryList,
  });

  final Future<List<MenuStoryList>> menuStoryList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            'منو',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: 'vazir',
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(height: 4,),
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
      ],
    );
  }

  static Future<List<MenuStoryList>> getDateStoryList() async {
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
        reverse: true,
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