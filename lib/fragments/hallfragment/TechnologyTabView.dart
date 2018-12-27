import 'package:flutter/material.dart';
import 'TechnologyEntity.dart';
import 'TechnologyItemView.dart';
import 'dart:io';
import 'dart:convert';

class TechnologyTabView extends StatefulWidget {
  final String title;

  TechnologyTabView(this.title);

  @override
  _TechnologyTabViewState createState() => _TechnologyTabViewState();
}

class _TechnologyTabViewState extends State<TechnologyTabView>
    with AutomaticKeepAliveClientMixin {
  List<TechnologyEntity> _entities;

  @override
  void initState() {
    super.initState();
    _entities = new List<TechnologyEntity>();
    requestTechnologyListData(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (buildContext, index) {
          return new TechnologyItemView(_entities[index]);
        },
        itemCount: _entities.length);
  }

  requestTechnologyListData(String keyWord) async {
    HttpClient httpClient = new HttpClient();
    Uri reqUri = Uri.https("gank.io", "/api/data/$keyWord/50/1");
    var request = await httpClient.getUrl(reqUri);
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var resultStr = await response.transform(utf8.decoder).join();
      var resultMap = json.decode(resultStr);
      List<TechnologyEntity> entities =
          TechnologyResultEntity.fromMap(resultMap).results;
      setState(() {
        _entities.addAll(entities);
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
