import 'package:flutter/material.dart';

class AnimatedSlide extends StatelessWidget {
  const AnimatedSlide({
    Key key,
    @required this.child,
    @required this.animation,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final slideWidth = screenWidth * 0.3;
    return AnimatedBuilder(
        animation: animation,
        builder: (context, widget) => Transform.translate(
              child: widget,
              offset: Offset(slideWidth * (1 - animation.value), 0),
            ));
  }
}
