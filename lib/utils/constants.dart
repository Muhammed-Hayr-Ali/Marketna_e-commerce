// ignore_for_file: constant_identifier_names

abstract class AppConstants {
  // ==============================
  // **App**
  // ==============================

  static const String appName = 'Application';
  static const String appVersion = '1.0.0';

  static const String fontFamily = 'Rubik';

  static const String privacypolicy =
      "https://www.freeprivacypolicy.com/live/00f25697-39a1-4cd6-a756-beec184a6055";

  // ==============================
  // **Image Source**
  // ==============================
  static const String CAMERA = 'camera';
  static const String GALLERY = 'gallery';
  static const String DELETE = 'delete';
  static const String IMAGE = 'image';
  static const String IMAGE_URL = 'image_url';
  static const String IMAGE_PATH = 'image_path';
  static const String IMAGE_FILE = 'image_file';
  static const String IMAGE_PICKER = 'image_picker';
  static const String IMAGE_PICKER_RESULT = 'image_picker_result';

  // ==============================
  // **Assets Source**
  // ==============================

  static const String BOTTOM_NAVBAR = 'assets/bottomNavbar/';

  static const String Flags = 'assets/flags/';

  static const String FONT = 'assets/fonts/';

  static const String ONBOARDING = 'assets/images/onboarding/';

  static const String SVG = 'assets/images/svg/';

  // ==============================
  // **User Metadata**
  // ==============================
  static const String EMAIL = 'email';

  static const String AVATAR = 'avatar';
  static const String AVATAR_URL = 'avatar_url';
  static const String PICTURE = 'picture';

  static const String USER_METADATA = 'user_metadata';
  static const String DISPLAY_NAME = 'display_name';
  static const String NAME = 'name';
  static const String FULL_NAME = 'full_name';
  static const String USER_NAME = 'user_name';
  static const String PREFERRED_USERNAME = 'preferred_username';
  static const String COUNTRY_CODE = 'countryCode';
  static const String PHONE = 'phone';
  static const String GENDER = 'gender';
  static const String DATE_BIRTH = 'date_birth';
  static const String LATITUDE = 'latitude';
  static const String LONGITUDE = 'longitude';

  /// ==============================
  /// **Shared Preferences**
  /// ==============================
  static const String USER_DATA = 'user_data';

  /// ==============================
  /// **Column**
  /// ==============================
  static const String CUSTOMER_ID = 'customer_id';

  /// ==============================
  /// **Notification**
  /// ==============================

  static const String ERROR = 'an_error_occurred:';
  static const String UNABLE_LOCATION_SERVICES = 'Unable_Location_services';
  static const String LOCATION_PERMISSIONS_DENIED =
      'Location_permissions_denied';
  static const String LOCATION_PERMISSIONS_DENIED_REQUEST_PERMISSIONS =
      'Location_permissions_denied_request_permissions';
  static const String ADDRESS_ADDED_SUCCESSFULLY = 'address_added_successfully';
  static const String ADDRESS_UPDATED_SUCCESSFULLY =
      'address_updated_successfully';

  static const String DATA_SENDING_ERROR = 'data_sending_error';
  static const String DATA_LOADING_ERROR = 'data_loading_error';
  static const String GOOGLE_SIGN_IN_FAILED = 'google_sign_in_failed';
  static const String PRIVACY_POLICY_CANNOT_BE_OPENED =
      'privacy_policy_cannot_be_opened';
  static const String VERIFICATION_CODE_CANNOT_BE_EMPTY =
      'verification_code_cannot_be_empty';
  static const String VERIFICATION_CODE_INVALID_LENGTH =
      'verification_code_invalid_length';
  static const String PASSWORD_UPDATED_SUCCESSFULLY =
      'password_updated_successfully';
  static const String EMAIL_COPIED = 'email_copied';
  static const String PROFILE_UPDATED_SUCCESSFULLY =
      'profile_updated_successfully';

  static const String PLEASE_SELECT_LOCATION = 'please_select_location';
  static const String SELECT_COUNTRY_REQUIRED = 'select_country_required';
  static const String COUNTRY_CODE_REQUIRED = 'country_code_required';
  static const String SELECT_PROVINCE_REQUIRED = 'select_province_required';
  static const String SELECT_CITY_REQUIRED = 'select_city_required';

  /// ==============================
  /// **Translations**
  /// ==============================

  static const String SELECT_IMAGE_SOURCE = 'select_image_source';
  static const String SELECT_GENDER = 'select_gender';
  static const String NOT_SPECIFIED = 'not_specified';
  static const String MALE = 'male';
  static const String FEMALE = 'female';
  static const String CHOOSE_YOUR_DATE_OF_BIRTH = 'choose_your_date_of_birth';
  static const String DATE_FORMAT = 'yyyy-MM-dd';
  static const String CONFIRM = 'confirm';
  static const String ARE_YOU_SURE_LOGOUT = 'are_you_sure_logout';
  static const String CANCEL = 'cancel';
  static const String LOGOUT = 'logout';
  static const String YES = 'yes';
  static const String NO = 'no';
  static const String OK = 'ok';
  static const String DONE = 'done';
  static const String SKIP = 'skip';
  static const String NEXT = 'next';
  static const String BACK = 'back';
  static const String SAVE = 'save';
  static const String SEND = 'send';

  /// ==============================
  /// **Screens Text**
  /// ==============================
  /// **Address**
  static const String ADD_NEW_ADDRESS = 'add_new_address';
  static const String ADDRESS_NAME = 'address_name';
  static const String STREET_ADDRESS = 'street_address';
  static const String COUNTRY = 'country';
  static const String STATE_PROVINCE = 'state/province';
  static const String CITY = 'city';
  static const String PHONENUMBER = 'phone';
  static const String DEFAULT_PHONE = '987654321';
  static const String DEFAULT_COUNTRY_CODE = '+963';
  static const String NOTES = 'notes';
  static const String NO_ADDRESSES = 'no_addresses';
  static const String MANAGE_ADDRESSES = 'manage_addresses';
  static const String WANT_DELETE_ADDRESS = 'want_delete_address';
  static const String ADDRESS_DETAILS = 'address_details';

  /// **Auth**
  static const String RESET_PASSWORD = 'reset_password';
  static const String ENTER_EMAIL_FOR_RESET = 'enter_email_for_reset';
  static const String EXAMPLE_EMAIL = 'example@email.com';
  static const String LOGIN = 'login';
  static const String WELCOME_BACK = 'welcome_back';
  static const String PASSWORD = 'password';
  static const String EXAMPLE_PASSWORD = '●●●●●●●●●';
  static const String FORGOT_PASSWORD = 'forgot_password';
  static const String DATE_OF_BIRTH = 'date_of_birth';

  static const String DONT_HAVE_ACCOUNT = 'dont_have_account';
  static const String SIGN_UP = 'sign_up';
  static const String OR = 'or';
  static const String SIGN_IN_WITH = 'sign_in_with';
  static const String CREATE_ACCOUNT = 'create_account';
  static const String DEFAULT_NAME = 'John Doe';
  static const String FILL_YOUR_DETAILS = 'fill_your_details';
  static const String CONFIRM_PASSWORD = 'confirm_password';
  static const String SIGN_UP_SUCCESS = 'sign_up_success';
  static const String SIGN_UP_FAILED = 'sign_up_failed';
  static const String AGREE_TO_TERMS = 'agree_to_terms';
  static const String PRIVACY_POLICY = 'privacy_policy';
  static const String UPDATE_PASSWORD = 'update_password';
  static const String UPDATE_PASSWORD_DESC = 'update_password_desc';
  static const String UPDATE = 'update';

  /// **Onboarding**
  static const String ONBOARDING_TITLE_1 = 'Purchase Online';
  static const String ONBOARDING_TITLE_2 = 'Track order';
  static const String ONBOARDING_TITLE_3 = 'Get your order';
  static const String ONBOARDING_SUBTITLE_1 =
      'Enjoy a unique and easy shopping experience in our application';
  static const String ONBOARDING_SUBTITLE_2 = 'Track shipments real-time';
  static const String ONBOARDING_SUBTITLE_3 =
      'Enjoy your favorite products with confidence and safety';
  static const String ONBOARDING_NEXT = 'Next';

  /// **Profile**
  static const String PROFILE = 'profile';
  static const String EDIT_PROFILE = 'edit_profile';
  static const String MY_ADDRESSES = 'my_addresses';

  static const String MY_ORDERS = 'my_orders';
  static const String SETTINGS = 'settings';
  static const String SECURITY = 'security';
  static const String HELP_CENTER = 'help_center';
}
