import 'package:application/utils/import.dart';

/// A customizable button widget that supports various styles and states.
/// It can display a loading indicator, has customizable dimensions, colors, and margins.
class CustomButton extends StatelessWidget {
  /// The content inside the button. This can be any widget, such as text or an icon.
  final Widget child;

  /// The function to execute when the button is pressed.
  /// If null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The height of the button. If not provided, a default height of 51 is used.
  final double? height;

  /// The width of the button. If not provided, a default width of 100 is used.
  final double? width;

  /// The border radius of the button's corners. Defaults to 10.
  final double borderRadius;

  /// The background color of the button. If not provided, a default light gray color is used.
  final Color backgroundColor;

  /// Indicates whether the button is in a loading state.
  /// When true, a loading indicator is displayed instead of the button's content.
  final bool isLoading;

  /// The margin around the button. If not provided, no margin is applied.
  final EdgeInsetsGeometry? margin;

  /// The padding inside the button. If not provided, a default horizontal padding of 8.0 is used.
  final EdgeInsetsGeometry? padding;

  /// The elevation (shadow) of the button. If not provided, no elevation is applied.
  final double? elevation;

  /// The color of the loading indicator. If not provided, a default color (0xFF7738C7) is used.
  final Color? progressColor;

  /// An optional label to display above the button. If provided, it will be shown as a small text.
  final String? label;

  final String? errorMessage;

  /// Creates an instance of [CustomButton].
  ///
  /// [child] is required and represents the content inside the button.
  /// [onPressed] is optional and defines the action to take when the button is pressed.
  /// [isLoading] is optional and defaults to false. Set it to true to show a loading indicator.
  /// [borderRadius] is optional and defaults to 10.
  /// [buttonColor], [margin], [padding], [elevation], and [progressColor] are all optional and have default values.
  const CustomButton({
    super.key,
    required this.child,
    this.onPressed,
    this.height,
    this.width,
    this.backgroundColor = AppColors.primaryColor,
    this.isLoading = false,
    this.margin,
    this.elevation,
    this.progressColor,
    this.borderRadius = 10,
    this.padding,
    this.label,
    this.errorMessage,
  });

  /// Builds the button with the specified style and behavior.
  Widget _button() {
    return ElevatedButton(
      onPressed:
          isLoading ? null : onPressed, // Disable the button during loading
      style: ElevatedButton.styleFrom(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 8.0),
        minimumSize: Size(
          width ?? double.infinity,
          height ?? 48,
        ), // Default size of the button
        backgroundColor: backgroundColor, // Default background color
        disabledBackgroundColor: backgroundColor,
        shadowColor: Colors.transparent, // Default shadow color
        foregroundColor: Colors.black, // Default text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // Rounded corners
        ),
        elevation: elevation ?? 0, // Default elevation
        textStyle: const TextStyle(
          fontFamily: ConstantsText.fontFamily,
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),

      // style: ButtonStyle(

      //   shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      //     RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(
      //         borderRadius,
      //       ), // Rounded corners
      //     ),
      //   ),
      //   elevation: WidgetStateProperty.all<double>(
      //     elevation ?? 0, // Default elevation
      //   ),
      // ),
      child:
          isLoading
              ? SizedBox(
                height: 25, // Fixed size for loading indicator
                width: 25, // Fixed size for loading indicator
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color:
                      progressColor ??
                      const Color(0xFF7738C7), // Default loading color
                ),
              )
              : child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin, // Apply margin around the button
      child:
          label == null
              ? _button()
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (label ?? '').tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  _button(),
                  SizedBox(
                    child:
                        errorMessage != null
                            ? FadeAnimationDy(
                              delay: 200,
                              dy: 6,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  6.0,
                                  2.0,
                                  6.0,
                                  0,
                                ),
                                child: Text(
                                  (errorMessage ?? '').tr,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColors.errorRed,
                                  ),
                                ),
                              ),
                            )
                            : const SizedBox.shrink(),
                  ),
                ],
              ),
    );
  }
}
