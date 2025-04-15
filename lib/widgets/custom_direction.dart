import 'package:flutter/material.dart';


class CustomDirectionality extends StatelessWidget {
  final Widget child;
  final TextDirection? textDirection;
  const CustomDirectionality({super.key, required this.child, this.textDirection});



  @override
  Widget build(BuildContext context) {
    if (textDirection == null) {
      return child;
    } else {
      return Directionality(
          textDirection: textDirection!,
          child: child,
        );
    }
  }
}
