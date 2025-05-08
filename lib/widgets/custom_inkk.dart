
import 'package:application/constants/import.dart';

class CustomInkk extends StatelessWidget {
  final Widget child;
  final Color? spalshColor;
  final Color? highlightColor;
  final double? radius;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final String? tooltip;
  final bool disable;
  final EdgeInsetsGeometry? padding;
  const CustomInkk({
    super.key,
    required this.child,
    this.onTap,
    this.radius,
    this.spalshColor,
    this.tooltip,
    this.disable = false,
    this.onLongPress,
    this.highlightColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(radius ?? 8);
    return Semantics(
      label: tooltip ?? "Button",
      child: ClipRRect(
        borderRadius: borderRadius,
        clipBehavior: Clip.antiAlias,
        child: stack(borderRadius),
      ),
    );
  }

  Widget stack(BorderRadius borderRadius) {
    return Stack(
      children: [
        Padding(padding: padding ?? const EdgeInsets.all(0), child: child),
        if (disable == false)
          Positioned.fill(
            child: Material(
              elevation: 0,
              color: Colors.transparent,
              borderRadius: borderRadius,
              child: InkWell(
                highlightColor: (highlightColor ?? Colors.grey).withAlpha(
                  (0.25 * 255).round(),
                ),
                splashColor: (spalshColor ?? Colors.grey).withAlpha(
                  (0.25 * 255).round(),
                ),

                onTap: onTap ?? () {},
                onLongPress: onLongPress ?? () {},
              ),
            ),
          ),
      ],
    );
  }
}
