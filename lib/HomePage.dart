import 'package:flutter/material.dart';
import 'package:restaurant/Widgets/header.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Widgets/bottomNavigation.dart';

class HomePage extends StatelessWidget {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: SingleChildScrollView(
          // child: Stack(
          // children: [
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: Header(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, position) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            "https://picsum.photos/200/300",
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          axisDirection: Axis.horizontal,
                          effect: WormEffect(
                            dotColor: Color(0xff9e9e9e),
                            activeDotColor: Color(0xff3a57e8),
                            dotHeight: 10,
                            dotWidth: 10,
                            radius: 16,
                            spacing: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              listCategory(
                title: 'نوشیدنی ها',
                each: [
                  'نوشیدنی های گرم',
                  'نوشیدنی های سرد',
                  'شیک ها',
                  'دسر',
                ],
              ),
              listCategory(
                title: 'فست فود',
                each: [
                  'سوخاری',
                  'پیتزا',
                  'برگر',
                  'ساندویچ',
                ],
              ),
            ],
          ),
          // Positioned(
          //    bottom: 0,
          //    left: 0,
          //    right: 0,
          //   child: _BottomNavigation()
          // )
          //  ],
          //  ),
        ),
      );
  }
}




class listCategory extends StatelessWidget {
  final String title;
  final List<String> each;
  // final List<String> eachIcon;
  const listCategory({
    super.key,
    required this.title,
    required this.each,
    // required this.eachIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 32, 16, 0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              textAlign: TextAlign.right,
              // overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Vazir',
                //fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          runSpacing: 8,
          children: [
            GridWidget(
              txt: each[0],
            ),
            GridWidget(
              txt: each[1],
            ),
            GridWidget(
              txt: each[2],
            ),
            GridWidget(
              txt: each[3],
            ),

            // GridWidget(
            //   txt: 'شیک ها',
            // ),
            //GridWidget(),
          ],
        )
      ],
    );
  }
}

class GridWidget extends StatelessWidget {
  final String txt;

  const GridWidget({
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.width * 0.10,
      //height: 100,
      decoration: BoxDecoration(
        color: Color.fromARGB(160, 87, 84, 84).withOpacity(0.2),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      // child: Align(
      //  alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(txt , style: TextStyle(fontFamily: 'Vazir',),),
          SizedBox(width: 4),
          Image.asset('assets/img/icons/shake.png'),
          SizedBox(width: 8),
          //SizedBox(width: 2),
        ],
      ),
      // )
    );
  }
}
