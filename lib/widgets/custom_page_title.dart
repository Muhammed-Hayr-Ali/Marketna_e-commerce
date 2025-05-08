
import 'package:application/constants/import.dart';

class CustomPageTitle extends StatelessWidget {
  final String title, subtitle;
  final EdgeInsetsGeometry padding;
  final Color? colorTitle, colorSubtitle;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double? fontSizeTitle, fontSizeSubtitle;
  final FontWeight? fontWeightTitle, fontWeightSubtitle;
  const CustomPageTitle({
    super.key,
    this.title = '',
    this.subtitle = '',
    this.colorTitle = Colors.black,
    this.colorSubtitle = Colors.grey,
    this.fontSizeTitle = 18.0,
    this.fontSizeSubtitle = 12.0,
    this.padding = const EdgeInsets.all(0),
    this.fontWeightTitle = FontWeight.bold,
    this.fontWeightSubtitle = FontWeight.normal,
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
          title != ''
              ? CustomText(
                title,
                color: colorTitle,
                fontSize: fontSizeTitle,
                fontWeight: fontWeightTitle,
              )
              : SizedBox(),
          SizedBox(height: subtitle != '' ? 12.0 : 0),
          subtitle != ''
              ? CustomText(
                subtitle,
                color: colorSubtitle,
                fontSize: fontSizeSubtitle,
                textAlign: TextAlign.center,
              )
              : SizedBox(),
        ],
      ),
    );
  }
}
