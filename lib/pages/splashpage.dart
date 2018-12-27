import 'package:flutter/material.dart';
import 'mainpage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curvedAnimation;
  Animation _tweenAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _curvedAnimation = CurvedAnimation(
        parent: _controller, curve: Interval(0.9, 1.0, curve: Curves.linear));
    _tweenAnimation = Tween(begin: 1.0, end: 1.0).animate(_curvedAnimation);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            AlphaPageRoute(MainPage()), (route) => route == null);
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (buildContext, child) {
          return Container(
            child: Opacity(
                opacity: _tweenAnimation.value,
                child: Image.asset("assets/splash_bg.jpeg", fit: BoxFit.cover)),
          );
        });
  }
}

class AlphaPageRoute extends PageRouteBuilder {
  final Widget widget;

  AlphaPageRoute(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 5),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              //淡出过渡路由
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
