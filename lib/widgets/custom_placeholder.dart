
import 'package:application/constants/import.dart';

class CustomPlaceholder {
  static Widget loading({required Widget child}) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF5F5F5),
      highlightColor: const Color(0xFFEEEEEE),
    child:child );
  }
}