import 'package:application/constants/import.dart';

class ShimmerPlaceholder extends StatelessWidget {
  final double aspectRatio;
  const ShimmerPlaceholder({super.key, this.aspectRatio = 21 / 9});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Shimmer.fromColors(
          baseColor: const Color(0xFFF5F5F5),
          highlightColor: const Color(0xFFEEEEEE),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
