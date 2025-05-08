import 'package:application/constants/import.dart';

class Validators {
  Validators._();

  static String? email(String email) {
    if (email.isEmpty) {
      return ValidatorMessage.emailRequired.tr;
    }
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email)) {
      return ValidatorMessage.invalidEmail.tr;
    }
    return null;
  }

  static String? passwordOnly(String password) {
    if (password.isEmpty) {
      return ValidatorMessage.passwordRequired.tr;
    }
    if (password.length < 6) {
      return ValidatorMessage.passwordLength.tr;
    }

    return null;
  }

  static String? password(String password, String confirmPassword) {
    if (password.isEmpty) {
      return ValidatorMessage.passwordRequired.tr;
    }
    if (password.length < 6) {
      return ValidatorMessage.passwordLength.tr;
    }
    if (password != confirmPassword) {
      return ValidatorMessage.passwordNotMatch.tr;
    }

    return null;
  }

  static String? confirmPassword(String confirmPassword, String password) {
    if (confirmPassword.isEmpty) {
      return ValidatorMessage.confirmPasswordRequired.tr;
    }
    if (confirmPassword.length < 6) {
      return ValidatorMessage.confirmPasswordLength.tr;
    }
    if (password != confirmPassword) {
      return ValidatorMessage.confirmPasswordNotMatch.tr;
    }

    return null;
  }

  static String? verificationCode(String verificationCode) {
    if (verificationCode.isEmpty) {
      return ValidatorMessage.verificationCodeRequired.tr;
    }
    if (verificationCode.length != 6) {
      return ValidatorMessage.verificationCodeLength.tr;
    }

    return null;
  }

  static String? name(String name) {
    if (name.isEmpty) {
      return ValidatorMessage.nameRequired.tr;
    }
    return null;
  }

  static String? phone(String phone) {
    if (!RegExp(r'^[0-9]{4,12}$').hasMatch(phone)) {
      return ValidatorMessage.invalidPhone.tr;
    }
    return null;
  }

  static String? addressName(String streetAddress) {
    if (streetAddress.isEmpty) {
      return ValidatorMessage.addressNameRequired.tr;
    }
    return null;
  }

  static String? streetAddress(String streetAddress) {
    if (streetAddress.isEmpty) {
      return ValidatorMessage.streetAddressRequired.tr;
    }
    return null;
  }

  static String? city(String city) {
    if (city.isEmpty) {
      return ValidatorMessage.cityRequired.tr;
    }
    return null;
  }

  static String? province(String stateProvince) {
    if (stateProvince.isEmpty) {
      return ValidatorMessage.stateProvinceRequired.tr;
    }
    return null;
  }

  //////

  static String? country(String country) {
    if (country.isEmpty) {
      return ValidatorMessage.countryRequired.tr;
    }
    return null;
  }

  static String? phoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return ValidatorMessage.phoneNumberRequired.tr;
    }

    if (!RegExp(r'^[0-9]{4,12}$').hasMatch(phoneNumber)) {
      return ValidatorMessage.invalidPhone.tr;
    }
    return null;
  }

  static String? countryCode(String countryCode) {
    if (countryCode.isEmpty) {
      return ValidatorMessage.countryCodeRequired.tr;
    }

    if (!RegExp(r'^\+[0-9]{1,4}$').hasMatch(countryCode)) {
      return ValidatorMessage.invalidCountryCode.tr;
    }
    return null;
  }
}
