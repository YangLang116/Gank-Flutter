import 'package:flutter/material.dart';
import '../fragments/hallfragment/HallWidget.dart';
import '../fragments/welfarefragment/WelfareWidget.dart';
import '../fragments/minefragment/MineWidget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[HomeHallWidget(), WelfareWidget(), MineWidget()],
        index: _currentPageIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: _switchFragment,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), title: Text("福利")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), title: Text("我的"))
        ],
      ),
    );
  }

  _switchFragment(index) {
    setState(() {
      _currentPageIndex = index;
    });
  }
}
