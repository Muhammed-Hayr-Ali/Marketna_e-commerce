// ignore_for_file: equal_keys_in_map

import 'package:application/constants/import.dart';

class English {
  Map<String, String> get keys => {
    // --- AppStrings ---
    AppStrings.onboardingTitle_1:
        'Discover a new way to shop, faster and easier than ever!',
    AppStrings.onboardingTitle_2:
        'Receive your orders wherever you are, at a time that suits you!',
    AppStrings.onboardingTitle_3:
        'Control every order intelligently, from order to receipt!',
    AppStrings.onboardingSubTitle_1:
        'Shop from thousands of products with just a few clicks, and enjoy a personalized experience that suits your needs, anytime, anywhere.',
    AppStrings.onboardingSubTitle_2:
        'We offer fast and secure delivery options, with real-time tracking of order status and live updates until it reaches your door.',
    AppStrings.onboardingSubTitle_3:
        'Track your orders, edit details, or reorder easily through a clear interface, with 24/7 technical support available to resolve any inquiries.',
    AppStrings.language: 'Language',
    AppStrings.poweredBy: 'Powered by PST',
    AppStrings.addNewAddress: 'Add New Address',
    AppStrings.editAddress: 'Edit Address',
    AppStrings.addressName: 'Address Name',
    AppStrings.streetAddress: 'Street Address',
    AppStrings.phoneNumberHint: '0987654321',
    AppStrings.countryCodeHint: '963',
    AppStrings.phoneNumber: 'Phone Number',
    AppStrings.notes: 'Notes',
    AppStrings.updateAddress: 'Update Address',
    AppStrings.saveAddress: 'Save Address',
    AppStrings.deleteAddress: 'Delete Address',
    AppStrings.deleteAddressMessage:
        'Are you sure you want to delete this address?',
    AppStrings.addressDetails: 'Address Details',
    AppStrings.country: 'Country',
    AppStrings.stateProvince: 'State / Province',
    AppStrings.city: 'City',
    AppStrings.noAddressesErrorMessage:
        "You don't have an address yet. Add your shipping addresses.",
    AppStrings.manageAddresses: 'Manage Addresses',
    AppStrings.forgotPassword: 'Forgot Password',
    AppStrings.forgotPasswordSubTitle:
        'Enter your email to reset your password',
    AppStrings.email: 'Email',
    AppStrings.emailHint: 'Enter your email',
    AppStrings.emailExample: 'example@email.com',
    AppStrings.sendResetCode: 'Send Reset Code',
    AppStrings.locationServicesDisabled: 'Location services are disabled.',
    AppStrings.notificationServicesDisabled:
        'Notification services are disabled.',
    AppStrings.openSettings: 'Open Settings',
    AppStrings.locationPermission: 'What is your location?',
    AppStrings.locationPermissionSubTitle:
        'Allow us to access your location to show you the nearest stores.',
    AppStrings.locationPermissionButtonText: 'Allow Location Access',
    AppStrings.notificationPermission: 'Access notifications',
    AppStrings.notificationPermissionSubTitle:
        'Allow us to access your notifications.',
    AppStrings.notificationPermissionButtonText: 'Allow Notification Access',
    AppStrings.signIn: 'Sign In',
    AppStrings.signInSubTitle: "Hi! Welcome Back, you've been missed",
    AppStrings.password: 'Password',
    AppStrings.passwordHint: '●●●●●●●●●',
    AppStrings.forgotPasswordButtonText: 'Forgot Password?',
    AppStrings.dontHaveAccount: "Don't have an account?",
    AppStrings.signInButtonText: 'Sign In',
    AppStrings.orSignInWith: 'Or Sign In With',
    AppStrings.createNewAccount: 'Create New Account',
    AppStrings.createNewAccountSubTitle: 'Fill your details to continue',
    AppStrings.fullName: 'Full Name',
    AppStrings.nameExample: 'John Doe',
    AppStrings.confirmPassword: 'Confirm Password',
    AppStrings.iAgree: 'I agree to the',
    AppStrings.termsOfUse: 'Terms of Use',
    AppStrings.and: ' & ',
    AppStrings.privacyPolicy: 'Privacy Policy',
    AppStrings.signUpButtonText: 'Sign Up',
    AppStrings.updatePassword: 'Update Password',
    AppStrings.updatePasswordSubTitle:
        'Enter your verification code and new password',
    AppStrings.updatePasswordButtonText: 'Update Password',
    AppStrings.dateOfBirth: 'Date of Birth',
    AppStrings.dateOfBirthSubTitle: 'Choose Your Date of Birth',
    AppStrings.selectImage: 'Select Image',
    AppStrings.selectImageSubTitle: 'Choose Profile Image Source',
    AppStrings.camera: 'Camera',
    AppStrings.gallery: 'Gallery',
    AppStrings.delete: 'Delete',
    AppStrings.gender: 'Gender',
    AppStrings.genderSubTitle: 'Select your gender',
    AppStrings.notSpecified: 'Not Specified',
    AppStrings.male: 'Male',
    AppStrings.female: 'Female',
    AppStrings.editProfile: 'Edit Profile',
    AppStrings.statusMessage: 'Status Message',
    AppStrings.statusMessageHint: 'Hello world!',
    AppStrings.updateButtonText: 'Update',
    AppStrings.logout: 'Logout',
    AppStrings.logoutSubTitle: 'Are you sure you want to logout?',
    AppStrings.logoutButtonText: 'Logout Now',
    AppStrings.profile: 'Profile',
    AppStrings.myAddresses: 'My Addresses',
    AppStrings.myOrders: 'My Orders',
    AppStrings.settings: 'Settings',
    AppStrings.help: 'Help',
    AppStrings.languageSubTitle: 'Choose your preferred language',
    AppStrings.dependingOnTheDeviceSystem: 'Depending on the device system',
    AppStrings.arabic: 'العربية',
    AppStrings.english: 'English',
    AppStrings.german: 'Deutsch',
    AppStrings.francis: 'Français',
    AppStrings.turkish: 'Türkçe',
    AppStrings.version: 'version',
    AppStrings.retry: 'Retry',
    AppStrings.no: 'No',
    AppStrings.yes: 'Yes',
    AppStrings.ok: 'Ok',
    AppStrings.cancel: 'Cancel',
    AppStrings.continueText: 'Continue',
    AppStrings.next: 'Next',
    AppStrings.back: 'Back',
    AppStrings.skip: 'Skip',
    AppStrings.confirm: 'Confirm',

    ValidatorMessage.verificationCodeEmptyErrorMessage:
        'Verification code cannot be empty',
    ValidatorMessage.verificationCodeLengthErrorMessage:
        'Verification code must be 6 digits',
    ValidatorMessage.countryCodeRequired: 'Country code is required',
    ValidatorMessage.phoneNumberRequired: 'Phone number is required',
    ValidatorMessage.emailRequired: 'Email cannot be empty',
    ValidatorMessage.invalidEmail: 'Invalid email',
    ValidatorMessage.passwordRequired: 'Password cannot be empty',
    ValidatorMessage.passwordLength: 'Password must be at least 6 characters',
    ValidatorMessage.passwordNotMatch: 'Passwords do not match',
    ValidatorMessage.confirmPasswordRequired:
        'Confirm password cannot be empty',
    ValidatorMessage.confirmPasswordLength:
        'Confirm password must be at least 6 characters',
    ValidatorMessage.confirmPasswordNotMatch: 'Passwords do not match',
    ValidatorMessage.verificationCodeRequired:
        'Verification code cannot be empty',
    ValidatorMessage.verificationCodeLength:
        'Verification code must be 6 digits',
    ValidatorMessage.nameRequired: 'Name cannot be empty',
    ValidatorMessage.invalidPhone: 'Invalid phone number',

    ValidatorMessage.addressNameRequired: 'Address name cannot be empty',
    ValidatorMessage.streetAddressRequired: 'Street address cannot be empty',
    ValidatorMessage.cityRequired: 'Select city required',
    ValidatorMessage.stateProvinceRequired: 'Select state or province required',
    ValidatorMessage.countryRequired: 'Select country required',
    ValidatorMessage.invalidCountryCode: 'Invalid country code',

    NotificationMessage.noInternet: 'No Internet Connection Available',
    NotificationMessage.timeOut: 'Connection Time Out Please try again',
    NotificationMessage.somethingWentWrong:
        'Something has gone wrong somewhere, and we will try to fix it right away.',
    NotificationMessage.locationDisabled: 'Location services are disabled.',
    NotificationMessage.locationDenied: 'Location permissions are denied',
    NotificationMessage.locationDeniedForever:
        'Location permissions are permanently denied, we cannot request permissions.',
    NotificationMessage.userNull: 'user ID is null. Cannot load addresses.',
    NotificationMessage.addressDeletedSuccess: 'Address deleted successfully.',
    NotificationMessage.unableToSendCode:
        'Unable to send password reset code at this time. Please try again later.',
    NotificationMessage.securityCodeRequest:
        'You can request a security code again in %s seconds.',
    NotificationMessage.googleSigninFailed: 'Google sign in failed',
    NotificationMessage.missingTokenError: 'Missing access or ID token',
    NotificationMessage.userNotFound: 'User Not Found In Session',
    NotificationMessage.passwordUpdatedSuccess: 'Password updated successfully',
    NotificationMessage.emailCopied: 'Email copied to clipboard',
    NotificationMessage.imageUploadFailed:
        'An error occurred while uploading the image',
    NotificationMessage.imageDeleteFailed:
        'An error occurred while deleting the image',

    AppStrings.selectCountry: 'Select Country',
    AppStrings.selectCountrySubTitle: 'Select your country from the list below',
    AppStrings.selectProvince: 'Select Province',
    AppStrings.selectProvinceSubTitle:
        'Select your province from the list below',
    AppStrings.selectCity: 'Select City',
    AppStrings.selectCitySubTitle: 'Select your city from the list below',

    AppStrings.countryCode: 'Country Code',
    AppStrings.countryCodeSubTitle:
        'Select your country code from the list below',
  };
}
