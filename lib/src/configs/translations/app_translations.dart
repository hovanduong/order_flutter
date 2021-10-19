import 'vi_vn_translation.dart';
import 'en_us_translations.dart';
import 'fr_fr_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUs,
    'vi_VN': viVN,
    'fr_FR': frFr
  };
}
