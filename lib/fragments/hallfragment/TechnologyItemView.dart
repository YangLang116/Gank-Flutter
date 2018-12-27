import 'package:flutter/material.dart';
import 'TechnologyEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class TechnologyItemView extends StatelessWidget {
  final TechnologyEntity entity;

  //static const platform = const MethodChannel("com.example.fluttergank/hall");

  TechnologyItemView(this.entity);

  _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Material(
          child: InkWell(
            onTap: () {
              _launchUrl(entity.url);
            },
            child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Colors.grey.withOpacity(0.5)),
                              bottom: BorderSide(
                                  color: Colors.grey.withOpacity(0.5)))),
                      child: PageView.builder(
                          itemBuilder: (buildContext, index) {
                            return Image.network(
                              entity.images[index],
                              fit: BoxFit.cover,
                            );
                          },
                          itemCount: entity.images?.length ?? 0),
                    ),
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                          child: Text(
                            "${entity.images == null ? "暂无图片" : entity.images.length.toString() + "张图片"}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      right: 10,
                      bottom: 10,
                    )
                  ],
                )),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(entity.desc, textAlign: TextAlign.left)),
        SizedBox(height: 20)
      ],
    );
  }
}
