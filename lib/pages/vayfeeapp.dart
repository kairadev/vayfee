import 'package:flutter/material.dart';
import 'package:vayfee/pages/home_page.dart';
import 'package:vayfee/theme/colors.dart';

import 'discovery_page.dart';

class VayfeeApp extends StatefulWidget {
  @override
  _VayfeeAppState createState() => _VayfeeAppState();
}

class _VayfeeAppState extends State<VayfeeApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: black,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      DiscoveryPage(),
      Center(
        child: Text(
          'Bildirim',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: white,
          ),
        ),
      ),
      Center(
        child: Text(
          'Mesaj',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: white,
          ),
        ),
      ),
    ];

    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  // ignore: missing_return
  Widget getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/system_icons/camera.png',
              width: 30,
              color: white,
            ),
            Image.asset(
              'assets/system_icons/logo.png',
              width: 55,
              color: white,
            ),
            Image.asset(
              'assets/system_icons/user.png',
              width: 25,
              color: white,
            ),
          ],
        ),
      );
    } else if (pageIndex == 1) {
      return null;
    } else if (pageIndex == 2) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text(
          'Etkileşimler',
        ),
      );
    } else if (pageIndex == 3) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text(
          'Mesajlar',
        ),
      );
    }
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? 'assets/system_icons/feed.png'
          : 'assets/system_icons/feed.png',
      pageIndex == 1
          ? 'assets/system_icons/world.png'
          : 'assets/system_icons/world.png',
      pageIndex == 2
          ? 'assets/system_icons/notification.png'
          : 'assets/system_icons/notification.png',
      pageIndex == 3
          ? 'assets/system_icons/send.png'
          : 'assets/system_icons/send.png',
    ];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: appFooterColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 34,
          right: 34,
          top: 15,
          bottom: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomItems.length,
            (index) {
              return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Image.asset(
                  bottomItems[index],
                  color: white,
                  width: 27,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
