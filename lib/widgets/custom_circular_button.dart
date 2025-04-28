import 'package:application/utils/import.dart';

class CustomCicularButton extends StatelessWidget {
  final bool isLoading;
  final double? loadingValue;
  final Widget? child;
  final double size;
  final Color? backgroundColor;
  final double borderWidth;
  final Color? borderColor;
  final double padding;
  final void Function()? onPressed;
  const CustomCicularButton({
    super.key,
    this.size = 16,
    this.backgroundColor,
    this.child,
    this.onPressed,
    this.borderWidth = 0.0,
    this.borderColor,
    this.padding = 0,
    this.isLoading = false,
    this.loadingValue,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        isLoading
            ? CircularProgressIndicator(strokeWidth: 1.0)
            : CircularProgressIndicator(
              strokeWidth: 1.0,
              value: loadingValue ?? 0.0,
            ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(padding),
            side: BorderSide(
              width: borderWidth,
              color: borderColor ?? Colors.transparent,
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.fromRadius(size - 3),
            maximumSize: Size.fromRadius(size - 3),
            fixedSize: Size.fromRadius(size - 3),
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
