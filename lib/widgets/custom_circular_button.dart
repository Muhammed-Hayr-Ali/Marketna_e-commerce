import 'package:application/utils/import.dart';

class CustomCicularButton extends StatelessWidget {
  final bool isLoading;
  final double? loadingValue;
  final Widget? child;
  final double size;
  final Color? backgroundColor;
  final double borderWidth;
  final Color? borderColor;
  final Color progressColor;
  final List<Color> progressMultiColors;
  final double progressWidth;
  final double progressPadding;
  final void Function()? onPressed;
  const CustomCicularButton({
    super.key,
    this.size = 64,
    this.backgroundColor,
    this.child,
    this.onPressed,
    this.borderWidth = 0.0,
    this.borderColor,
    this.progressPadding = 0,
    this.isLoading = false,
    this.loadingValue,
    this.progressWidth = 1,
    this.progressMultiColors = [],
    this.progressColor = AppColors.primaryColor,
  });

  Color getDynamicColor(double value, List<Color>? colors) {
    if (colors == null || colors.isEmpty || colors.length != 3) {
      return progressColor;
    }

    if (value <= 0.33) {
      return colors[0];
    } else if (value <= 0.66) {
      return colors[1];
    } else {
      return colors[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    double borderSize = size + borderWidth;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: borderSize,
          width: borderSize,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(borderSize),
          ),
        ),
        SizedBox(
          height: size + progressWidth + progressPadding,
          width: size + progressWidth + progressPadding,
          child:
              isLoading
                  ? CircularProgressIndicator(strokeWidth: progressWidth)
                  : TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: loadingValue ?? 0.0),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, child) {
                      return TweenAnimationBuilder<Color?>(
                        tween: ColorTween(
                          begin: getDynamicColor(
                            0.0,
                            progressMultiColors ?? [],
                          ),
                          end: getDynamicColor(
                            value,
                            progressMultiColors ?? [],
                          ),
                        ),
                        duration: const Duration(milliseconds: 500),
                        builder: (context, color, child) {
                          return CircularProgressIndicator(
                            value: value,
                            strokeWidth: progressWidth,
                            valueColor: AlwaysStoppedAnimation(color),
                          );
                        },
                      );
                    },
                  ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.fromRadius(size / 2),
            maximumSize: Size.fromRadius(size / 2),
            fixedSize: Size(size, size),
            backgroundColor: backgroundColor ?? Colors.grey.shade200,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: const CircleBorder(),
          ),
          onPressed: onPressed,
          child: child ?? Container(),
        ),
      ],
    );
  }
}
