import 'package:flutter/material.dart';
import 'package:aqua_watch_app/screens/emergency.dart';
import 'package:aqua_watch_app/screens/home_page.dart';
import 'package:aqua_watch_app/screens/map.dart';
import 'package:aqua_watch_app/screens/profile.dart';
import 'package:aqua_watch_app/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MapPage(),
    Emergency(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white2,
        elevation: 0.0,
        iconTheme: IconThemeData(color: AppColors.black),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Add your menu icon onPressed action here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {
              // Add your bell icon onPressed action here
            },
          ),
        ],
        titleSpacing: 50.0,
        title: Row(
          children: [
            Image.asset(
              'assets/app icon.png',
              height: screenSize.width * 0.1,
              width: screenSize.width * 0.1,
            ),
            SizedBox(width: 1.0),
            Text(
              'Aqua Watch',
              style: TextStyle(
                color: Colors.black,
                fontSize: screenSize.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                _onItemTapped(0);
              },
              child: Image.asset(
                'assets/Home.png', // Replace with your SVG image
                width: 24,
                height: 24,
                color: _selectedIndex == 0 ? AppColors.black : AppColors.grey,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                _onItemTapped(1);
              },
              child: Image.asset(
                'assets/Map Marker.png', // Replace with your SVG image
                width: 24,
                height: 24,
                color: _selectedIndex == 1 ? AppColors.black : AppColors.grey,
              ),
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                _onItemTapped(2);
              },
              child: Image.asset(
                'assets/Siren.png', // Replace with your SVG image
                width: 24,
                height: 24,
                color: _selectedIndex == 2 ? AppColors.black : AppColors.grey,
              ),
            ),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                _onItemTapped(3);
              },
              child: Image.asset(
                'assets/Person.png', // Replace with your SVG image
                width: 24,
                height: 24,
                color: _selectedIndex == 3 ? AppColors.black : AppColors.grey,
              ),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
