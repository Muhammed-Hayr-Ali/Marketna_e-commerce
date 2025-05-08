// ignore_for_file: constant_identifier_names

class KEYS {
  // ==============================
  // **Supabase Authentication**
  // ==============================
  static const String URL = 'https://ygkqhofmgcbnfkpeaqdt.supabase.co';
  static const String ANON_KEY =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlna3Fob2ZtZ2NibmZrcGVhcWR0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA2NTM5ODMsImV4cCI6MjA0NjIyOTk4M30.3QGNZcIIKySFMxcFBLmky3RRajFa31GeLT44ob8cAeo';
  static const String REDIRECT_TO = 'marketna.scheme://marketna-host';
  // ==============================
  // **Google Authentication**
  // ==============================
  static const String WEB_CLIENT_ID =
      '163382110383-sdr5eahg06p4goj565mb8vl4eso1khe9.apps.googleusercontent.com';

  // ==============================
  // **Twitter Authentication**
  // ==============================
  static const String API_KEY = '9RkqOkBgIIuIBcGz4KvQhp77M';
  static const String API_SECRET_KEY =
      'sBIqHDdVDn1JB2I4i3plAkll8JWxfPb5i5EEaWx7UIFd8BDbO7';
  static const String REDIRECT_URI =
      'https://ygkqhofmgcbnfkpeaqdt.supabase.co/auth/v1/callback';

  // ==============================
  // **Storage**
  // ==============================
  static const String USERS_BUCKET = 'users';
  static const String PROFILE_FOLDER = 'profile';

  // ==============================
  // **Table Name**
  // ==============================
  static const String ADDRESSES_TABLE = 'addresses';
  static const String COUNTRIES_TABLE = 'countries';
  static const String PRODUCTS_TABLE = 'products';
  static const String REVIEWS_TABLE = 'reviews';
  static const String PRODUCT_IMAGES_TABLE = 'product_images';
  static const String PURCHASES_TABLE = 'purchases';
  // ==============================
  // **Column Name**
  // ==============================
  static const String ID = 'id';
  static const String USER_ID = 'user_id';
  static const String COLUMN_QUALITY = 'quality';
  static const String FAVORITE_COUNT = 'favorite_count';
  static const String VIEWS_COUNT = 'views_count';
  static const String RATING_VALUE = 'rating_value';
  static const String PRODUCT_ID = 'product_id';
  static const String IMAGE_URL = 'image_url';
  static const String CREATED_AT = 'created_at';

  // ==============================
  // **Constants Values**
  // ==============================

  static const String PREMIUM = 'Premium';
}


class TABLES {
  static const String ADDRESSES = 'addresses';
  static const String COUNTRIES = 'countries';
  static const String PRODUCT_ATTRIBUTES = 'product_attributes';
  static const String PRODUCT_DETAILS = 'product_details';
  static const String PRODUCTS_IMAGES = 'products_images';
  static const String PRODUCTS_REVIEWS = 'products_reviews';
  static const String USER_PROFILES = 'user_profiles';
  static const String USER_PURCHASES = 'user_purchases';
}