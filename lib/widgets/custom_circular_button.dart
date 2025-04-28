import 'package:application/utils/import.dart';

class CustomCicularButton extends StatelessWidget {
  final bool isLoading;
  final double? loadingValue;
  final Widget? child;
  final double size;
  final Color? backgroundColor;
  final double borderWidth;
  final Color? borderColor;
  final double progressWidth;
  final Color? progressColor;
  final double progressPadding;
  final void Function()? onPressed;
  const CustomCicularButton({
    super.key,
    this.size = 16,
    this.backgroundColor,
    this.child,
    this.onPressed,
    this.borderWidth = 0.0,
    this.borderColor,
    this.progressPadding = 0,
    this.isLoading = false,
    this.loadingValue,
    this.progressWidth = 1,
    this.progressColor,
  });

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
                  ? CircularProgressIndicator(
                    strokeWidth: progressWidth,
                    color: progressColor,
                  )
                  : CircularProgressIndicator(
                    strokeWidth: progressWidth,
                    color: progressColor,
                    value: loadingValue ?? 0.0,
                  ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.fromRadius(size / 2),
            maximumSize: Size.fromRadius(size / 2),
            fixedSize: Size.fromRadius(size / 2),
            backgroundColor: backgroundColor ?? Colors.grey.shade200,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: CircleBorder(),
          ),
          onPressed: onPressed,
          child: child ?? Container(),
        ),
      ],
    );
  }
}
