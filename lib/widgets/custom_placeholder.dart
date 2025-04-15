import 'package:application/utils/import.dart';

class CustomPlaceholder {
  static Widget loading({required Widget child}) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
    child:child );
  }
}