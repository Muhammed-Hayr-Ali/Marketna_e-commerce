import 'package:application/utils/import.dart';

class Indicator extends StatelessWidget {
  final int selected;
  final int length;
  const Indicator({super.key, required this.selected, required this.length});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      width: 9 * length.toDouble(),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: length,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.all(1.5),
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected == index
                      ? AppColors.primaryColor
                      : Colors.grey),
            );
          }),
    );
  }
}
