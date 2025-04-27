import 'package:flutter/material.dart';

/// A customizable indicator widget for displaying the current slide in a carousel.
///
/// This widget creates a row or column of dots, where one dot represents the current slide
/// and the others represent inactive slides. The appearance of the dots can be customized
/// using various properties such as color, size, shape, and animation duration.
class CustomIndicator extends StatelessWidget {
  /// Index of the current slide.
  final int currentIndex;

  /// Total number of slides.
  final int length;

  /// Color of the active dot (indicating the current slide).
  final Color activeDotColor;

  /// Color of the inactive dots (indicating other slides).
  final Color inactiveDotColor;

  /// Width of the active dot (used to highlight the current slide).
  final double activeDotWidth;

  /// Width of the inactive dots (used for non-active slides).
  final double inactiveDotWidth;

  /// Height of all dots (both active and inactive).
  final double dotHeight;

  /// Duration of the animation when switching between slides or dots.
  final Duration animationDuration;

  /// Spacing between dots.
  final double dotSpacing;

  /// Shape of the dots (circle or rectangle).
  final DotShape dotShape;

  /// Direction of the dots layout (horizontal or vertical).
  final Axis direction;

  /// Callback function triggered when a dot is tapped.
  final Function(int)? onDotTapped;

  const CustomIndicator({
    super.key,
    required this.currentIndex,
    required this.length,
    this.activeDotColor = const Color(0xA07638C7), // Default active dot color
    this.inactiveDotColor = const Color(
      0xA0FFFFFF,
    ), // Default inactive dot color
    this.activeDotWidth = 10.0, // Default width for active dot
    this.inactiveDotWidth = 5.0, // Default width for inactive dots
    this.dotHeight = 5.0, // Default height for all dots
    this.animationDuration = const Duration(
      milliseconds: 300,
    ), // Default animation duration
    this.dotSpacing = 2.5, // Default spacing between dots
    this.dotShape = DotShape.rectangle, // Default dot shape
    this.direction = Axis.horizontal, // Default layout direction
    this.onDotTapped, // Optional callback for dot taps
  }) : assert(
         currentIndex >= 0 && currentIndex < length,
         'currentIndex must be within the range of 0 to length - 1',
       ),
       assert(length > 0, 'length must be greater than 0'),
       assert(activeDotWidth > 0, 'activeDotWidth must be greater than 0'),
       assert(inactiveDotWidth > 0, 'inactiveDotWidth must be greater than 0'),
       assert(dotHeight > 0, 'dotHeight must be greater than 0'),
       assert(dotSpacing >= 0, 'dotSpacing must be non-negative');

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return AnimatedContainer(
          duration: animationDuration,
          width: currentIndex == index ? activeDotWidth : inactiveDotWidth,
          height: dotHeight,
          margin: EdgeInsets.symmetric(
            horizontal: direction == Axis.horizontal ? dotSpacing : 0,
            vertical: direction == Axis.vertical ? dotSpacing : 0,
          ),
          decoration: BoxDecoration(
            shape:
                dotShape == DotShape.circle
                    ? BoxShape.circle
                    : BoxShape.rectangle,
            borderRadius:
                dotShape == DotShape.circle ? null : BorderRadius.circular(5),
            color: currentIndex == index ? activeDotColor : inactiveDotColor,
          ),
        );
      }),
    );
  }
}

/// Enum to define the shape of the dots.
enum DotShape { circle, rectangle }
