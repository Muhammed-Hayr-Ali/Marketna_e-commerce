import 'package:flutter/material.dart';

class ErrorPlaceholder extends StatelessWidget {
  final double aspectRatio;
  const ErrorPlaceholder({super.key, this.aspectRatio = 21 / 9});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(child: Icon(Icons.error, color: Colors.grey.shade400)),
        ),
      ),
    );
  }
}
