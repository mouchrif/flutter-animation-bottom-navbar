import 'package:flutter/material.dart';
import 'package:sample_3/my_page.dart';

class PageApp extends StatefulWidget {
  final int pageIndex;
  PageApp({Key? key, required this.pageIndex}) : super(key: key);

  @override
  _PageAppState createState() => _PageAppState();
}

class _PageAppState extends State<PageApp> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _barHeightAnimation;
  Animation<double>? _avatarSizeAnimation;
  Animation<double>? _titleOpacityAnimation;
  Animation<double>? _textOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _barHeightAnimation =
        Tween<double>(begin: 0, end: 200).animate(CurvedAnimation(
      parent: _controller!,
      curve: Interval(
        0.0,
        0.3,
        curve: Curves.easeIn,
      ),
    ));
    _avatarSizeAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller!,
      curve: Interval(
        0.3,
        0.6,
        curve: Curves.elasticOut,
      ),
    ));
    _titleOpacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller!,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.easeIn,
      ),
    ));
    _textOpacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller!,
      curve: Interval(
        0.8,
        1.0,
        curve: Curves.easeIn,
      ),
    ));
    _controller!.forward();
  }

  // void _toggle() {
  //   if (_controller!.isCompleted) {
  //     _controller!.reverse();
  //   } else if (_controller!.isDismissed) {
  //     _controller!.forward();
  //   }
  // }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) => MyPage(
          size: size,
          controller: _controller!,
          barHeightAnimation: _barHeightAnimation!,
          avatarSizeAnimation: _avatarSizeAnimation!,
          titleOpacityAnimation: _titleOpacityAnimation!,
          textOpacityAnimation: _textOpacityAnimation!,
          pageIndex: widget.pageIndex),
    );
  }
}
