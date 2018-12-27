import 'package:flutter/material.dart';
import 'WelfareEntity.dart';
import 'dart:io';
import 'dart:convert';
import 'WelfareDetailPage.dart';
import 'package:flutter/cupertino.dart';

class WelfareWidget extends StatefulWidget {
  WelfareWidget({key}) : super(key: key);

  @override
  _WelfareWidgetState createState() => _WelfareWidgetState();
}

class _WelfareWidgetState extends State<WelfareWidget>
    with AutomaticKeepAliveClientMixin {
  List<WelfareEntity> _welfareEntities;

  @override
  void initState() {
    super.initState();
    _welfareEntities = List<WelfareEntity>();
    reqWelfareData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.all(3),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 3, crossAxisSpacing: 3),
            itemBuilder: (buildContext, index) {
              return GestureDetector(
                child: Hero(
                  tag: "index_$index",
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/default_img.png",
                    image: _welfareEntities[index].thumb,
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (buildContext) {
                    return WelfareDetailWidget(
                        _welfareEntities[index].thumb, "index_$index");
                  }));
                },
              );
            },
            itemCount: _welfareEntities.length,
          ),
        ),
      ),
    );
  }

  reqWelfareData() async {
    HttpClient httpClient = HttpClient();
    var uri = Uri.http(
        "service.picasso.adesk.com",
        "/v1/vertical/category/4e4d610cdf714d2966000003/vertical",
        {"limit": "50"});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var resultStr = await response.transform(utf8.decoder).join();
      var resultOriginMap = json.decode(resultStr);
      dynamic resultList = resultOriginMap["res"]["vertical"];
      for (int i = 0; i < resultList.length; i++) {
        var resultMap = resultList[i];
        _welfareEntities
            .add(new WelfareEntity(resultMap["thumb"], resultMap["img"]));
      }
      setState(() {});
    }
  }

  @override
  bool get wantKeepAlive => true;
}
