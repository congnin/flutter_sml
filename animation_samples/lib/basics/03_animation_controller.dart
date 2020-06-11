import 'package:flutter/material.dart';

class AnimationControllerDemo extends StatefulWidget {
  static const String routeName = '/basics/animation_controller';

  @override
  _AnimationControllerDemoState createState() =>
      _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo>
    with SingleTickerProviderStateMixin {
  // Using the SingleTickerProviderStateMixin can ensure that our
  // AnimationController only animates while the Widget is visible on the
  // screen. This is a useful optimization that saves resources when the
  // Widget is not visible.

  static const Duration _duration = Duration(seconds: 1);
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: _duration)
      // The Widget's build needs to be called every time the animation's
      // value changes. So add a listener here that will call setState()
      // and trigger the build() method to be called by the framework.
      // If your Widget's build is relatively simple, this is a good option.
      // However, if your build method returns a tree of child Widgets and
      // most of them are not animated you should consider using
      // AnimatedBuilder instead.
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    // AnimationController is a stateful resource that needs to be disposed when
    // this State gets disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // When building the widget you can read the AnimationController's value property
    // when building child widgets. You can also check the status to see if the animation
    // has completed.
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text(
                '${controller.value.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headline3,
                textScaleFactor: 1 + controller.value,
              ),
            ),
            RaisedButton(
              child: Text('animate'),
              onPressed: () {
                if (controller.status == AnimationStatus.completed) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}