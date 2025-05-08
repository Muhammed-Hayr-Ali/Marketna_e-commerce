import 'package:application/constants/import.dart';

class Validators {
  Validators._();

  static String? email(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty'.tr;
    }
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email)) {
      return 'Invalid email'.tr;
    }
    return null;
  }

  static String? passwordOnly(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty'.tr;
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters'.tr;
    }

    return null;
  }

  static String? password(String password, String confirmPassword) {
    if (password.isEmpty) {
      return 'Password cannot be empty'.tr;
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters'.tr;
    }
    if (password != confirmPassword) {
      return 'Passwords do not match'.tr;
    }

    return null;
  }

  static String? confirmPassword(String confirmPassword, String password) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password cannot be empty'.tr;
    }
    if (confirmPassword.length < 6) {
      return 'Confirm password must be at least 6 characters'.tr;
    }
    if (password != confirmPassword) {
      return 'Passwords do not match'.tr;
    }

    return null;
  }

  static String? verificationCode(String verificationCode) {
    if (verificationCode.isEmpty) {
      return 'Verification code cannot be empty'.tr;
    }
    if (verificationCode.length != 6) {
      return 'Verification code must be 6 digits'.tr;
    }

    return null;
  }

  static String? name(String name) {
    if (name.isEmpty) {
      return 'Name cannot be empty'.tr;
    }
    return null;
  }

  static String? phone(String phone) {
    if (!RegExp(r'^[0-9]{4,12}$').hasMatch(phone)) {
      return 'Invalid phone number'.tr;
    }
    return null;
  }

  static String? addressName(String streetAddress) {
    if (streetAddress.isEmpty) {
      return 'Address name cannot be empty'.tr;
    }
    return null;
  }

  static String? streetAddress(String streetAddress) {
    if (streetAddress.isEmpty) {
      return 'Street address cannot be empty'.tr;
    }
    return null;
  }

  static String? city(String city) {
    if (city.isEmpty) {
      return 'Select city required'.tr;
    }
    return null;
  }

  static String? province(String stateProvince) {
    if (stateProvince.isEmpty) {
      return 'Select state or province required'.tr;
    }
    return null;
  }

  //////

  static String? country(String country) {
    if (country.isEmpty) {
      return 'Select country required'.tr;
    }
    return null;
  }

  static String? phoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return 'Phone number cannot be empty'.tr;
    }

    if (!RegExp(r'^[0-9]{4,12}$').hasMatch(phoneNumber)) {
      return 'Invalid phone number'.tr;
    }
    return null;
  }

  static String? countryCode(String countryCode) {
    if (countryCode.isEmpty) {
      return 'Country code cannot be empty'.tr;
    }

    if (!RegExp(r'^\+[0-9]{1,4}$').hasMatch(countryCode)) {
      return 'Invalid country code'.tr;
    }
    return null;
  }
}
