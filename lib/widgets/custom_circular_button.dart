import 'package:application/utils/import.dart';

class CustomCicularButton extends StatelessWidget {
  final Widget? child;
  final double size;
  final Color? backgroundColor;
  final double? borderWidth;
  final Color? borderColor;
  final double padding;
  final void Function()? onPressed;
  const CustomCicularButton({
    super.key,
    this.size = 16,
    this.backgroundColor,
    this.child,
    this.onPressed,
    this.borderWidth,
    this.borderColor,
    this.padding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(padding),
        side: BorderSide(
          width: borderWidth ?? 0,
          color: borderColor ?? Colors.transparent,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.fromRadius(size),
        maximumSize: Size.fromRadius(size),
        fixedSize: Size.fromRadius(size),
        backgroundColor: backgroundColor ?? Colors.grey.shade200,
        shadowColor: Colors.transparent,
        elevation: 0,
        shape: CircleBorder(),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
