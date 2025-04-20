
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FadeAnimationDx extends StatelessWidget {
  const FadeAnimationDx({super.key, required this.delay, required this.child});
  final int delay;
  final Widget child;

  bool getLocal() {
    return Get.locale.toString() == 'ar' ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    getLocal();
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: delay ),
      curve: Curves.easeOut,
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: getLocal() == true
                ? Offset(-50 * (1 - value), 0)
                : Offset(50 * (1 - value), 0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
