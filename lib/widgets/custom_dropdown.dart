import 'package:application/utils/import.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final dynamic value;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? menuWidth;
  final double? height;
  final Color? background; // تم تصحيح الإملاء
  final double? borderRadius;
  final String? label;
  final Widget? prefix;
  final TextEditingController controller;

  const CustomDropdown({
    super.key,
    required this.items,
    this.value,
    this.padding,
    this.width,
    this.background, // تم تصحيح الإملاء
    this.borderRadius,
    this.height,
    required this.controller,
    this.label,
    this.prefix,
    this.menuWidth,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late dynamic value;

  @override
  void initState() {
    super.initState();
    value = widget.value ?? widget.items[0]; // تعيين القيمة الافتراضية
  }

  void onChanged(dynamic newValue) {
    widget.controller.text = newValue;
    setState(() {
      value = newValue; // تحديث القيمة المحددة
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.padding ?? const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عرض التسمية إذا كانت موجودة
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomText(
                widget.label ?? '',
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            width: widget.width ?? double.infinity,
            height: widget.height ?? 52.0,
            decoration: BoxDecoration(
              color:
                  widget.background ?? Colors.grey.shade200, // تصحيح الإملاء
              borderRadius: BorderRadius.circular(
                widget.borderRadius ?? 10.0,
              ),
            ),
            child: Row(
              children: [
                // عرض البادئة إذا كانت موجودة
                if (widget.prefix != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: widget.prefix!,
                  ),
                Expanded(
                  child: DropdownButton(
                    value: value,
                    items:
                        widget.items.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.tr,
                              style: const TextStyle(
                                fontFamily: AppConstants.fontFamily,
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                    onChanged: onChanged,
                    underline: const SizedBox(),
                    icon: const SizedBox(),
                    isExpanded: true,
                    style: const TextStyle(color: Colors.black),
                    dropdownColor: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(
                      widget.borderRadius ?? 10.0,
                    ),
                    iconSize: 30.0,
                    elevation: 16,
                    alignment: Alignment.centerRight,
                    menuMaxHeight: 300.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
