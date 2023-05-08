import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:restaurant/FirstPage.dart';
import 'package:restaurant/main.dart';
import 'package:restaurant/mainPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Text(
            'ورود',
            style: TextStyle(
                fontFamily: 'Vazir',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'جهت ثبت سفارش و دریافت کد تخفیف وارد شوید',
            style: TextStyle(
                fontFamily: 'Vazir', fontSize: 14, color: Color(0xffBCBCBC)),
          ),
          TextFieldPhoneNumber(),
          Padding(
          padding: const EdgeInsets.fromLTRB(48 , 24 , 48 , 0),
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage())),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Center(
                  child: Text('بعدی',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Vazir',
                        fontWeight: FontWeight.bold
                      )),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff52AE6B)),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class TextFieldPhoneNumber extends StatelessWidget {
  const TextFieldPhoneNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(48 , 48 , 48 , 0),
      child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Vazir', color: Color(0xff868686), fontSize: 16),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff868686)),
            //borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff868686), width: 3),
            //borderRadius: BorderRadius.circular(8)
          ),
          hintText: '09123456789',
          hintStyle: TextStyle(
              color: Color(0xff868686),
              fontFamily: 'Vazir',
              fontWeight: FontWeight.w400),
          //contentPadding: EdgeInsets.all(32)
        ),
      ),
    );
  }
}
