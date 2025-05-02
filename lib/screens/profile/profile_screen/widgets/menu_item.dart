import 'package:application/utils/import.dart';

class MenuItem extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? subTitle;
  final void Function()? onTap;
  final bool divider;
  const MenuItem({
    super.key,
    this.icon,
    this.title,
    this.subTitle,
    this.onTap,
    this.divider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: icon != null ? SvgPicture.asset(icon ?? '') : null,
          title:
              title != null
                  ? CustomText(
                    title ?? '',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )
                  : null,
          subtitle: subTitle != null ? CustomText(subTitle ?? '') : null,
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
          contentPadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(child: divider ? Divider(color: Colors.grey.shade200) : null),
      ],
    );
  }
}
