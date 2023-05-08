import 'package:flutter/material.dart';
import 'package:restaurant/CartPage.dart';
import 'package:restaurant/EachProduct.dart';
import 'package:restaurant/FirstPage.dart';
import 'package:restaurant/LoginPage.dart';
import 'package:restaurant/mainPage.dart';
import 'package:restaurant/menuPage.dart';
import 'HomePage.dart';
import 'Widgets/bottomNavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              subtitle1: TextStyle(
                fontFamily: 'Vazir',
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xff434343),
              ),
              subtitle2: TextStyle(
                fontFamily: 'Vazir',
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xffF6F6F6),
              ),
            )),
        home: FirstPage(),
      ),
    );
  }
}

// class FirstPage extends StatefulWidget {
//   const FirstPage({super.key});

//   @override
//   State<FirstPage> createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   //int selected = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // bottomNavigationBar: BottomNavigation(
//       //   onTap: (int nowIndex) {
//       //      setState(() {
//       //       selected = nowIndex;
//       //     });
//       //   },
//       // ),
//       // body: IndexedStack(
//       //   index: selected,
//       //   children: [
//       //     MainPage(),
//       //     MenuPage(),
//       //   ],
//       // )
//       body: LoginPage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child:Column(
//           children: [
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: (){

//                   }, 
//                   icon: )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

