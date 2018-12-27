import 'package:flutter/material.dart';

class WelfareDetailWidget extends StatelessWidget {
  final String img;
  final String tag;

  WelfareDetailWidget(this.img, this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
            tag: tag,
            child: Image.network(
              img,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
