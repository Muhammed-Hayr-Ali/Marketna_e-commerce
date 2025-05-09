// ignore_for_file: equal_keys_in_map

import 'package:application/constants/import.dart';

class Arabic {
  Map<String, String> get keys => {
    // --- AppStrings ---
    AppStrings.onboardingTitle_1:
        'اكتشف طريقة جديدة للتسوق، أسرع وأسهل من أي وقت مضى!',
    AppStrings.onboardingTitle_2:
        'استلم طلباتك أينما كنت وفي الوقت الذي يناسبك!',
    AppStrings.onboardingTitle_3:
        'تحكم في كل طلبية بشكل ذكي، من الطلب حتى الاستلام!',
    AppStrings.onboardingSubTitle_1:
        'تسوّق من آلاف المنتجات بنقرات قليلة واستمتع بتجربة شخصية تناسب احتياجاتك في أي وقت ومن أي مكان.',
    AppStrings.onboardingSubTitle_2:
        'نوفر لك خيارات توصيل سريعة وآمنة مع تتبع فوري لحالة الطلبية وتحديثات مباشرة حتى تصل إلى بابك.',
    AppStrings.onboardingSubTitle_3:
        'تتبع طلباتك وتعديل التفاصيل أو إعادة الطلب بسهولة عبر واجهة واضحة، مع دعم فني متاح 24/7 لحل أي استفسار.',
    AppStrings.language: 'اللغة',
    AppStrings.poweredBy: 'تقديم من PST',
    AppStrings.addNewAddress: 'إضافة عنوان جديد',
    AppStrings.editAddress: 'تعديل العنوان',
    AppStrings.addressName: 'اسم العنوان',
    AppStrings.streetAddress: 'عنوان الشارع',
    AppStrings.phoneNumberHint: '0987654321',
    AppStrings.countryCodeHint: '963',
    AppStrings.phoneNumber: 'رقم الهاتف',
    AppStrings.notes: 'ملاحظات',
    AppStrings.updateAddress: 'تحديث العنوان',
    AppStrings.saveAddress: 'حفظ العنوان',
    AppStrings.deleteAddress: 'حذف العنوان',
    AppStrings.deleteAddressMessage: 'هل أنت متأكد أنك تريد حذف هذا العنوان؟',
    AppStrings.addressDetails: 'تفاصيل العنوان',
    AppStrings.country: 'الدولة',
    AppStrings.stateProvince: 'الولاية / المحافظة',
    AppStrings.city: 'المدينة',
    AppStrings.noAddressesErrorMessage:
        'ليس لديك أي عنوان بعد. قم بإضافة عناوين الشحن الخاصة بك.',
    AppStrings.manageAddresses: 'إدارة العناوين',
    AppStrings.forgotPassword: 'نسيت كلمة المرور',
    AppStrings.forgotPasswordSubTitle:
        'أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور',
    AppStrings.email: 'البريد الإلكتروني',
    AppStrings.emailHint: 'أدخل بريدك الإلكتروني',
    AppStrings.emailExample: 'example@email.com',
    AppStrings.sendResetCode: 'إرسال رمز إعادة التعيين',
    AppStrings.locationServicesDisabled: 'خدمات الموقع معطلة.',
    AppStrings.notificationServicesDisabled: 'خدمات الإشعارات معطلة.',
    AppStrings.openSettings: 'فتح الإعدادات',
    AppStrings.locationPermission: 'ما هو موقعك؟',
    AppStrings.locationPermissionSubTitle:
        'سمح لنا بالوصول إلى موقعك لعرض المتاجر الأقرب إليك.',
    AppStrings.locationPermissionButtonText: 'السماح بالوصول إلى الموقع',
    AppStrings.notificationPermission: 'الوصول إلى الإشعارات',
    AppStrings.notificationPermissionSubTitle:
        'سمح لنا بالوصول إلى إشعارات جهازك.',
    AppStrings.notificationPermissionButtonText: 'السماح بالوصول إلى الإشعارات',
    AppStrings.signIn: 'تسجيل الدخول',
    AppStrings.signInSubTitle: 'مرحبًا بك مرة أخرى، لقد اشتقنا إليك!',
    AppStrings.password: 'كلمة المرور',
    AppStrings.passwordHint: '●●●●●●●●●',
    AppStrings.forgotPasswordButtonText: 'نسيت كلمة المرور؟',
    AppStrings.dontHaveAccount: 'ليس لديك حساب؟',
    AppStrings.signInButtonText: 'تسجيل الدخول',
    AppStrings.orSignInWith: 'او تسجيل الدخول بواسطة',
    AppStrings.createNewAccount: 'إنشاء حساب جديد',
    AppStrings.createNewAccountSubTitle: 'املأ تفاصيلك للمتابعة',
    AppStrings.fullName: 'الاسم الكامل',
    AppStrings.nameExample: 'جون دو',
    AppStrings.confirmPassword: 'تأكيد كلمة المرور',
    AppStrings.iAgree: 'أنا أوافق على',
    AppStrings.termsOfUse: 'شروط الاستخدام',
    AppStrings.and: ' و ',
    AppStrings.privacyPolicy: 'سياسة الخصوصية',
    AppStrings.signUpButtonText: 'إنشاء حساب',
    AppStrings.updatePassword: 'تحديث كلمة المرور',
    AppStrings.updatePasswordSubTitle: 'أدخل رمز التحقق وكلمة المرور الجديدة',
    AppStrings.updatePasswordButtonText: 'تحديث كلمة المرور',
    AppStrings.dateOfBirth: 'تاريخ الميلاد',
    AppStrings.dateOfBirthSubTitle: 'اختر تاريخ ميلادك',
    AppStrings.selectImage: 'اختيار صورة',
    AppStrings.selectImageSubTitle: 'اختر مصدر الصورة الشخصية',
    AppStrings.camera: 'الكاميرا',
    AppStrings.gallery: 'المعرض',
    AppStrings.delete: 'حذف',
    AppStrings.gender: 'الجنس',
    AppStrings.genderSubTitle: 'اختر جنسك',
    AppStrings.notSpecified: 'غير محدد',
    AppStrings.male: 'ذكر',
    AppStrings.female: 'أنثى',
    AppStrings.editProfile: 'تعديل الملف الشخصي',
    AppStrings.statusMessage: 'رسالة الحالة',
    AppStrings.statusMessageHint: 'مرحباً بالعالم!',
    AppStrings.updateButtonText: 'تحديث',
    AppStrings.logout: 'تسجيل الخروج',
    AppStrings.logoutSubTitle: 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
    AppStrings.logoutButtonText: 'تسجيل الخروج الآن',
    AppStrings.profile: 'الملف الشخصي',
    AppStrings.myAddresses: 'عناويني',
    AppStrings.myOrders: 'طلباتي',
    AppStrings.settings: 'الإعدادات',
    AppStrings.help: 'المساعدة',
    AppStrings.languageSubTitle: 'اختر لغتك المفضلة',
    AppStrings.dependingOnTheDeviceSystem: 'حسب نظام الجهاز',
    AppStrings.arabic: 'العربية',
    AppStrings.english: 'الإنجليزية',
    AppStrings.german: 'الألمانية',
    AppStrings.francis: 'الفرنسية',
    AppStrings.turkish: 'التركية',
    AppStrings.version: 'الإصدار',

    AppStrings.retry: 'إعادة المحاولة',
    AppStrings.no: 'لا',
    AppStrings.yes: 'نعم',
    AppStrings.ok: 'حسنًا',
    AppStrings.cancel: 'إلغاء',
    AppStrings.continueText: 'متابعة',
    AppStrings.next: 'التالي',
    AppStrings.back: 'رجوع',
    AppStrings.skip: 'تخطي',
    AppStrings.confirm: 'تأكيد',

    // --- ValidatorMessage ---
    ValidatorMessage.verificationCodeEmptyErrorMessage:
        'رمز التحقق لا يمكن أن يكون فارغًا',
    ValidatorMessage.verificationCodeLengthErrorMessage:
        'يجب أن يتكون رمز التحقق من 6 أرقام',
    ValidatorMessage.countryCodeRequired: 'كود الدولة مطلوب',
    ValidatorMessage.phoneNumberRequired: 'رقم الهاتف مطلوب',
    ValidatorMessage.emailRequired: 'البريد الإلكتروني لا يمكن أن يكون فارغًا',
    ValidatorMessage.invalidEmail: 'بريد إلكتروني غير صالح',
    ValidatorMessage.passwordRequired: 'كلمة المرور لا يمكن أن تكون فارغة',
    ValidatorMessage.passwordLength:
        'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل',
    ValidatorMessage.passwordNotMatch: 'كلمات المرور غير متطابقة',
    ValidatorMessage.confirmPasswordRequired:
        'تأكيد كلمة المرور لا يمكن أن يكون فارغًا',
    ValidatorMessage.confirmPasswordLength:
        'يجب أن يكون تأكيد كلمة المرور مكونًا من 6 أحرف على الأقل',
    ValidatorMessage.confirmPasswordNotMatch: 'كلمات المرور غير متطابقة',
    ValidatorMessage.verificationCodeRequired:
        'رمز التحقق لا يمكن أن يكون فارغًا',
    ValidatorMessage.verificationCodeLength:
        'يجب أن يتكون رمز التحقق من 6 أرقام',
    ValidatorMessage.nameRequired: 'الاسم لا يمكن أن يكون فارغًا',
    ValidatorMessage.invalidPhone: 'رقم هاتف غير صالح',

    ValidatorMessage.addressNameRequired: 'اسم العنوان لا يمكن أن يكون فارغًا',
    ValidatorMessage.streetAddressRequired:
        'عنوان الشارع لا يمكن أن يكون فارغًا',
    ValidatorMessage.cityRequired: 'اختر المدينة مطلوبة',
    ValidatorMessage.stateProvinceRequired: 'اختر الولاية أو المحافظة مطلوبة',
    ValidatorMessage.countryRequired: 'اختر الدولة مطلوبة',
    ValidatorMessage.invalidCountryCode: 'كود الدولة غير صحيح',

    // --- NotificationMessage ---
    NotificationMessage.noInternet: 'لا يوجد اتصال بالإنترنت متاح',
    NotificationMessage.timeOut: 'انتهاء مهلة الاتصال، يرجى المحاولة مجددًا',
    NotificationMessage.somethingWentWrong:
        'حدث خطأ ما في مكانٍ ما، وسنعمل على إصلاحه في أقرب وقت.',
    NotificationMessage.locationDisabled: 'خدمات الموقع معطلة.',
    NotificationMessage.locationDenied: 'تم رفض أذونات الموقع',
    NotificationMessage.locationDeniedForever:
        'تم رفض أذونات الموقع بشكل دائم، لا يمكننا طلب الأذونات.',
    NotificationMessage.userNull:
        'معرّف المستخدم فارغ. لا يمكن تحميل العناوين.',
    NotificationMessage.addressDeletedSuccess: 'تم حذف العنوان بنجاح.',
    NotificationMessage.unableToSendCode:
        'لا يمكن إرسال رمز إعادة تعيين كلمة المرور في الوقت الحالي. يرجى المحاولة لاحقًا.',
    NotificationMessage.securityCodeRequest:
        'يمكنك طلب رمز الأمان مرة أخرى بعد %s ثانية.',
    NotificationMessage.googleSigninFailed: 'فشل تسجيل الدخول عبر Google',
    NotificationMessage.missingTokenError: 'رمز الوصول أو رمز الهوية مفقود',
    NotificationMessage.userNotFound: 'المستخدم غير موجود في الجلسة',
    NotificationMessage.passwordUpdatedSuccess: 'تم تحديث كلمة المرور بنجاح',
    NotificationMessage.emailCopied: 'تم نسخ البريد الإلكتروني إلى الحافظة',
    NotificationMessage.imageUploadFailed: 'حدث خطأ أثناء رفع الصورة',
    NotificationMessage.imageDeleteFailed: 'حدث خطأ أثناء حذف الصورة',

    AppStrings.selectCountry: 'اختر الدولة',
    AppStrings.selectCountrySubTitle: 'اختر دولتك من القائمة أدناه',
    AppStrings.selectProvince: 'اختر المحافظة',
    AppStrings.selectProvinceSubTitle: 'اختر محافظتك من القائمة أدناه',
    AppStrings.selectCity: 'اختر المدينة',
    AppStrings.selectCitySubTitle: 'اختر مدينتك من القائمة أدناه',

    AppStrings.countryCode: 'كود الدولة',
    AppStrings.countryCodeSubTitle: 'اختر كود الدولة من القائمة أدناه',
  };
}
