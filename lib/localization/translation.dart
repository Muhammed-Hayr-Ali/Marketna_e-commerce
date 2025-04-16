import 'package:application/localization/language/arabic.dart';
import 'package:application/localization/language/english.dart';
import 'package:application/localization/language/farsi.dart';
import 'package:application/localization/language/french.dart';
import 'package:application/localization/language/german.dart';
import 'package:application/localization/language/kurdish.dart';
import 'package:application/localization/language/turkish.dart';
import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': Arabic().keys,
        'en': English().keys,
        'fr': French().keys,
        'de': German().keys,
        'tr': Turkish().keys,
        'ku': Kurdish().keys,
        'fa': Farsi().keys,
      };
}
