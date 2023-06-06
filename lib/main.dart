import 'package:breakfastforce/screens/recipe.dart';
import 'package:breakfastforce/screens/subscribe.dart';
import 'package:flutter/material.dart';
import 'diary.dart';
import 'diary_write.dart';
import 'profile.dart';


void main() => runApp(MaterialApp(title: 'MyApp', home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Diary(),
    Recipe(),
    Subscribe(),
    DiaryWrite(),
    Profile(),
  ];

  void _onItemTapped(int index) { // 탭을 클릭했을떄 지정한 페이지로 이동
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_file_rename_outline),
            label: '일기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rice_bowl_outlined),
            label: '레시피',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_outlined),
            label: '아침구독',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.restaurant_outlined),
          //   label: '일기작성',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: '정보',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up_outlined),
            label: '통계',
          ),
        ],
        // currentIndex: _selectedIndex, // 지정 인덱스로 이동
        // selectedItemColor: Colors.lightGreen,
        // onTap: _onItemTapped, // 선언했던 onItemTapped
      ),
    );
  }

  // List _widgetOptions = [
  //   Text(
  // 'Favorites',
  // style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
  //   ),
  //   Text(
  //     'Music',
  //     style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
  //   ),
  //   Text(
  //     'Places',
  //     style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
  //   ),
  //   Text(
  //     'News',
  //     style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
  //   ),
  //   Text(
  //     'News',
  //     style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
  //   ),
  // ];
}