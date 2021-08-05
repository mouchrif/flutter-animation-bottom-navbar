import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:sample_3/my_page.dart';
// import 'package:sample_3/page.dart';
import 'package:sample_3/pageItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Straggered Animation',
      theme: ThemeData(
        primaryColor: Color(0xff0e5852),
        accentColor: Color(0xffCC811E),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _barHeightAnimation;
  Animation<double>? _avatarSizeAnimation;
  Animation<double>? _titleOpacityAnimation;
  Animation<double>? _textOpacityAnimation;

  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    _barHeightAnimation =
        Tween<double>(begin: 0, end: 200).animate(CurvedAnimation(
      parent: _controller!,
      curve: Interval(
        0.0,
        0.4,
        curve: Curves.easeIn,
      ),
    ));
    _avatarSizeAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller!,
      curve: Interval(
        0.4,
        0.7,
        curve: Curves.elasticOut,
      ),
    ));
    _titleOpacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller!,
      curve: Interval(
        0.7,
        0.85,
        curve: Curves.easeIn,
      ),
    ));
    _textOpacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller!,
      curve: Interval(
        0.85,
        1.0,
        curve: Curves.easeIn,
      ),
    ));
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  // void _toggle() {
  //   if (_controller!.isCompleted) {
  //     _controller!.reverse();
  //   }
  //   if (_controller!.isDismissed) {
  //     _controller!.forward();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller!,
        builder: (context, child) => MyPage(
            size: size,
            controller: _controller!,
            barHeightAnimation: _barHeightAnimation!,
            avatarSizeAnimation: _avatarSizeAnimation!,
            titleOpacityAnimation: _titleOpacityAnimation!,
            textOpacityAnimation: _textOpacityAnimation!,
            pageIndex: pageIndex),
      ),
      bottomNavigationBar: FluidNavBar(
        animationFactor: 1.0,
        style: FluidNavBarStyle(
          barBackgroundColor: Theme.of(context).primaryColor,
          iconUnselectedForegroundColor: Theme.of(context).accentColor,
          iconSelectedForegroundColor: Colors.white,
        ),
        icons: [
          ...PageItem.pagesList
              .map((page) => FluidNavBarIcon(
                    icon: page.icon,
                  ))
              .toList(),
        ],
        onChange: (int index) async{
          print(index);
          _controller!.reverse();
          await Future.delayed(Duration(milliseconds: 1200));
          setState(() {
            pageIndex = index;
          });
          _controller!.forward();
        },
      ),
    );
  }
}
