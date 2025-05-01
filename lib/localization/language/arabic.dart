import 'package:application/utils/import.dart';

class Arabic {
  Map<String, String> get keys => {
    ///===========================================================================
    /// Splash Screen
    ConstantsText.POWERED_BY_PST: 'Powered By PST',
    ConstantsText.RETRY: 'إعادة المحاولة',

    ///===========================================================================
    /// Onboarding
    ConstantsText.ONBOARDING_TITLE_1: 'التسوق عبر الإنترنت',
    ConstantsText.ONBOARDING_TITLE_2: 'تتبع الطلب',
    ConstantsText.ONBOARDING_TITLE_3: 'احصل على طلبك',
    ConstantsText.ONBOARDING_SUBTITLE_1:
        'استمتع بتجربة تسوق فريدة وسهلة داخل تطبيقنا',
    ConstantsText.ONBOARDING_SUBTITLE_2: 'تتبع الشحنات في الوقت الفعلي',
    ConstantsText.ONBOARDING_SUBTITLE_3: 'تسوق منتجاتك المفضلة بأمان وثقة',

    ///===========================================================================
    /// language
    ConstantsText.LANGUAGE: 'اللغة',
    ConstantsText.SELECT_LANGUAGE: 'إختر اللغة',
    ConstantsText.ARABIC: 'العربية',
    ConstantsText.ENGLISH: 'الإنجليزية',
    ConstantsText.GERMAN: 'الالمانية',
    ConstantsText.FRENCH: 'الفرنسية',
    ConstantsText.TURKISH: 'التركية',

    ///===========================================================================
    /// General Text
    ConstantsText.SKIP: 'تخطي',
    ConstantsText.NEXT: 'التالي',
    ConstantsText.PREVIOUS: 'السابق',
    ConstantsText.NO: 'لا',
    ConstantsText.YES: 'نعم',
    ConstantsText.ACCEPT: 'قبول',
    ConstantsText.DECLINE: 'رفض',
    ConstantsText.ENABLED: 'مفعل',
    ConstantsText.DISABLED: 'غير مفعل',
    ConstantsText.TRUE: 'صحيح',
    ConstantsText.FALSE: 'خاطئ',
    ConstantsText.CONFIRM: 'تأكيد',
    ConstantsText.CANCEL: 'إلغاء',
    ConstantsText.SUBMIT: 'إرسال',
    ConstantsText.RESET: 'إعادة تعيين',
    ConstantsText.SAVE: 'حفظ',
    ConstantsText.DELETE: 'حذف',
    ConstantsText.SUCCESS: 'نجاح',
    ConstantsText.FAILURE: 'فشل',
    ConstantsText.PENDING: 'قيد الانتظار',
    ConstantsText.COMPLETED: 'مكتمل',
    ConstantsText.IN_PROGRESS: 'قيد التنفيذ',

    ///===========================================================================
    /// auth
    ConstantsText.WELCOME_BACK: 'مرحبًا بعودتك! لقد افتقدناك',
    ConstantsText.EXAMPLE_EMAIL: 'example@email.com',
    ConstantsText.EXAMPLE_PASSWORD: '●●●●●●●●●',
    ConstantsText.EMAIL: 'البريد الإلكتروني',
    ConstantsText.PASSWORD: 'كلمة المرور',
    ConstantsText.FORGOT_PASSWORD: 'نسيت كلمة المرور؟',
    ConstantsText.LOGIN: 'تسجيل الدخول',
    ConstantsText.DONT_HAVE_ACCOUNT: 'ليس لديك حساب؟',
    ConstantsText.SIGN_UP: 'إنشاء حساب',
    ConstantsText.OR: '- أو -',
    ConstantsText.SIGN_IN_WITH: 'الدخول باستخدام',
    ConstantsText.CREATE_ACCOUNT: 'إنشاء حساب جديد',

    ///===========================================================================
    ConstantsText.WHAT_IS_YOUR_LOCATION: 'ما هو موقعك؟',
    ConstantsText.WHAT_IS_YOUR_LOCATION_DESC:
        'يرجى السماح لنا بإستخدام موقعك لنتمكن من تقديم أفضل خدمات التوصيل والتسوق',
    ConstantsText.WHAT_IS_YOUR_NOTIFICATION: 'الوصول للإشعارات؟',
    ConstantsText.WHAT_IS_YOUR_NOTIFICATION_DESC:
        'يرجى السماح لنا بإرسال التنبيهات لنتمكن من تقديم خدماتك بطريقة سهلة وسريعة',
    ConstantsText.ALLOW_LOCATION_ACCESS: 'السماح بالوصول للموقع',
    ConstantsText.ALLOW_NOTIFICATION_ACCESS: 'السماح بالوصول للتنبيهات',
    ConstantsText.LOCATION_PERMISSIONS_DENIED:
        'تم رفض الوصول للموقع, هل ترعب بالذهاب الى الإعدادات و منح الاذن المطلوب',
    ConstantsText.NOTIFICATION_PERMISSION_Denied:
        'تم رفض الوصول للموقع, هل ترعب بالذهاب الى الإعدادات و منح الاذن المطلوب',
    ConstantsText.GO_TO_SETTINGS: 'إعدادات التطبيق',

    ///===========================================================================
    /// AppException
    AppException.SOMETHING_WENT_WRONG.message:
        'حدث خطاء، يرجى المحاولة مرة اخرى',
    AppException.NO_INTERNET_CONNECTION.message:
        'حدث خطأ في الاتصال،\nيرجى التحقق من الشبكة والمحاولة مرة أخرى',
    AppException.INVALID_LOGIN_CREDENTIALS.message:
        'بيانات تسجيل الدخول غير صحيحة',
    AppException.GOOGLE_SIGN_IN_FAILED.message:
        'فشل الحصول على معلومات حساب Google',
    AppException.MISSING_ACCESS_OR_ID_TOKEN.message:
        'فشل الحصول على Token أو لم يتم العثور على المستخدم',
    AppException.USER_NOT_FOUND_SESSION.message:
        'تعذر العثور على حسابك. يرجى المحاولة مجددًا أو التواصل مع الدعم',
    AppException.SECURITY_MESSAGE.message:
        'يمكنك طلب رمز إعادة التعيين مرة أخرى بعد %s ثانية.',
    AppException.TOKEN_EXPIRED.message: 'رمز التحقق غير صالح',
    AppException.PASSWORD_UPDATED_SUCCESSFULLY.message:
        'تم تحديث كلمة المرور بنجاح',

    AppException.USER_ALREADY_REGISTERED.message: 'المستخدم مسجل بالفعل',
    AppException.UNABLE_TO_SEND_PASSWORD_RESET_CODE.message:
        'غير قادر على ارسال رمز التحقق. يرجى المحاولة مرة اخرى.',

    /// عناوين وأوصاف الشاشات
    'fill_your_details': 'انضم إلى عائلتنا\nاملأ بياناتك أدناه',
    'update_password': 'تحديث كلمة المرور',
    'update_password_desc': 'أدخل رمز التحقق وكلمة المرور الجديدة',
    'profile': 'الملف الشخصي',
    'notifications': 'الإشعارات',
    'edit_profile': 'تعديل الملف الشخصي',
    'my_addresses': 'عناويني',
    'my_orders': 'طلباتي',
    'settings': 'الإعدادات',
    'security': 'الأمان',
    'manage_addresses': 'إدارة العناوين',
    'help_center': 'مركز المساعدة',

    /// أزرار وعناصر واجهة المستخدم
    'send': 'إرسال',
    'update': 'تحديث',
    'logout': 'تسجيل الخروج',
    'agree_to_terms': 'بالمتابعة، توافق على',
    'privacy_policy': 'سياسة الخصوصية',
    'terms_and_conditions': 'الشروط والأحكام',
    'ok': 'حسناً',
    'edit': 'تعديل',
    'add': 'إضافة',
    'search': 'بحث',
    'clear': 'مسح',
    'close': 'إغلاق',
    'back': 'رجوع',

    'done': 'تم',

    'camera': 'الكاميرا',
    'gallery': 'المعرض',
    'delete_image': 'حذف الصورة',
    'want_delete_address': 'هل ترغب في حذف هذا العنوان؟',

    /// مدخلات المستخدم
    'select_image_source': 'اختر مصدر الصورة',
    'new_password': 'كلمة المرور الجديدة',
    'confirm_password': 'تأكيد كلمة المرور',
    'full_name': 'الاسم الكامل',
    'verification_code': 'رمز التحقق',
    'first_name': 'الاسم الأول',
    'last_name': 'اسم العائلة',
    'countryCode': 'رمز الدولة',
    'phone': 'رقم الهاتف',
    'gender': 'الجنس',
    'date_of_birth': 'تاريخ الميلاد',
    'choose_your_date_of_birth': 'اختر تاريخ ميلادك',
    'state': 'الولاية',
    'address': 'العنوان',
    'email_copied': 'تم نسخ البريد الإلكتروني إلى الحافظة',

    /// رسائل الخطأ والتحقق
    'name_cannot_be_empty': 'الاسم لا يمكن أن يكون فارغًا',
    'email_cannot_be_empty': 'البريد الإلكتروني لا يمكن أن يكون فارغًا',
    'invalid_email': 'البريد الإلكتروني غير صالح',
    'password_cannot_be_empty': 'كلمة المرور لا يمكن أن تكون فارغة',
    'password_min_length': 'كلمة المرور يجب أن تتكون من 6 أحرف على الأقل',
    'confirm_password_cannot_be_empty':
        'تأكيد كلمة المرور لا يمكن أن يكون فارغًا',
    'confirm_password_min_length':
        'تأكيد كلمة المرور يجب أن يتكون من 6 أحرف على الأقل',
    'passwords_do_not_match': 'كلمة المرور وتأكيد كلمة المرور غير متطابقتين',
    'phone_cannot_be_empty': 'رقم الهاتف لا يمكن أن يكون فارغًا',
    'invalid_phone': 'رقم الهاتف غير صالح',
    'invalid_country_code': 'رمز الدولة غير صالح',
    'addressName_cannot_be_empty': 'اسم العنوان لا يمكن أن يكون فارغًا',
    'country_cannot_be_empty': 'اسم الدولة لا يمكن أن يكون فارغًا',
    'stateProvince_cannot_be_empty':
        'اسم الولاية أو المنطقة الإدارية لا يمكن أن يكون فارغًا',
    'city_cannot_be_empty': 'اسم المدينة لا يمكن أن يكون فارغًا',
    'streetAddress_cannot_be_empty': 'العنوان لا يمكن أن يكون فارغًا',
    'verification_code_cannot_be_empty': 'رمز التحقق لا يمكن أن يكون فارغًا',
    'verification_code_invalid_length': 'رمز التحقق يجب أن يتكون من 6 أرقام',
    'required_field': 'هذا الحقل مطلوب',
    'max_characters': 'الحد الأقصى لعدد الأحرف هو {0}',
    'min_characters': 'الحد الأدنى لعدد الأحرف هو {0}',
    'select_gender': 'يرجى تحديد الجنس',
    'network_error': 'تعذر الاتصال بالخادم يرجى التحقق من اتصال الإنترنت',
    'please_select_location': 'يرجى اختيار العنوان بشكل صحيح',

    'select_country_required': 'يرجى اختيار الدولة',
    'country_code_required': ' اختر رمز الدولة',
    'select_province_required': 'يرجى اختيار الولاية أو المنطقة',
    'select_city_required': 'يرجى اختيار المدينة',

    /// رسائل الاستجابة
    'reset_password': 'استعادة كلمة المرور',
    'enter_email_for_reset': 'أدخل البريد الإلكتروني لاستعادة كلمة المرور',
    'password_updated_successfully': 'تم تحديث كلمة المرور بنجاح',
    'profile_updated_successfully': 'تم تحديث الملف الشخصي بنجاح',
    'user_is_banned': 'لقد تم حظر حسابك',
    'are_you_sure_logout': 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
    'password_updated_successfully_response': 'تم تعديل كلمة المرور بنجاح',
    'account_deleted_successfully': 'تم حذف الحساب بنجاح',
    'action_cannot_be_undone': 'هذا الإجراء لا يمكن التراجع عنه',
    'please_try_again': 'يرجى المحاولة مرة أخرى',
    'no_data_found': 'لم يتم العثور على بيانات',
    'loading': 'جارٍ التحميل',
    'operation_completed_successfully': 'تمت العملية بنجاح',
    'operation_failed': 'فشلت العملية',
    'data_sending_error': 'حدث خطأ أثناء إرسال البيانات يرجى المحاولة مرة أخرى',
    'address_added_successfully': 'تمت إضافة العنوان بنجاح',
    'address_updated_successfully': 'تم تحديث العنوان بنجاح',
    'user_id_is_null':
        'تعذر الحصول على معلومات المستخدم يرجى إعادة تسجيل الدخول',
    'Unable_Location_services':
        'تعذر الوصول إلى خدمات الموقع يرجى تفعيل خدمات الموقع',
    'data_loading_error': 'حدث خطأ أثناء تحميل البيانات يرجى المحاولة مرة أخرى',
    'an_error_occurred': 'حدث خطأ:',
    'session_is_null': 'تعذر الحصول على معلومات الجلسة',
    'google_sign_in_failed': 'تعذر تسجيل الدخول باستخدام Google',

    'privacy_policy_cannot_be_opened': 'تعذر فتح رابط سياسة الخصوصية',

    /// وقت وتاريخ
    'today': 'اليوم',
    'yesterday': 'الأمس',
    'tomorrow': 'غدًا',
    'date': 'التاريخ',
    'time': 'الوقت',
    'am': 'صباحًا',
    'pm': 'مساءً',
    'PM': 'م',
    'AM': 'ص',
    'seconds': 'ثواني',
    'second': 'ثانية',
    'minutes': 'دقائق',
    'minute': 'دقيقة',
    'hours': 'ساعات',
    'hour': 'ساعة',
    'days': 'ايام',
    'day': 'يوم',
    'weeks': 'اسابيع',
    'week': 'اسبوع',
    'months': 'اشهر',
    'month': 'شهر',
    'years': 'سنوات',
    'year': 'سنة',

    /// تصنيفات وفئات
    'category': 'الفئة',
    'all_categories': 'جميع الفئات',
    'popular': 'شائع',
    'recent': 'حديث',
    'featured': 'مميز',
    'favorites': 'المفضلة',
    'history': 'السجل',
    'downloads': 'التنزيلات',

    /// عمليات الشراء والدفع
    'price': 'السعر',
    'quantity': 'الكمية',
    'total': 'الإجمالي',
    'checkout': 'إتمام الشراء',
    'payment_method': 'طريقة الدفع',
    'credit_card': 'بطاقة ائتمان',
    'cash_on_delivery': 'الدفع عند الاستلام',
    'free': 'مجاني',
    'discount': 'خصم',
    'order_summary': 'ملخص الطلب',
    'order_id': 'رقم الطلب',
    'order_status': 'حالة الطلب',
    'shipped': 'تم الشحن',
    'delivered': 'تم التسليم',
    'cancelled': 'ملغي',

    /// إعدادات الحساب
    'change_language': 'تغيير اللغة',
    'change_password': 'تغيير كلمة المرور',
    'change_theme': 'تغيير الوضع',
    'manage_account': 'إدارة الحساب',
    'delete_account': 'حذف الحساب',
    'logout_confirmation': 'هل تريد تسجيل الخروج؟',

    /// الجنس
    'not_specified': 'غير محدد',
    'male': 'ذكر',
    'female': 'أنثى',

    /// العناوين
    'add_new_address': 'إضافة عنوان جديد',
    'no_addresses': 'ليس لديك أي عنوان حتى الآن',
    'address_name': 'اسم العنوان',
    'home': 'منزل',
    'work': 'عمل',
    'shipping': 'شحن',
    'billing': 'فواتير',
    'street_address': 'العنوان الكامل (مثل رقم المنزل، اسم الشارع)',
    'city': 'المدينة',
    'select_city': 'اختر المدينة',
    'state/province': 'الولاية أو المنطقة',
    'select_province': 'اختر الولاية أو المنطقة',
    'country': 'الدولة',
    'select_country': 'اختر الدولة',
    'phone_number': 'رقم الهاتف المرتبط بالعنوان (اختياري)',
    'notes': 'ملاحظات إضافية حول العنوان (مثل تعليمات التسليم)',
    'location': 'الموقع',
    'address_details': 'تفاصيل العنوان',

    /// الاعدادات
    'about': 'حول التطبيق',

    /// 'reviews'
    'reviews': 'المراجعات',

    /// ملاحظات إضافية
    'powered_by': 'مدعوم بواسطة',
    'version': 'الإصدار',
    'copyright': 'حقوق النشر © {0}',
  };
}
