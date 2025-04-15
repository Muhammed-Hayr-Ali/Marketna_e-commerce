class Turkish {
  Map<String, String> get keys => {
    /// Ekran Başlıkları ve Açıklamaları
    'welcome_back': 'Tekrar hoş geldin, seni özledik',
    'create_account': 'Yeni hesap oluştur',
    'fill_your_details': 'Ailemize katıl,\naşağıdaki bilgileri doldur',
    'update_password': 'Şifreyi güncelle',
    'update_password_desc': 'Doğrulama kodunu ve yeni şifreyi gir',
    'home': 'Ana Sayfa',
    'settings': 'Ayarlar',
    'profile': 'Profil',
    'notifications': 'Bildirimler',

    /// UI Butonları ve Elemanları
    'send': 'Gönder',
    'login': 'Giriş Yap',
    'sign_up': 'Kayıt Ol',
    'update': 'Güncelle',
    'retry': 'Tekrar Dene',
    'or': '- veya -',
    'sign_in_with': 'Şununla giriş yap',
    'logout': 'Çıkış Yap',
    'forgot_password': 'Şifreni mi unuttun?',
    'dont_have_account': "Hesabın yok mu?",
    'agree_to_terms': "Devam ederek,",
    'privacy_policy': 'Gizlilik Politikası',
    'terms_and_conditions': "Kullanım Şartları",
    'save': 'Kaydet',
    'cancel': 'İptal',
    'delete': 'Sil',
    'edit': 'Düzenle',
    'add': 'Ekle',
    'search': 'Ara',
    'clear': 'Temizle',
    'close': 'Kapat',
    'confirm': 'Onayla',
    'back': 'Geri',
    'next': 'İleri',
    'previous': 'Önceki',
    'done': 'Tamam',

    /// Kullanıcı Girdileri
    'email': 'E-posta',
    'password': 'Şifre',
    'new_password': 'Yeni Şifre',
    'confirm_password': 'Şifreyi Onayla',
    'full_name': 'Tam Ad',
    'verification_code': 'Doğrulama Kodu',
    'first_name': 'Ad',
    'last_name': 'Soyad',
    'phone': 'Telefon Numarası',
    'country': 'Ülke',
    'state': 'İlçe/İl',
    'city': 'Şehir',
    'address': 'Adres',
    'address_name': 'Adres Adı',

    /// Hata Mesajları ve Doğrulama
    'name_cannot_be_empty': 'Ad boş olamaz',
    'email_cannot_be_empty': 'E-posta boş olamaz',
    'invalid_email': 'Geçersiz e-posta adresi',
    'password_cannot_be_empty': 'Şifre boş olamaz',
    'password_min_length': 'Şifre en az 6 karakter olmalıdır',
    'confirm_password_cannot_be_empty': 'Şifre onayı boş olamaz',
    'confirm_password_min_length': 'Şifre onayı en az 6 karakter olmalıdır',
    'passwords_do_not_match': 'Şifre ve şifre onayı eşleşmiyor',
    'phone_cannot_be_empty': 'Telefon numarası boş olamaz',
    'invalid_phone': 'Geçersiz telefon numarası',
    'country_cannot_be_empty': 'Ülke boş olamaz',
    'state_cannot_be_empty': 'İlçe/İl boş olamaz',
    'city_cannot_be_empty': 'Şehir boş olamaz',
    'address_cannot_be_empty': 'Adres boş olamaz',
    'verification_code_cannot_be_empty': 'Doğrulama kodu boş olamaz',
    'verification_code_invalid_length': 'Doğrulama kodu 6 haneli olmalıdır',
    'required_field': 'Bu alan zorunludur',
    'max_characters': 'Maksimum karakter sayısı {0}',
    'min_characters': 'Minimum karakter sayısı {0}',

    /// Yanıt Mesajları
    'reset_password': 'Şifreyi Sıfırla',
    'enter_email_for_reset': 'Şifrenizi sıfırlamak için e-postanızı girin',
    'password_updated_successfully': 'Şifre başarıyla güncellendi',
    'no_internet_connection': 'Hata: İnternet bağlantısı yok',
    'user_already_registered': 'Kullanıcı zaten kayıtlı',
    'invalid_login_credentials': 'Geçersiz giriş bilgileri',
    'user_is_banned': 'Hesabınız yasaklandı',
    'are_you_sure_logout': 'Çıkış yapmak istediğinden emin misin?',
    'password_updated_successfully_response': 'Şifre başarıyla değiştirildi',
    'account_deleted_successfully': 'Hesap başarıyla silindi',
    'action_cannot_be_undone': 'Bu işlem geri alınamaz',
    'something_went_wrong': 'Bir şeyler yanlış gitti!',
    'please_try_again': 'Lütfen tekrar deneyin.',
    'no_data_found': 'Veri bulunamadı.',
    'loading': 'Yükleniyor...',
    'operation_completed_successfully': 'İşlem başarıyla tamamlandı',
    'operation_failed': 'İşlem başarısız oldu',

    /// Zaman ve Tarih
    'today': 'Bugün',
    'yesterday': 'Dün',
    'tomorrow': 'Yarın',
    'date': 'Tarih',
    'time': 'Saat',
    'hour': 'Saat',
    'minute': 'Dakika',
    'second': 'Saniye',
    'am': 'ÖÖ',
    'pm': 'ÖS',

    /// Kategoriler ve Sınıflandırma
    'category': 'Kategori',
    'all_categories': 'Tüm Kategoriler',
    'popular': 'Popüler',
    'recent': 'Son',
    'featured': 'Öne Çıkan',
    'favorites': 'Favoriler',
    'history': 'Geçmiş',
    'downloads': 'İndirmeler',

    /// Satın Alma ve Ödeme İşlemleri
    'price': 'Fiyat',
    'quantity': 'Miktar',
    'total': 'Toplam',
    'checkout': 'Ödeme',
    'payment_method': 'Ödeme Yöntemi',
    'credit_card': 'Kredi Kartı',
    'cash_on_delivery': 'Kapıda Ödeme',
    'free': 'Ücretsiz',
    'discount': 'İndirim',
    'order_summary': 'Sipariş Özeti',
    'order_id': 'Sipariş No',
    'order_status': 'Sipariş Durumu',
    'pending': 'Beklemede',
    'shipped': 'Gönderildi',
    'delivered': 'Teslim Edildi',
    'cancelled': 'İptal Edildi',

    /// Hesap Ayarları
    'change_language': 'Dili Değiştir',
    'change_password': 'Şifreyi Değiştir',
    'change_theme': 'Temayı Değiştir',
    'manage_account': 'Hesabı Yönet',
    'delete_account': 'Hesabı Sil',
    'logout_confirmation': 'Çıkış yapmak istediğinden emin misin?',

    /// Ek Notlar
    'powered_by': 'Tarafından desteklenmektedir',
    'version': 'Sürüm',
    'copyright': 'Telif Hakkı © {0}',
  };
}