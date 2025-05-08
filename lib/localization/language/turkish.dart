// ignore_for_file: equal_keys_in_map

import 'package:application/constants/import.dart';

class Turkish {
  Map<String, String> get keys => {
    // --- AppStrings ---
    AppStrings.onboardingTitle_1:
        'Daha önce olmayan bir alışveriş deneyimi: daha hızlı ve kolay!',
    AppStrings.onboardingTitle_2:
        'Siparişlerinizi istediğiniz yerde, uygun zamanlarda alın!',
    AppStrings.onboardingTitle_3:
        'Siparişten teslimata kadar her şeyi akıllıca kontrol edin!',
    AppStrings.onboardingSubTitle_1:
        'Binlerce üründen birkaç tıklamayla alışveriş yapın ve ihtiyaçlarınıza uygun kişiselleştirilmiş bir deneyim yaşayın. Her zaman, her yerde.',
    AppStrings.onboardingSubTitle_2:
        'Sipariş durumunu anlık olarak takip edebileceğiniz ve kapınıza ulaşana kadar canlı güncellemeler sunan hızlı ve güvenli teslimat seçenekleri sunuyoruz.',
    AppStrings.onboardingSubTitle_3:
        'Siparişlerinizi takip edin, detayları düzenleyin veya temiz arayüz üzerinden tekrar sipariş verin. Tüm sorularınız için 7/24 teknik destek hizmetimiz mevcuttur.',
    AppStrings.language: 'Dil',
    AppStrings.poweredBy: 'Güçlü PST tarafından',
    AppStrings.addNewAddress: 'Yeni Adres Ekle',
    AppStrings.editAddress: 'Adresi Düzenle',
    AppStrings.addressName: 'Adres Adı',
    AppStrings.streetAddress: 'Sokak Adresi',
    AppStrings.phoneNumberHint: '0987654321',
    AppStrings.countryCodeHint: '963',
    AppStrings.phoneNumber: 'Telefon Numarası',
    AppStrings.notes: 'Notlar',
    AppStrings.updateAddress: 'Adresi Güncelle',
    AppStrings.saveAddress: 'Adresi Kaydet',
    AppStrings.deleteAddress: 'Adresi Sil',
    AppStrings.deleteAddressMessage:
        'Bu adresi silmek istediğinize emin misiniz?',
    AppStrings.addressDetails: 'Adres Detayları',
    AppStrings.country: 'Ülke',
    AppStrings.stateProvince: 'Eyalet / İl',
    AppStrings.city: 'Şehir',
    AppStrings.noAddressesErrorMessage:
        'Henüz bir adresiniz yok. Kargo adreslerinizi ekleyin.',
    AppStrings.manageAddresses: 'Adresleri Yönet',
    AppStrings.forgotPassword: 'Şifremi Unuttum',
    AppStrings.forgotPasswordSubTitle:
        'Şifrenizi sıfırlamak için e-posta adresinizi girin',
    AppStrings.email: 'E-posta',
    AppStrings.emailHint: 'E-posta adresinizi girin',
    AppStrings.emailExample: 'ornek@email.com',
    AppStrings.sendResetCode: 'Sıfırlama Kodu Gönder',
    AppStrings.locationServicesDisabled: 'Konum hizmetleri devre dışı.',
    AppStrings.notificationServicesDisabled: 'Bildirim hizmetleri devre dışı.',
    AppStrings.openSettings: 'Ayarları Aç',
    AppStrings.locationPermission: 'Konumunuz nerede?',
    AppStrings.locationPermissionSubTitle:
        'En yakın mağazaları göstermemiz için konumunuza erişim izni verin.',
    AppStrings.locationPermissionButtonText: 'Konuma Erişim İzni Ver',
    AppStrings.notificationPermission: 'Bildirimlere erişim',
    AppStrings.notificationPermissionSubTitle:
        'Bildirimlerinize erişmemize izin verin.',
    AppStrings.notificationPermissionButtonText: 'Bildirimlere Erişim İzni Ver',
    AppStrings.signIn: 'Oturum Aç',
    AppStrings.signInSubTitle: 'Merhaba! Tekrar hoş geldin, seni özledik!',
    AppStrings.password: 'Şifre',
    AppStrings.passwordHint: '●●●●●●●●●',
    AppStrings.forgotPasswordButtonText: 'Şifremi unuttum?',
    AppStrings.dontHaveAccount: 'Hesabınız yok mu?',
    AppStrings.signInButtonText: 'Giriş Yap',
    AppStrings.createNewAccount: 'Yeni Hesap Oluştur',
    AppStrings.createNewAccountSubTitle:
        'Devam etmek için bilgilerinizi doldurun',
    AppStrings.fullName: 'Tam İsim',
    AppStrings.nameExample: 'Ahmet Yılmaz',
    AppStrings.confirmPassword: 'Şifreyi Onayla',
    AppStrings.iAgree: 'Kabul ediyorum',
    AppStrings.termsOfUse: 'Kullanım Şartları',
    AppStrings.and: ' ve ',
    AppStrings.privacyPolicy: 'Gizlilik Politikası',
    AppStrings.signUpButtonText: 'Kayıt Ol',
    AppStrings.updatePassword: 'Şifreyi Güncelle',
    AppStrings.updatePasswordSubTitle:
        'Doğrulama kodunuzu ve yeni şifrenizi girin',
    AppStrings.updatePasswordButtonText: 'Şifreyi Güncelle',
    AppStrings.dateOfBirth: 'Doğum Tarihi',
    AppStrings.dateOfBirthSubTitle: 'Doğum tarihinizi seçin',
    AppStrings.selectImage: 'Resim Seç',
    AppStrings.selectImageSubTitle: 'Profil resminizin kaynağını seçin',
    AppStrings.camera: 'Kamera',
    AppStrings.gallery: 'Galeri',
    AppStrings.delete: 'Sil',
    AppStrings.gender: 'Cinsiyet',
    AppStrings.genderSubTitle: 'Cinsiyetinizi seçin',
    AppStrings.notSpecified: 'Belirtilmedi',
    AppStrings.male: 'Erkek',
    AppStrings.female: 'Kadın',
    AppStrings.editProfile: 'Profili Düzenle',
    AppStrings.statusMessage: 'Durum Mesajı',
    AppStrings.statusMessageHint: 'Merhaba dünya!',
    AppStrings.updateButtonText: 'Güncelle',
    AppStrings.logout: 'Çıkış Yap',
    AppStrings.logoutSubTitle: 'Oturumdan çıkmak istediğinizden emin misiniz?',
    AppStrings.logoutButtonText: 'Şimdi Çıkış Yap',
    AppStrings.profile: 'Profil',
    AppStrings.myAddresses: 'Adreslerim',
    AppStrings.myOrders: 'Siparişlerim',
    AppStrings.settings: 'Ayarlar',
    AppStrings.help: 'Yardım',
    AppStrings.languageSubTitle: 'Tercih ettiğiniz dili seçin',
    AppStrings.dependingOnTheDeviceSystem: 'Cihaz sistemine bağlı olarak',
    AppStrings.arabic: 'Arapça',
    AppStrings.english: 'İngilizce',
    AppStrings.german: 'Almanca',
    AppStrings.francis: 'Fransızca',
    AppStrings.turkish: 'Türkçe',
    AppStrings.version: 'Versiyon',

    AppStrings.retry: 'Tekrar Dene',
    AppStrings.no: 'Hayır',
    AppStrings.yes: 'Evet',
    AppStrings.ok: 'Tamam',
    AppStrings.cancel: 'İptal',
    AppStrings.continueText: 'Devam Et',
    AppStrings.next: 'İleri',
    AppStrings.back: 'Geri',
    AppStrings.skip: 'Atla',
    AppStrings.confirm: 'Onayla',

    // --- ValidatorMessage ---
    ValidatorMessage.verificationCodeEmptyErrorMessage:
        'Doğrulama kodu boş olamaz',
    ValidatorMessage.verificationCodeLengthErrorMessage:
        'Doğrulama kodu 6 basamaklı olmalıdır',
    ValidatorMessage.countryCodeRequired: 'Ülke kodu zorunludur',
    ValidatorMessage.phoneNumberRequired: 'Telefon numarası zorunludur',
    ValidatorMessage.emailRequired: 'E-posta adresi boş bırakılamaz',
    ValidatorMessage.invalidEmail: 'Geçersiz e-posta adresi',
    ValidatorMessage.passwordRequired: 'Şifre boş olamaz',
    ValidatorMessage.passwordLength: 'Şifre en az 6 karakter olmalıdır',
    ValidatorMessage.passwordNotMatch: 'Şifreler eşleşmiyor',
    ValidatorMessage.confirmPasswordRequired: 'Şifre tekrarı boş olamaz',
    ValidatorMessage.confirmPasswordLength:
        'Şifre tekrarı en az 6 karakter olmalıdır',
    ValidatorMessage.confirmPasswordNotMatch: 'Şifreler eşleşmiyor',
    ValidatorMessage.verificationCodeRequired: 'Doğrulama kodu boş olamaz',
    ValidatorMessage.verificationCodeLength:
        'Doğrulama kodu 6 basamaklı olmalıdır',
    ValidatorMessage.nameRequired: 'İsim boş olamaz',
    ValidatorMessage.invalidPhone: 'Geçersiz telefon numarası',

    ValidatorMessage.addressNameRequired: 'Adres adı boş olamaz',
    ValidatorMessage.streetAddressRequired: 'Sokak adresi boş olamaz',
    ValidatorMessage.cityRequired: 'Şehir seçimi zorunludur',
    ValidatorMessage.stateProvinceRequired: 'Eyalet veya il seçimi zorunludur',
    ValidatorMessage.countryRequired: 'Ülke seçimi zorunludur',
    ValidatorMessage.invalidCountryCode: 'Geçersiz ülke kodu',

    // --- NotificationMessage ---
    NotificationMessage.noInternet: 'İnternet bağlantısı yok',
    NotificationMessage.timeOut:
        'Bağlantı zaman aşımına uğradı. Lütfen tekrar deneyin.',
    NotificationMessage.somethingWentWrong:
        'Bir şeyler yanlış gitti ve hatayı en kısa sürede düzeltmeye çalışacağız.',
    NotificationMessage.locationDisabled: 'Konum hizmetleri devre dışı.',
    NotificationMessage.locationDenied: 'Konum izni reddedildi',
    NotificationMessage.locationDeniedForever:
        'Konum izni kalıcı olarak reddedildi. Artık izin isteyemiyoruz.',
    NotificationMessage.userNull:
        'Kullanıcı kimliği null. Adresler yüklenemiyor.',
    NotificationMessage.addressDeletedSuccess: 'Adres başarıyla silindi.',
    NotificationMessage.unableToSendCode:
        'Şu anda şifre sıfırlama kodu gönderilemiyor. Lütfen daha sonra tekrar deneyin.',
    NotificationMessage.securityCodeRequest:
        'Güvenlik kodunu %s saniye içinde tekrar talep edebilirsiniz.',
    NotificationMessage.googleSigninFailed: 'Google ile giriş başarısız oldu',
    NotificationMessage.missingTokenError: 'Eksik erişim veya ID token',
    NotificationMessage.userNotFound: 'Oturumda kullanıcı bulunamadı',
    NotificationMessage.passwordUpdatedSuccess: 'Şifre başarıyla güncellendi',
    NotificationMessage.emailCopied: 'E-posta panoya kopyalandı',
    NotificationMessage.imageUploadFailed: 'Resim yüklenirken bir hata oluştu',
    NotificationMessage.imageDeleteFailed: 'Resim silinirken bir hata oluştu',
  };
}
