class German {
  Map<String, String> get keys => {
    /// Bildschirm-Titel und Beschreibungen
    'welcome_back': 'Willkommen zurück, wir haben dich vermisst',
    'create_account': 'Neuen Account erstellen',
    'fill_your_details':
        'Trete unserer wachsenden Familie bei,\nfülle deine Daten unten aus',
    'update_password': 'Passwort aktualisieren',
    'update_password_desc':
        'Gib den Bestätigungscode und das neue Passwort ein',
    'home': 'Startseite',
    'settings': 'Einstellungen',
    'profile': 'Profil',
    'notifications': 'Benachrichtigungen',

    /// UI-Buttons und Elemente
    'send': 'Senden',
    'login': 'Anmelden',
    'sign_up': 'Registrieren',
    'update': 'Aktualisieren',
    'retry': 'Wiederholen',
    'or': '- oder -',
    'sign_in_with': 'Anmelden mit',
    'logout': 'Abmelden',
    'forgot_password': 'Passwort vergessen?',
    'dont_have_account': "Du hast noch keinen Account?",
    'agree_to_terms': "Durch die Nutzung stimmst du den",
    'privacy_policy': 'Datenschutzrichtlinien',
    'terms_and_conditions': "Nutzungsbedingungen",
    'save': 'Speichern',
    'cancel': 'Abbrechen',
    'delete': 'Löschen',
    'edit': 'Bearbeiten',
    'add': 'Hinzufügen',
    'search': 'Suchen',
    'clear': 'Löschen',
    'close': 'Schließen',
    'confirm': 'Bestätigen',
    'back': 'Zurück',
    'next': 'Weiter',
    'previous': 'Vorherige',
    'done': 'Fertig',

    /// Benutzereingaben
    'email': 'E-Mail',
    'password': 'Passwort',
    'new_password': 'Neues Passwort',
    'confirm_password': 'Passwort bestätigen',
    'full_name': 'Vollständiger Name',
    'verification_code': 'Bestätigungscode',
    'first_name': 'Vorname',
    'last_name': 'Nachname',
    'phone': 'Telefonnummer',
    'country': 'Land',
    'state': 'Bundesland',
    'city': 'Stadt',
    'address': 'Adresse',
    'address_name': 'Adressname',

    /// Fehlermeldungen und Validierung
    'name_cannot_be_empty': 'Der Name darf nicht leer sein',
    'email_cannot_be_empty': 'Die E-Mail darf nicht leer sein',
    'invalid_email': 'Ungültige E-Mail-Adresse',
    'password_cannot_be_empty': 'Das Passwort darf nicht leer sein',
    'password_min_length': 'Das Passwort muss mindestens 6 Zeichen lang sein',
    'confirm_password_cannot_be_empty':
        'Die Passwortbestätigung darf nicht leer sein',
    'confirm_password_min_length':
        'Die Passwortbestätigung muss mindestens 6 Zeichen lang sein',
    'passwords_do_not_match':
        'Passwort und Passwortbestätigung stimmen nicht überein',
    'phone_cannot_be_empty': 'Die Telefonnummer darf nicht leer sein',
    'invalid_phone': 'Ungültige Telefonnummer',
    'country_cannot_be_empty': 'Das Land darf nicht leer sein',
    'state_cannot_be_empty': 'Das Bundesland darf nicht leer sein',
    'city_cannot_be_empty': 'Die Stadt darf nicht leer sein',
    'address_cannot_be_empty': 'Die Adresse darf nicht leer sein',
    'verification_code_cannot_be_empty':
        'Der Bestätigungscode darf nicht leer sein',
    'verification_code_invalid_length':
        'Der Bestätigungscode muss 6 Ziffern lang sein',
    'required_field': 'Dieses Feld ist erforderlich',
    'max_characters': 'Maximale Anzahl an Zeichen ist {0}',
    'min_characters': 'Minimale Anzahl an Zeichen ist {0}',

    /// Antwortmeldungen
    'reset_password': 'Passwort zurücksetzen',
    'enter_email_for_reset':
        'Gib deine E-Mail ein, um dein Passwort zurückzusetzen',
    'password_updated_successfully': 'Passwort erfolgreich aktualisiert',
    'no_internet_connection': 'Fehler: Keine Internetverbindung',
    'user_already_registered': 'Benutzer bereits registriert',
    'invalid_login_credentials': 'Ungültige Anmeldeinformationen',
    'user_is_banned': 'Dein Konto wurde gesperrt',
    'are_you_sure_logout': 'Möchtest du dich wirklich abmelden?',
    'password_updated_successfully_response': 'Passwort erfolgreich geändert',
    'account_deleted_successfully': 'Konto erfolgreich gelöscht',
    'action_cannot_be_undone':
        'Diese Aktion kann nicht rückgängig gemacht werden',
    'something_went_wrong': 'Etwas ist schiefgelaufen!',
    'please_try_again': 'Bitte versuche es erneut.',
    'no_data_found': 'Keine Daten gefunden.',
    'loading': 'Wird geladen...',
    'operation_completed_successfully': 'Vorgang erfolgreich abgeschlossen',
    'operation_failed': 'Vorgang fehlgeschlagen',

    /// Zeit und Datum
    'today': 'Heute',
    'yesterday': 'Gestern',
    'tomorrow': 'Morgen',
    'date': 'Datum',
    'time': 'Uhrzeit',
    'hour': 'Stunde',
    'minute': 'Minute',
    'second': 'Sekunde',
    'am': 'AM',
    'pm': 'PM',

    /// Kategorien und Klassifizierungen
    'category': 'Kategorie',
    'all_categories': 'Alle Kategorien',
    'popular': 'Beliebt',
    'recent': 'Neu',
    'featured': 'Empfohlen',
    'favorites': 'Favoriten',
    'history': 'Verlauf',
    'downloads': 'Downloads',

    /// Kauf- und Zahlungsoperationen
    'price': 'Preis',
    'quantity': 'Menge',
    'total': 'Gesamt',
    'checkout': 'Zur Kasse',
    'payment_method': 'Zahlungsmethode',
    'credit_card': 'Kreditkarte',
    'cash_on_delivery': 'Nachnahme',
    'free': 'Kostenlos',
    'discount': 'Rabatt',
    'order_summary': 'Bestellübersicht',
    'order_id': 'Bestellnummer',
    'order_status': 'Bestellstatus',
    'pending': 'Ausstehend',
    'shipped': 'Versandt',
    'delivered': 'Geliefert',
    'cancelled': 'Abgebrochen',

    /// Kontoeinstellungen
    'change_language': 'Sprache ändern',
    'change_password': 'Passwort ändern',
    'change_theme': 'Design ändern',
    'manage_account': 'Konto verwalten',
    'delete_account': 'Konto löschen',
    'logout_confirmation': 'Möchtest du dich wirklich abmelden?',

    /// Zusätzliche Hinweise
    'powered_by': 'Unterstützt von',
    'version': 'Version',
    'copyright': 'Urheberrecht © {0}',
  };
}
