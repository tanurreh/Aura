import 'package:flutter/material.dart';
import 'package:Aura/app/app.dart';

class BottomPages extends StatefulWidget {
  const BottomPages({Key? key}) : super(key: key);

  @override
  _BottomPagesState createState() => _BottomPagesState();
}

class _BottomPagesState extends State<BottomPages> {
  int currentIndex = 0;
  final _pageOptions = [
    Home(),
    DeviceConfig(),
    NotificationScreen(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        selectedItemColor: CustomColors.KPrimaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/home.png",
              color:
                  currentIndex == 0 ? CustomColors.KPrimaryColor : Colors.grey,
            ),
            // ignore: deprecated_member_use
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/settings.png",
              color:
                  currentIndex == 1 ? CustomColors.KPrimaryColor : Colors.grey,
            ),
            // ignore: deprecated_member_use
            label: 'Device Config',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/notification.png",
              color:
                  currentIndex == 2 ? CustomColors.KPrimaryColor : Colors.grey,
            ),
            // ignore: deprecated_member_use
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/profile.png",
              color:
                  currentIndex == 3 ? CustomColors.KPrimaryColor : Colors.grey,
            ),
            // ignore: deprecated_member_use
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
