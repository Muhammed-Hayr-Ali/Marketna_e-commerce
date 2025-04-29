import 'package:application/utils/import.dart';

class CustomCicularButton extends StatelessWidget {
  final bool isLoading;
  final double? loadingValue;
  final Widget? child;
  final double size;
  final Color backgroundColor;
  final double borderWidth;
  final Color? borderColor;

  final List<Color> progressColors;
  final double progressWidth;
  final double progressPadding;
  final void Function()? onPressed;
  const CustomCicularButton({
    super.key,
    this.size = 64,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.child,
    this.onPressed,
    this.borderWidth = 0.0,
    this.borderColor,
    this.progressPadding = 0,
    this.isLoading = false,
    this.loadingValue,
    this.progressWidth = 1,
    this.progressColors = const [],
  });

  Color _getColorFromProgress(double progress, List<Color>? availableColors) {
    if (availableColors == null ||
        availableColors == [] ||
        availableColors.isEmpty) {
      return const Color(0xFF7738C7);
    }
    int totalSegments = availableColors.length - 1;
    final double segmentLength = 1 / totalSegments;
    final int currentSegment = (progress / segmentLength).floor();
    return availableColors[currentSegment % availableColors.length];
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
                          begin: _getColorFromProgress(0.0, progressColors),
                          end: _getColorFromProgress(value, progressColors),
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
            backgroundColor: backgroundColor,
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
