
import 'package:application/constants/import.dart';

PreferredSizeWidget emptyAppBar() {
  return AppBar(automaticallyImplyLeading: false, toolbarHeight: 0);
}

PreferredSizeWidget customAppBar({
  bool backButton = false,
  String? title,
  List<Widget>? actions,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: title != null ? CustomText(title) : null,
    leading:
        backButton
            ? IconButton(
              onPressed: Get.back,
              icon: const Icon(Icons.arrow_back_ios),
            )
            : null,
    actions: [...actions ?? [], SizedBox(width: 8.0)],
  );
}
