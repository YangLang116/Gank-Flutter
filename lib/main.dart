import 'package:flutter/material.dart';
import 'fragments/hallfragment/HallWidget.dart';
import 'fragments/welfarefragment/WelfareWidget.dart';
import 'fragments/minefragment/MineWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
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
