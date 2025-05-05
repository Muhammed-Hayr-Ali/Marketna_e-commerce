import 'package:application/utils/import.dart';

class CustomPageTitle extends StatelessWidget {
  final String title, subtitle;
  final EdgeInsetsGeometry padding;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  const CustomPageTitle({
    super.key,
    this.title = '',
    this.subtitle = '',
    this.padding = const EdgeInsets.all(0),
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          title != '' ? CustomText(title, fontSize: 18) : SizedBox(),
          SizedBox(height: subtitle != '' ? 12.0 : 0),
          subtitle != ''
              ? CustomText(
                subtitle,
                fontSize: 12,
                color: Colors.grey,
                textAlign: TextAlign.center,
              )
              : SizedBox(),
        ],
      ),
    );
  }
}
