import 'package:flutter/material.dart';
import 'package:sample_3/pageItem.dart';

class MyPage extends StatelessWidget {
  final Size size;
  final AnimationController controller;
  final Animation<double> barHeightAnimation;
  final Animation<double> avatarSizeAnimation;
  final Animation<double> titleOpacityAnimation;
  final Animation<double> textOpacityAnimation;
  final int pageIndex;
  const MyPage(
      {Key? key,
      required this.size,
      required this.controller,
      required this.barHeightAnimation,
      required this.avatarSizeAnimation,
      required this.titleOpacityAnimation,
      required this.textOpacityAnimation,
      required this.pageIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            //overflow: Overflow.visible,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: size.width,
                height: barHeightAnimation.value,
                color: Theme.of(context).primaryColor,
              ),
              Positioned(
                top: 200 - 50,
                left: size.width / 2 - 50,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.diagonal3Values(avatarSizeAnimation.value,
                      avatarSizeAnimation.value, 1.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        PageItem.pagesList[pageIndex].icon,
                        color: Colors.white,
                        size: 48.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Opacity(
                opacity: titleOpacityAnimation.value,
                child: _buildPlaceHolder(
                    size.width * 0.4, 20, Alignment.centerLeft),
              ),
              SizedBox(
                height: 10,
              ),
              Opacity(
                opacity: textOpacityAnimation.value,
                child: _buildPlaceHolder(
                    size.width, size.height * 0.3, Alignment.center),
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildPlaceHolder(double width, double height, Alignment alignment) {
  return Align(
    alignment: alignment,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),
  );
}
