import 'package:flutter/material.dart';
import 'package:restaurant/menuPage.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  const BottomNavigation({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: 339,
        height: 58,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff434343)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ItemNavigationBar(
              title: 'صفحه اصلی',
              type: 1,
              selected: 1,
              onTaps: () => onTap(0),
            ),
            InkWell(
              onTap: () => onTap(1),
              child: Container(
                width: 47,
                height: 47,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFFC1C1),
                ),
                child: Center(
                  child: Image.asset('assets/img/icons/shop.png'),
                ),
              ),
            ),
            ItemNavigationBar(
              title: 'منو',
              type: 3,
              selected: 3,
              onTaps: () => onTap(2),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemNavigationBar extends StatelessWidget {
  final String title;
  final int type;
  final int selected;
  final Function() onTaps;

  const ItemNavigationBar({
    super.key,
    required this.title,
    required this.type,
    required this.selected,
    required this.onTaps,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: () => onTaps(),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/icons/mainPage.png'),
            SizedBox(
              height: 4,
            ),
            Container(
              width: 60,
              height: 16,
              child: Center(
                child: Text(
                  title,
                  style: type == selected
                      ? themeData.textTheme.subtitle1
                      : themeData.textTheme.subtitle2,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: type == selected ? Color(0xffFFC1C1) : Color(0xff434343),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
