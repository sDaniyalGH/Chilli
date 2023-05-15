import 'package:flutter/material.dart';

class NewCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                //mainAxisSize: MainAxisSize.max,
                children: [
                  _EachElement(),
                  SizedBox(
                    height: 24,
                  ),
                  _EachElement(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "توضیحات",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        fontFamily: 'Vazir',
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  TextField(
                    controller: TextEditingController(),
                    obscureText: false,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff878787), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff878787), width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: Color(0xff878787), width: 1),
                      ),
                      hintText: "توضیحات سفارش خود را اینجا بنویسید",
                      hintStyle: TextStyle(
                      fontFamily: 'Vazir',
                        
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xffbebebe),
                      ),
                      filled: true,
                      fillColor: Color(0xffffffff),
                      isDense: false,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "370000 تومان",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff878787),
                        ),
                      ),
                      Text(
                        "جمع سفارش :",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff878787),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EachElement extends StatelessWidget {
  const _EachElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        // width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/img/pic/pic2.png',
                  width: 132,
                  height: 117,
                ),
                SizedBox(
                  width: 8,
                ),
                _BoxPlusMinues(),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
            Positioned(
              right: 0,
              child: _RightHandside(),
            )
          ],
        ),
      ),
    );
  }
}

class _RightHandside extends StatelessWidget {
  const _RightHandside({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 117,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "چبرگر مخصوص",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Vazir',
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "185000 تومان",
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    fontFamily: 'Vazir',
                    color: Color(0xff878787),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            child: Icon(
              Icons.clear,
              //onPressed: () {},
              color: Color(0xff212435),
              //iconSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class _BoxPlusMinues extends StatelessWidget {
  const _BoxPlusMinues({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(2),
      width: 100,
      height: 26,
      decoration: BoxDecoration(
        color: Color(0x1f000000),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Color(0x4d9e9e9e), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Color(0x1f000000),
              shape: BoxShape.circle,
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: Icon(
              Icons.remove,
              color: Color(0xff212435),
              size: 14,
            ),
          ),
          Text(
            "1",
            textAlign: TextAlign.start,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
          ),
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Color(0x1f000000),
              shape: BoxShape.circle,
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: Icon(
              Icons.add,
              color: Color(0xff212435),
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}