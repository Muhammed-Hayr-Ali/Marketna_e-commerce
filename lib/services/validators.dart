import 'package:application/utils/import.dart';

class Validators {
  Validators._();

  static String? email(String email) {
    if (email.isEmpty) {
      return 'email_cannot_be_empty'.tr;
    }
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email)) {
      return 'invalid_email'.tr;
    }
    return null;
  }

  static String? passwordOnly(String password) {
    if (password.isEmpty) {
      return 'password_cannot_be_empty'.tr;
    }
    if (password.length < 6) {
      return 'password_min_length'.tr;
    }

    return null;
  }

  static String? password(String password, String confirmPassword) {
    if (password.isEmpty) {
      return 'password_min_length'.tr;
    }
    if (password.length < 6) {
      return 'password_min_length'.tr;
    }
    if (password != confirmPassword) {
      return 'passwords_do_not_match'.tr;
    }

    return null;
  }

  static String? confirmPassword(String confirmPassword, String password) {
    if (confirmPassword.isEmpty) {
      return 'confirm_password_cannot_be_empty'.tr;
    }
    if (confirmPassword.length < 6) {
      return 'confirm_password_min_length'.tr;
    }
    if (password != confirmPassword) {
      return 'passwords_do_not_match'.tr;
    }

    return null;
  }

  static String? verificationCode(String verificationCode) {
    if (verificationCode.isEmpty) {
      return 'verification_code_cannot_be_empty'.tr;
    }
    if (verificationCode.length != 6) {
      return 'verification_code_invalid_length'.tr;
    }

    return null;
  }

  static String? name(String name) {
    if (name.isEmpty) {
      return 'name_cannot_be_empty'.tr;
    }
    return null;
  }

  static String? phone(String phone) {
    if (!RegExp(r'^[0-9]{4,12}$').hasMatch(phone)) {
      return 'invalid_phone'.tr;
    }
    return null;
  }

  static String? saddressName(String streetAddress) {
    if (streetAddress.isEmpty) {
      return 'addressName_cannot_be_empty'.tr;
    }
    return null;
  }

  static String? streetAddress(String streetAddress) {
    if (streetAddress.isEmpty) {
      return 'streetAddress_cannot_be_empty'.tr;
    }
    return null;
  }

  static String? city(String city) {
    if (city.isEmpty) {
      return ConstantsText.SELECT_CITY_REQUIRED.tr;
    }
    return null;
  }

  static String? province(String stateProvince) {
    if (stateProvince.isEmpty) {
      return ConstantsText.SELECT_PROVINCE_REQUIRED.tr;
    }
    return null;
  }

  //////

  static String? country(String country) {
    if (country.isEmpty) {
      return ConstantsText.SELECT_COUNTRY_REQUIRED.tr;
    }
    return null;
  }

  static String? phoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return ConstantsText.PHONE_NUMBER_REQUIRED.tr;
    }

    if (!RegExp(r'^[0-9]{4,12}$').hasMatch(phoneNumber)) {
      return ConstantsText.PHONE_NUMBER_INVALID.tr;
    }
    return null;
  }

  static String? countryCode(String countryCode) {
    if (countryCode.isEmpty) {
      return ConstantsText.COUNTRY_CODE_REQUIRED.tr;
    }

    if (!RegExp(r'^\+[0-9]{1,4}$').hasMatch(countryCode)) {
      return ConstantsText.COUNTRY_CODE_INVALID.tr;
    }
    return null;
  }
}
