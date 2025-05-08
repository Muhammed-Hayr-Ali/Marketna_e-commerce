// ignore_for_file: equal_keys_in_map

import 'package:application/constants/import.dart';

class French {
  Map<String, String> get keys => {
    // --- AppStrings ---
    AppStrings.onboardingTitle_1:
        'Découvrez une nouvelle façon de faire vos achats, plus rapide et facile que jamais !',
    AppStrings.onboardingTitle_2:
        'Recevez vos commandes où que vous soyez, à tout moment qui vous convient !',
    AppStrings.onboardingTitle_3:
        'Contrôlez chaque commande intelligemment, du passage à la réception !',
    AppStrings.onboardingSubTitle_1:
        'Achetez parmi des milliers de produits en quelques clics seulement, et profitez d\'une expérience personnalisée adaptée à vos besoins, à tout moment et de n\'importe où.',
    AppStrings.onboardingSubTitle_2:
        'Nous proposons des options de livraison rapides et sécurisées, avec un suivi en temps réel de l\'état de votre commande et des mises à jour en direct jusqu\'à votre porte.',
    AppStrings.onboardingSubTitle_3:
        'Suivez vos commandes, modifiez les détails ou passez des commandes à nouveau facilement via une interface claire, avec un support technique disponible 24h/7 pour résoudre toutes vos questions.',
    AppStrings.language: 'Langue',
    AppStrings.poweredBy: 'Propulsé par PST',
    AppStrings.addNewAddress: 'Ajouter une nouvelle adresse',
    AppStrings.editAddress: 'Modifier l\'adresse',
    AppStrings.addressName: 'Nom de l\'adresse',
    AppStrings.streetAddress: 'Adresse de la rue',
    AppStrings.phoneNumberHint: '0987654321',
    AppStrings.countryCodeHint: '963',
    AppStrings.phoneNumber: 'Numéro de téléphone',
    AppStrings.notes: 'Notes',
    AppStrings.updateAddress: 'Mettre à jour l\'adresse',
    AppStrings.saveAddress: 'Enregistrer l\'adresse',
    AppStrings.deleteAddress: 'Supprimer l\'adresse',
    AppStrings.deleteAddressMessage:
        'Êtes-vous sûr de vouloir supprimer cette adresse ?',
    AppStrings.addressDetails: 'Détails de l\'adresse',
    AppStrings.country: 'Pays',
    AppStrings.stateProvince: 'État / Province',
    AppStrings.city: 'Ville',
    AppStrings.noAddressesErrorMessage:
        'Vous n\'avez pas encore d\'adresse. Ajoutez vos adresses de livraison.',
    AppStrings.manageAddresses: 'Gérer les adresses',
    AppStrings.forgotPassword: 'Mot de passe oublié',
    AppStrings.forgotPasswordSubTitle:
        'Entrez votre e-mail pour réinitialiser votre mot de passe',
    AppStrings.email: 'E-mail',
    AppStrings.emailHint: 'Entrez votre e-mail',
    AppStrings.emailExample: 'example@email.com',
    AppStrings.sendResetCode: 'Envoyer le code de réinitialisation',
    AppStrings.locationServicesDisabled:
        'Les services de localisation sont désactivés.',
    AppStrings.notificationServicesDisabled:
        'Les services de notification sont désactivés.',
    AppStrings.openSettings: 'Ouvrir les paramètres',
    AppStrings.locationPermission: 'Quelle est votre localisation ?',
    AppStrings.locationPermissionSubTitle:
        'Autorisez-nous à accéder à votre localisation pour vous montrer les magasins les plus proches.',
    AppStrings.locationPermissionButtonText:
        'Autoriser l’accès à la localisation',
    AppStrings.notificationPermission: 'Accéder aux notifications',
    AppStrings.notificationPermissionSubTitle:
        'Autorisez-nous à accéder à vos notifications.',
    AppStrings.notificationPermissionButtonText:
        'Autoriser l’accès aux notifications',
    AppStrings.signIn: 'Se connecter',
    AppStrings.signInSubTitle: 'Bonjour ! Bienvenue, on vous a manqué !',
    AppStrings.password: 'Mot de passe',
    AppStrings.passwordHint: '●●●●●●●●●',
    AppStrings.forgotPasswordButtonText: 'Mot de passe oublié ?',
    AppStrings.dontHaveAccount: 'Vous n’avez pas de compte ?',
    AppStrings.signInButtonText: 'Se connecter',
    AppStrings.orSignInWith: 'Ou se connecter avec',
    AppStrings.createNewAccount: 'Créer un nouveau compte',
    AppStrings.createNewAccountSubTitle:
        'Remplissez vos coordonnées pour continuer',
    AppStrings.fullName: 'Nom complet',
    AppStrings.nameExample: 'Jean Dupont',
    AppStrings.confirmPassword: 'Confirmer le mot de passe',
    AppStrings.iAgree: 'J’accepte',
    AppStrings.termsOfUse: 'les Conditions d’utilisation',
    AppStrings.and: ' et ',
    AppStrings.privacyPolicy: 'la Politique de confidentialité',
    AppStrings.signUpButtonText: 'S’inscrire',
    AppStrings.updatePassword: 'Mettre à jour le mot de passe',
    AppStrings.updatePasswordSubTitle:
        'Entrez votre code de vérification et votre nouveau mot de passe',
    AppStrings.updatePasswordButtonText: 'Mettre à jour le mot de passe',
    AppStrings.dateOfBirth: 'Date de naissance',
    AppStrings.dateOfBirthSubTitle: 'Choisissez votre date de naissance',
    AppStrings.selectImage: 'Sélectionner une image',
    AppStrings.selectImageSubTitle: 'Choisissez la source de l’image de profil',
    AppStrings.camera: 'Appareil photo',
    AppStrings.gallery: 'Galerie',
    AppStrings.delete: 'Supprimer',
    AppStrings.gender: 'Genre',
    AppStrings.genderSubTitle: 'Sélectionnez votre genre',
    AppStrings.notSpecified: 'Non spécifié',
    AppStrings.male: 'Homme',
    AppStrings.female: 'Femme',
    AppStrings.editProfile: 'Modifier le profil',
    AppStrings.statusMessage: 'Statut',
    AppStrings.statusMessageHint: 'Bonjour le monde !',
    AppStrings.updateButtonText: 'Mettre à jour',
    AppStrings.logout: 'Déconnexion',
    AppStrings.logoutSubTitle: 'Êtes-vous sûr de vouloir vous déconnecter ?',
    AppStrings.logoutButtonText: 'Se déconnecter maintenant',
    AppStrings.profile: 'Profil',
    AppStrings.myAddresses: 'Mes adresses',
    AppStrings.myOrders: 'Mes commandes',
    AppStrings.settings: 'Paramètres',
    AppStrings.help: 'Aide',
    AppStrings.languageSubTitle: 'Choisissez votre langue préférée',
    AppStrings.dependingOnTheDeviceSystem: 'Selon le système de l’appareil',
    AppStrings.arabic: 'العربية',
    AppStrings.english: 'Anglais',
    AppStrings.german: 'Allemand',
    AppStrings.francis: 'Français',
    AppStrings.turkish: 'Turc',
    AppStrings.version: 'Version',

    AppStrings.retry: 'Réessayer',
    AppStrings.no: 'Non',
    AppStrings.yes: 'Oui',
    AppStrings.ok: 'OK',
    AppStrings.cancel: 'Annuler',
    AppStrings.continueText: 'Continuer',
    AppStrings.next: 'Suivant',
    AppStrings.back: 'Retour',
    AppStrings.skip: 'Passer',
    AppStrings.confirm: 'Confirmer',

    // --- ValidatorMessage ---
    ValidatorMessage.verificationCodeEmptyErrorMessage:
        'Le code de vérification ne peut pas être vide',
    ValidatorMessage.verificationCodeLengthErrorMessage:
        'Le code de vérification doit comporter 6 chiffres',
    ValidatorMessage.countryCodeRequired: 'Le code pays est requis',
    ValidatorMessage.phoneNumberRequired: 'Le numéro de téléphone est requis',
    ValidatorMessage.emailRequired: 'L’e-mail ne peut pas être vide',
    ValidatorMessage.invalidEmail: 'Adresse e-mail invalide',
    ValidatorMessage.passwordRequired: 'Le mot de passe ne peut pas être vide',
    ValidatorMessage.passwordLength:
        'Le mot de passe doit comporter au moins 6 caractères',
    ValidatorMessage.passwordNotMatch: 'Les mots de passe ne correspondent pas',
    ValidatorMessage.confirmPasswordRequired:
        'La confirmation du mot de passe est requise',
    ValidatorMessage.confirmPasswordLength:
        'La confirmation du mot de passe doit comporter au moins 6 caractères',
    ValidatorMessage.confirmPasswordNotMatch:
        'Les mots de passe ne correspondent pas',
    ValidatorMessage.verificationCodeRequired:
        'Le code de vérification ne peut pas être vide',
    ValidatorMessage.verificationCodeLength:
        'Le code de vérification doit comporter 6 chiffres',
    ValidatorMessage.nameRequired: 'Le nom ne peut pas être vide',
    ValidatorMessage.invalidPhone: 'Numéro de téléphone invalide',

    ValidatorMessage.addressNameRequired:
        'Le nom de l’adresse ne peut pas être vide',
    ValidatorMessage.streetAddressRequired:
        'L’adresse de la rue ne peut pas être vide',
    ValidatorMessage.cityRequired: 'La ville est requise',
    ValidatorMessage.stateProvinceRequired: 'L’état ou la province est requis',
    ValidatorMessage.countryRequired: 'Le pays est requis',
    ValidatorMessage.invalidCountryCode: 'Code pays invalide',

    // --- NotificationMessage ---
    NotificationMessage.noInternet: 'Aucune connexion Internet disponible',
    NotificationMessage.timeOut:
        'Délai de connexion expiré. Veuillez réessayer.',
    NotificationMessage.somethingWentWrong:
        'Quelque chose s\'est mal passé, nous allons corriger cela dès que possible.',
    NotificationMessage.locationDisabled:
        'Les services de localisation sont désactivés.',
    NotificationMessage.locationDenied:
        'Les autorisations de localisation sont refusées.',
    NotificationMessage.locationDeniedForever:
        'Les autorisations de localisation sont définitivement refusées, nous ne pouvons pas demander les autorisations.',
    NotificationMessage.userNull:
        'L’ID utilisateur est null. Impossible de charger les adresses.',
    NotificationMessage.addressDeletedSuccess:
        'L’adresse a été supprimée avec succès.',
    NotificationMessage.unableToSendCode:
        'Impossible d’envoyer le code de réinitialisation du mot de passe pour le moment. Veuillez réessayer plus tard.',
    NotificationMessage.securityCodeRequest:
        'Vous pouvez demander un code de sécurité à nouveau dans %s secondes.',
    NotificationMessage.googleSigninFailed: 'Échec de la connexion Google',
    NotificationMessage.missingTokenError: 'Jeton d’accès ou ID manquant',
    NotificationMessage.userNotFound: 'Utilisateur introuvable dans la session',
    NotificationMessage.passwordUpdatedSuccess:
        'Mot de passe mis à jour avec succès',
    NotificationMessage.emailCopied: 'E-mail copié dans le presse-papiers',
    NotificationMessage.imageUploadFailed:
        'Une erreur s’est produite lors du téléchargement de l’image',
    NotificationMessage.imageDeleteFailed:
        'Une erreur s’est produite lors de la suppression de l’image',
  };
}
