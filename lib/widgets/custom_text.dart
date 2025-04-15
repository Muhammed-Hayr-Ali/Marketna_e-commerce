import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The `CustomText` class is a StatelessWidget used to create customizable text widgets.
/// It provides options to customize text properties such as color, font size, alignment, and more.
class CustomText extends StatelessWidget {
  /// The main text to be displayed (required).
  final String text;

  /// The color of the text (optional). If not provided, the default color is black.
  final Color? color;

  /// The font size of the text (optional).
  final double? fontSize;

  /// The font weight of the text (e.g., bold, regular) (optional).
  final FontWeight? fontWeight;

  /// The alignment of the text (e.g., left, right, center) (optional).
  final TextAlign? textAlign;

  /// How to handle overflow text (e.g., ellipsis, clip) (optional).
  final TextOverflow? overflow;

  /// The line height of the text (optional).
  final double? height;

  /// The font family to be used for the text (optional).
  final String? fontFamily;

  /// The text direction (e.g., LTR or RTL) (optional).
  final TextDirection? textDirection;

  /// Constructor for the `CustomText` widget.
  /// - [text] is required, while all other parameters are optional.
  const CustomText(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.height,
    this.fontFamily,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr, // Uses `.tr` from GetX for translation support (if applicable).
      textDirection:
          textDirection, // Specifies the text direction (LTR or RTL).
      textAlign: textAlign, // Specifies the text alignment.
      overflow: overflow, // Specifies how to handle overflow text.
      style: TextStyle(
        fontFamily: fontFamily, // Specifies the font family.
        fontSize: fontSize, // Specifies the font size.
        color:
            color ??
            Colors.black, // Specifies the text color (default is black).
        fontWeight: fontWeight, // Specifies the font weight.
        height: height, // Specifies the line height.
      ),
    );
  }
}
