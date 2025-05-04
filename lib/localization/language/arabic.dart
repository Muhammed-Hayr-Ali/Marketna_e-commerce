class Arabic {
Map<String, String> get keys => {
///===========================================================================
/// Splash Screen
'language': 'اللغة',
'Retry': 'إعادة المحاولة',
'Powered by PST': 'مدعوم من PST',

///===========================================================================
/// Onboarding Screen
'onboarding_title_1':
'اكتشف طريقة جديدة للتسوق، أسرع وأسهل من أي وقت مضى!',
'onboarding_sub_title_1':
'اشترِ من آلاف المنتجات بنقرات قليلة فقط، واستمتع بتجربة شخصية تلائم احتياجاتك في أي وقت ومن أي مكان.',

'onboarding_title_2':
'استلم طلباتك أينما كنت وفي الوقت الذي يناسبك!',
'onboarding_sub_title_2':
'نوفر خيارات توصيل سريعة وآمنة، مع تتبع فوري لحالة الطلبية وتحديثات مباشرة حتى تصل إلى باب منزلك.',

'onboarding_title_3':
'تحكم ذكي في كل طلبية، من الطلب إلى الاستلام!',
'onboarding_sub_title_3':
'تتبع طلبياتك، وعدل التفاصيل، أو أعد الطلب بسهولة عبر واجهة واضحة، مع دعم فني على مدار الساعة لحل أي استفسارات.',

///===========================================================================
/// Sign In
'Sign In': 'تسجيل الدخول',
'Hi! Welcome Back, you\'ve been missed':
'مرحبًا! عدنا إليك، لقد اشتقنا إليك',
'Email': 'البريد الإلكتروني',
'example@email.com': 'مثال@البريد.كوم',
'Password': 'كلمة المرور',
'●●●●●●●●●': '●●●●●●●●●',
'Forgot Password?': 'نسيت كلمة المرور؟',
'Or Sign In With': 'أو سجل الدخول باستخدام',
'Don\'t have an account?': 'ليس لديك حساب؟',
'Sign Up': 'إنشاء حساب',
'Login with': 'تسجيل الدخول باستخدام',

///===========================================================================
/// Forgot Password
'Forgot Password': 'استعادة كلمة المرور',
'Enter your email to reset your password':
'أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور',
'Send Reset Code': 'إرسال رمز إعادة التعيين',

///===========================================================================
/// Update Password
'Update Password': 'تحديث كلمة المرور',
'Confirm Password': 'تأكيد كلمة المرور',
'Enter your verification code and new password':
'أدخل رمز التحقق وكلمة المرور الجديدة',
'Password updated successfully': 'تم تحديث كلمة المرور بنجاح',

///===========================================================================
/// Sign Up
'Create New Account': 'إنشاء حساب جديد',
'Fill your details to continue': 'املأ تفاصيلك للمتابعة',
'Full Name': 'الاسم الكامل',
'John Doe': 'جون دو',
'I agree to the': 'أوافق على',
'Terms of Use': 'شروط الاستخدام',
' and ': ' و ',
'Privacy Policy': 'سياسة الخصوصية',

///===========================================================================
/// App Exception
'Invalid login credentials': 'بيانات تسجيل الدخول غير صالحة',
'Google sign in failed': 'فشل تسجيل الدخول عبر جوجل',
'Missing access or ID token': 'رمز الوصول أو هوية المستخدم مفقود',
'User Not Found In Session': 'المستخدم غير موجود في الجلسة',
'No Internet Connection Available': 'لا يوجد اتصال بالإنترنت',
'Connection Time Out Please try again':
'انتهاء وقت الاتصال، حاول مجددًا',
'Something has gone wrong somewhere, and we will try to fix it right away.':
'حدث خطأ ما، وسنعمل على إصلاحه في أقرب وقت.',
'security_code_request': 'يمكنك طلب رمز الأمان مرة أخرى بعد %s ثانية.',
'Unable to send password reset code at this time. Please try again later.':
'تعذر إرسال رمز إعادة تعيين كلمة المرور الآن. حاول مجددًا لاحقًا.',
'Privacy policy URL could not be launched.':
'تعذر فتح رابط سياسة الخصوصية.',
'An error occurred while uploading the image':
'حدث خطأ أثناء رفع الصورة',
'An error occurred while deleting the image':
'حدث خطأ أثناء حذف الصورة',

///===========================================================================
/// Validators
'Email cannot be empty': 'البريد الإلكتروني لا يمكن أن يكون فارغًا',
'Invalid email': 'البريد الإلكتروني غير صالح',
'Password cannot be empty': 'كلمة المرور لا يمكن أن تكون فارغة',
'Password must be at least 6 characters':
'كلمة المرور يجب أن تحتوي على 6 أحرف على الأقل',
'Verification code cannot be empty': 'رمز التحقق لا يمكن أن يكون فارغًا',
'Verification code must be 6 digits':
'رمز التحقق يجب أن يكون 6 أرقام',
'Passwords do not match': 'كلمات المرور غير متطابقة',
'Confirm password cannot be empty': 'تأكيد كلمة المرور لا يمكن أن يكون فارغًا',
'Confirm password must be at least 6 characters':
'تأكيد كلمة المرور يجب أن يكون 6 أحرف على الأقل',
'Name cannot be empty': 'الاسم لا يمكن أن يكون فارغًا',
'Country code is required': 'رمز الدولة مطلوب',
'Phone number is required': 'رقم الهاتف مطلوب',
'Address name cannot be empty': 'اسم العنوان لا يمكن أن يكون فارغًا',
'Street address cannot be empty': 'عنوان الشارع لا يمكن أن يكون فارغًا',
'Select city required': 'اختيار المدينة مطلوب',
'Select state or province required': 'اختيار الولاية أو المحافظة مطلوب',
'Select country required': 'اختيار الدولة مطلوب',
'Phone number cannot be empty': 'رقم الهاتف لا يمكن أن يكون فارغًا',
'Invalid phone number': 'رقم الهاتف غير صالح',
'Country code cannot be empty': 'رمز الدولة لا يمكن أن يكون فارغًا',
'Invalid country code': 'رمز الدولة غير صالح',

///===========================================================================
/// Profile Screen
'Profile': 'الملف الشخصي',
'Welcome': 'مرحبًا',
'Edit Profile': 'تعديل الملف الشخصي',
'My Addresses': 'عناويني',
'My Orders': 'طلباتي',
'Settings': 'الإعدادات',
'Help': 'المساعدة',
'Logout': 'تسجيل الخروج',
'Are you sure you want to logout?': 'هل أنت متأكد من رغبتك في تسجيل الخروج؟',
'Logout Now': 'تسجيل الخروج الآن',
'Cancel': 'إلغاء',

///===========================================================================
/// Edit Profile Screen
'Select Image': 'اختيار صورة',
'Choose Profile Image Source': 'اختر مصدر الصورة الشخصية',
'Camera': 'الكاميرا',
'Gallery': 'المعرض',
'Delete': 'حذف',
'Status Message': 'رسالة الحالة',
'Email copied to clipboard': 'تم نسخ البريد الإلكتروني إلى الحافظة',
'Phone Number': 'رقم الهاتف',
'963': '963',
'0987654321': '0987654321',
'Country Code': 'رمز الدولة',
'Select your country code': 'اختر رمز دولتك',
'Gender': 'الجنس',
'Select your gender': 'اختر جنسك',
'Male': 'ذكر',
'Female': 'أنثى',
'Not Specified': 'غير محدد',
'Date of Birth': 'تاريخ الميلاد',
'Choose Your Date of Birth': 'اختر تاريخ ميلادك',
'Select Date': 'اختر التاريخ',
'Confirm': 'تأكيد',

///===========================================================================
/// My Address Screen
'Manage Addresses': 'إدارة العناوين',
'You don\'t have an address yet. Add your shipping addresses.':
'ليس لديك عنوان بعد. أضف عناوين التوصيل الخاصة بك.',
'Add New Address': 'إضافة عنوان جديد',
'Address Name': 'اسم العنوان',
'Street Address': 'عنوان الشارع',
'Country': 'الدولة',
'Select Country': 'اختر الدولة',
'State / Province': 'الولاية / المحافظة',
'Select Province': 'اختر الولاية',
'City': 'المدينة',
'Select City': 'اختر المدينة',
'Notes': 'ملاحظات',
'Save Address': 'حفظ العنوان',
'Update Address': 'تحديث العنوان',
'Edit Address': 'تعديل العنوان',
'Are you sure you want to delete this address?':
'هل أنت متأكد من رغبتك في حذف هذا العنوان؟',
'Delete Address': 'حذف العنوان',
'Address deleted successfully.': 'تم حذف العنوان بنجاح.',
'Close': 'إغلاق',
};
}

