import 'package:flutter/material.dart';
import 'package:saf_worker/screens/dump_map.dart';
import 'package:saf_worker/screens/home_screen.dart';

// import 'package:saf_user/screens/dump_map.dart';
// import 'package:saf_user/screens/pick_up_screen.dart';
// import 'package:saf_user/screens/add_post_screen.dart';
// import 'home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  BottomNavigationBarScreen({Key? key}) : super(key: key);

  static List screens = [
    HomeScreen(),
    DumpMap()
  ];

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  List<Map<String, dynamic>> _pages = [];
  var _selectedIndex = 1;

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
      },
      
      {
        'page': DumpMap(),
      },
    ];
    super.initState();
  }

  void onTapedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color.fromARGB(255, 1, 149, 211),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'Home',
                backgroundColor: Theme.of(context).primaryColor),
            
            BottomNavigationBarItem(
                icon: const Icon(Icons.location_on),
                label: 'dump Map',
                backgroundColor: Theme.of(context).primaryColor),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 1, 149, 211),
          unselectedItemColor: Colors.grey,
          onTap: onTapedItem,
          elevation: 0,
        ),
      ),
    );
  }
}
