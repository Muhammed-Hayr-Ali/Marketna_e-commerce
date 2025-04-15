import 'package:application/utils/import.dart';

class CustomCicularButton extends StatelessWidget {
  final Widget? child;
  final double? size;
  final Color? color;
  final double? borderWidth;
  final Color? borderColor;
  final double? padding;
  final void Function()? onTap;
  const CustomCicularButton({
    super.key,
    this.size,
    this.color,
    this.child,
    this.onTap,
    this.borderWidth,
    this.borderColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkk(
      radius: 9999,
      onTap: onTap,
      child: Container(
        height: size ?? 30,
        width: size ?? 30,
        decoration: BoxDecoration(
          border: Border.all(
            width: borderWidth ?? 0,
            color: borderColor ?? Colors.white,
          ),
          color: color ?? AppColors.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(9999)),
        ),
        child: Padding(padding: EdgeInsets.all(padding ?? 0), child: child),
      ),
    );
  }
}
