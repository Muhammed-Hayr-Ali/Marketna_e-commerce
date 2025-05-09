// ignore_for_file: equal_keys_in_map

import 'package:application/constants/import.dart';

class German {
  Map<String, String> get keys => {
    // --- AppStrings ---
    AppStrings.onboardingTitle_1:
        'Entdecke eine neue Art einzukaufen – schneller und einfacher denn je!',
    AppStrings.onboardingTitle_2:
        'Empfange deine Bestellungen überall dort, wo du bist – zu einer Zeit, die dir passt!',
    AppStrings.onboardingTitle_3:
        'Behalte jede Bestellung intelligent im Blick – vom Auftrag bis zur Lieferung!',
    AppStrings.onboardingSubTitle_1:
        'Einkaufen aus Tausenden von Produkten mit nur wenigen Klicks und genieße ein personalisiertes Erlebnis, das perfekt zu dir passt – jederzeit und überall.',
    AppStrings.onboardingSubTitle_2:
        'Wir bieten schnelle und sichere Lieferoptionen mit Echtzeit-Tracking des Bestellstatus und Live-Updates, bis die Lieferung vor deiner Tür eintrifft.',
    AppStrings.onboardingSubTitle_3:
        'Verfolge deine Bestellungen, passe Details an oder bestelle erneut ganz einfach über eine klare Oberfläche. Unser technischer Support steht dir rund um die Uhr zur Verfügung, um alle Anfragen zu klären.',
    AppStrings.language: 'Sprache',
    AppStrings.poweredBy: 'Angetrieben von PST',
    AppStrings.addNewAddress: 'Neue Adresse hinzufügen',
    AppStrings.editAddress: 'Adresse bearbeiten',
    AppStrings.addressName: 'Adressname',
    AppStrings.streetAddress: 'Straßenadresse',
    AppStrings.phoneNumberHint: '0987654321',
    AppStrings.countryCodeHint: '963',
    AppStrings.phoneNumber: 'Telefonnummer',
    AppStrings.notes: 'Notizen',
    AppStrings.updateAddress: 'Adresse aktualisieren',
    AppStrings.saveAddress: 'Adresse speichern',
    AppStrings.deleteAddress: 'Adresse löschen',
    AppStrings.deleteAddressMessage:
        'Bist du sicher, dass du diese Adresse löschen möchtest?',
    AppStrings.addressDetails: 'Adressdetails',
    AppStrings.country: 'Land',
    AppStrings.stateProvince: 'Bundesland / Provinz',
    AppStrings.city: 'Stadt',
    AppStrings.noAddressesErrorMessage:
        'Du hast noch keine Adresse. Füge deine Lieferadressen hinzu.',
    AppStrings.manageAddresses: 'Adressen verwalten',
    AppStrings.forgotPassword: 'Passwort vergessen',
    AppStrings.forgotPasswordSubTitle:
        'Gib deine E-Mail-Adresse ein, um dein Passwort zurückzusetzen',
    AppStrings.email: 'E-Mail',
    AppStrings.emailHint: 'Gib deine E-Mail-Adresse ein',
    AppStrings.emailExample: 'beispiel@email.com',
    AppStrings.sendResetCode: 'Zurücksetz-Code senden',
    AppStrings.locationServicesDisabled: 'Standortdienste sind deaktiviert.',
    AppStrings.notificationServicesDisabled:
        'Benachrichtigungsdienste sind deaktiviert.',
    AppStrings.openSettings: 'Einstellungen öffnen',
    AppStrings.locationPermission: 'Wo befindest du dich?',
    AppStrings.locationPermissionSubTitle:
        'Erlaube uns Zugriff auf deinen Standort, um dir die nächstgelegenen Geschäfte anzuzeigen.',
    AppStrings.locationPermissionButtonText: 'Standortzugriff erlauben',
    AppStrings.notificationPermission: 'Benachrichtigungen aktivieren',
    AppStrings.notificationPermissionSubTitle:
        'Erlaube uns Zugriff auf deine Benachrichtigungen.',
    AppStrings.notificationPermissionButtonText:
        'Benachrichtigungszugriff erlauben',
    AppStrings.signIn: 'Anmelden',
    AppStrings.signInSubTitle:
        'Hallo! Willkommen zurück, wir haben dich vermisst!',
    AppStrings.password: 'Passwort',
    AppStrings.passwordHint: '●●●●●●●●●',
    AppStrings.forgotPasswordButtonText: 'Passwort vergessen?',
    AppStrings.dontHaveAccount: 'Du hast kein Konto?',
    AppStrings.signInButtonText: 'Anmelden',
    AppStrings.orSignInWith: 'Oder anmelden mit',
    AppStrings.createNewAccount: 'Neues Konto erstellen',
    AppStrings.createNewAccountSubTitle:
        'Fülle deine Daten aus, um fortzufahren',
    AppStrings.fullName: 'Vollständiger Name',
    AppStrings.nameExample: 'Max Mustermann',
    AppStrings.confirmPassword: 'Passwort bestätigen',
    AppStrings.iAgree: 'Ich akzeptiere die',
    AppStrings.termsOfUse: 'Nutzungsbedingungen',
    AppStrings.and: ' und ',
    AppStrings.privacyPolicy: 'Datenschutzerklärung',
    AppStrings.signUpButtonText: 'Registrieren',
    AppStrings.updatePassword: 'Passwort aktualisieren',
    AppStrings.updatePasswordSubTitle:
        'Gib deinen Verifizierungscode und dein neues Passwort ein',
    AppStrings.updatePasswordButtonText: 'Passwort aktualisieren',
    AppStrings.dateOfBirth: 'Geburtsdatum',
    AppStrings.dateOfBirthSubTitle: 'Wähle dein Geburtsdatum',
    AppStrings.selectImage: 'Bild auswählen',
    AppStrings.selectImageSubTitle: 'Wähle die Quelle für dein Profilbild',
    AppStrings.camera: 'Kamera',
    AppStrings.gallery: 'Galerie',
    AppStrings.delete: 'Löschen',
    AppStrings.gender: 'Geschlecht',
    AppStrings.genderSubTitle: 'Wähle dein Geschlecht',
    AppStrings.notSpecified: 'Nicht angegeben',
    AppStrings.male: 'Männlich',
    AppStrings.female: 'Weiblich',
    AppStrings.editProfile: 'Profil bearbeiten',
    AppStrings.statusMessage: 'Statusnachricht',
    AppStrings.statusMessageHint: 'Hallo Welt!',
    AppStrings.updateButtonText: 'Aktualisieren',
    AppStrings.logout: 'Abmelden',
    AppStrings.logoutSubTitle: 'Bist du sicher, dass du dich abmelden willst?',
    AppStrings.logoutButtonText: 'Jetzt abmelden',
    AppStrings.profile: 'Profil',
    AppStrings.myAddresses: 'Meine Adressen',
    AppStrings.myOrders: 'Meine Bestellungen',
    AppStrings.settings: 'Einstellungen',
    AppStrings.help: 'Hilfe',
    AppStrings.languageSubTitle: 'Wähle deine bevorzugte Sprache',
    AppStrings.dependingOnTheDeviceSystem: 'Je nach Gerätesystem',
    AppStrings.arabic: 'العربية',
    AppStrings.english: 'Englisch',
    AppStrings.german: 'Deutsch',
    AppStrings.francis: 'Französisch',
    AppStrings.turkish: 'Türkisch',
    AppStrings.version: 'Version',

    AppStrings.retry: 'Erneut versuchen',
    AppStrings.no: 'Nein',
    AppStrings.yes: 'Ja',
    AppStrings.ok: 'OK',
    AppStrings.cancel: 'Abbrechen',
    AppStrings.continueText: 'Weiter',
    AppStrings.next: 'Weiter',
    AppStrings.back: 'Zurück',
    AppStrings.skip: 'Überspringen',
    AppStrings.confirm: 'Bestätigen',

    // --- ValidatorMessage ---
    ValidatorMessage.verificationCodeEmptyErrorMessage:
        'Der Verifizierungscode darf nicht leer sein',
    ValidatorMessage.verificationCodeLengthErrorMessage:
        'Der Verifizierungscode muss aus 6 Ziffern bestehen',
    ValidatorMessage.countryCodeRequired: 'Ländercode ist erforderlich',
    ValidatorMessage.phoneNumberRequired: 'Telefonnummer ist erforderlich',
    ValidatorMessage.emailRequired: 'E-Mail darf nicht leer sein',
    ValidatorMessage.invalidEmail: 'Ungültige E-Mail-Adresse',
    ValidatorMessage.passwordRequired: 'Passwort darf nicht leer sein',
    ValidatorMessage.passwordLength:
        'Das Passwort muss mindestens 6 Zeichen lang sein',
    ValidatorMessage.passwordNotMatch: 'Die Passwörter stimmen nicht überein',
    ValidatorMessage.confirmPasswordRequired:
        'Passwortbestätigung ist erforderlich',
    ValidatorMessage.confirmPasswordLength:
        'Die Passwortbestätigung muss mindestens 6 Zeichen lang sein',
    ValidatorMessage.confirmPasswordNotMatch:
        'Die Passwörter stimmen nicht überein',
    ValidatorMessage.verificationCodeRequired:
        'Der Verifizierungscode darf nicht leer sein',
    ValidatorMessage.verificationCodeLength:
        'Der Verifizierungscode muss aus 6 Ziffern bestehen',
    ValidatorMessage.nameRequired: 'Name darf nicht leer sein',
    ValidatorMessage.invalidPhone: 'Ungültige Telefonnummer',

    ValidatorMessage.addressNameRequired: 'Adressname darf nicht leer sein',
    ValidatorMessage.streetAddressRequired:
        'Straßenadresse darf nicht leer sein',
    ValidatorMessage.cityRequired: 'Stadt ist erforderlich',
    ValidatorMessage.stateProvinceRequired:
        'Bundesland oder Provinz ist erforderlich',
    ValidatorMessage.countryRequired: 'Land ist erforderlich',
    ValidatorMessage.invalidCountryCode: 'Ungültiger Ländercode',

    // --- NotificationMessage ---
    NotificationMessage.noInternet: 'Keine Internetverbindung verfügbar',
    NotificationMessage.timeOut:
        'Verbindungszeit abgelaufen. Bitte versuche es erneut.',
    NotificationMessage.somethingWentWrong:
        'Etwas ist schiefgelaufen. Wir werden unser Bestes tun, um es schnellstmöglich zu beheben.',
    NotificationMessage.locationDisabled: 'Standortdienste sind deaktiviert.',
    NotificationMessage.locationDenied: 'Standortzugriff wurde verweigert.',
    NotificationMessage.locationDeniedForever:
        'Standortzugriff wurde dauerhaft verweigert. Wir können keine Berechtigungen mehr anfordern.',
    NotificationMessage.userNull:
        'Benutzer-ID ist leer. Adressen können nicht geladen werden.',
    NotificationMessage.addressDeletedSuccess: 'Adresse erfolgreich gelöscht.',
    NotificationMessage.unableToSendCode:
        'Derzeit kann kein Passwort-Reset-Code gesendet werden. Bitte versuche es später erneut.',
    NotificationMessage.securityCodeRequest:
        'Du kannst in %s Sekunden einen neuen Sicherheitscode anfordern.',
    NotificationMessage.googleSigninFailed: 'Google-Anmeldung fehlgeschlagen',
    NotificationMessage.missingTokenError: 'Zugriffs- oder ID-Token fehlt',
    NotificationMessage.userNotFound: 'Benutzer nicht in der Sitzung gefunden',
    NotificationMessage.passwordUpdatedSuccess:
        'Passwort erfolgreich aktualisiert',
    NotificationMessage.emailCopied: 'E-Mail in die Zwischenablage kopiert',
    NotificationMessage.imageUploadFailed:
        'Beim Hochladen des Bildes ist ein Fehler aufgetreten',
    NotificationMessage.imageDeleteFailed:
        'Beim Löschen des Bildes ist ein Fehler aufgetreten',

    AppStrings.selectCountry: 'Land auswählen',
    AppStrings.selectCountrySubTitle:
        'Wählen Sie Ihr Land aus der Liste unten aus',
    AppStrings.selectProvince: 'Bundesland auswählen',
    AppStrings.selectProvinceSubTitle:
        'Wählen Sie Ihr Bundesland aus der Liste unten aus',
    AppStrings.selectCity: 'Stadt auswählen',
    AppStrings.selectCitySubTitle:
        'Wählen Sie Ihre Stadt aus der Liste unten aus',
  };
}
