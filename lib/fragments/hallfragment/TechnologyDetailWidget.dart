import 'package:flutter/material.dart';

class TechnologyDetailWidget extends StatelessWidget {
  final String url;

  TechnologyDetailWidget(final this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
      ),
    );
  }
}
