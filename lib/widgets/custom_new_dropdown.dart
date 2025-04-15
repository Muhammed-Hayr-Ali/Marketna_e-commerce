import 'package:application/utils/import.dart';


class CustomNewDropdown<T> extends StatelessWidget {
    final List<DropdownMenuItem<T>>? items;
  final T? value;
  final void Function(T?)? onChanged;
 final Widget? hint;

  const CustomNewDropdown({super.key, this.items, this.value, this.onChanged, this.hint});

  @override
  Widget build(BuildContext context) {
  return DropdownButton(
      value: value,
      hint: hint,
      items: items,
      onChanged: onChanged,
      underline: const SizedBox(),
      icon: const SizedBox(),
      isExpanded: true,
      style: const TextStyle(color: Colors.black),
      dropdownColor: Colors.grey.shade100,
      iconSize: 30.0,
      elevation: 16,
      alignment: Alignment.centerRight,
      menuMaxHeight: 300.0,
      borderRadius: BorderRadius.circular(10.0),
    );
  }
}







