import 'package:flutter/material.dart';
import 'TechnologyTabView.dart';

class HomeHallWidget extends StatefulWidget {

  HomeHallWidget({key}) :super(key: key);

  @override
  _HomeHallWidgetState createState() => _HomeHallWidgetState();
}

class _HomeHallWidgetState extends State<HomeHallWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _tabTitles;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
    _tabTitles = new List<String>();
    _tabTitles..add("Android")..add("iOS")..add("前端");
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: SafeArea(
            child: Container(
              color: Theme
                  .of(context)
                  .primaryColor,
              child: TabBar(
                  indicatorWeight: 2.0,
                  indicatorColor: Colors.greenAccent,
                  controller: _tabController,
                  tabs: _tabTitles.map((title) {
                    return Tab(text: title);
                  }).toList()),
            )),
      ),
      body: TabBarView(
          controller: _tabController,
          children: _tabTitles.map((title) {
            return TechnologyTabView(title);
          }).toList()),
    );
  }
}
