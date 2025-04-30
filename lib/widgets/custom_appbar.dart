import 'package:application/utils/import.dart';

PreferredSizeWidget emptyAppBar() {
  return AppBar(automaticallyImplyLeading: false, toolbarHeight: 0);
}

PreferredSizeWidget customAppBar({
  bool backButton = false,

  List<Widget>? actions,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
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
