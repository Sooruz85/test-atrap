import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? enText = '',
  }) =>
      [frText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'n4gzugd0': {
      'fr': 'Home',
      'en': '',
    },
  },
  // LoginPage
  {
    'qgqivinb': {
      'fr': 'Bienvenu',
      'en': 'Welcome Back',
    },
    'pj6s80wt': {
      'fr': 'Remplir le formulaire ci-dessous.',
      'en': 'Let\'s get started by filling out the form below.',
    },
    '8oncxaly': {
      'fr': 'Email',
      'en': 'Email',
    },
    '2rju5f6o': {
      'fr': 'Mot de passe',
      'en': 'Email',
    },
    'dfuyziqb': {
      'fr': 'Champs requis',
      'en': 'Required fields',
    },
    '0uh35t85': {
      'fr': 'Entrer un Email valide',
      'en': 'Enter a valid Email',
    },
    'clocmcxh': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'pjzb7p2x': {
      'fr': 'Field is required',
      'en': '',
    },
    'innc46v1': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ejz5kdvw': {
      'fr': 'Connexion',
      'en': 'Sign In',
    },
    '7r5oiw5v': {
      'fr': 'Pas de compte? ',
      'en': 'Don\'t have an account?  ',
    },
    'aeok2mfs': {
      'fr': 'Enregistrez-vous ici',
      'en': ' Sign Up here',
    },
    '3tszx79z': {
      'fr': 'Page accueil',
      'en': 'Home',
    },
  },
  // RegisterPage
  {
    'zqrl7c4t': {
      'fr': 'Créer un compte',
      'en': 'Create an account',
    },
    'f33vhaoh': {
      'fr': 'Remplir le formulaire ci-dessous.',
      'en': 'Let\'s get started by filling out the form below.',
    },
    'z7ddih75': {
      'fr': 'Email',
      'en': 'Email',
    },
    'y7z4vm3q': {
      'fr': 'Mot de passe',
      'en': 'Email',
    },
    '8clhzmyh': {
      'fr': 'Champs requis',
      'en': 'Required fields',
    },
    'j632pqt7': {
      'fr': 'Entrer un Email valide',
      'en': 'Enter a valid Email',
    },
    'zrbvujj0': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    '1y20i56s': {
      'fr': 'Field is required',
      'en': '',
    },
    'bjsbj6il': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5nqekhs5': {
      'fr': 'Créer un compte',
      'en': 'Create an account',
    },
    'wgkfnw3j': {
      'fr': 'Vous avez un compte?  ',
      'en': 'Do you have an account?',
    },
    'giddn4tt': {
      'fr': 'Se connecter',
      'en': ' Sign Up here',
    },
    'exe35o7n': {
      'fr': 'Page accueil',
      'en': 'Home',
    },
  },
  // settingPage
  {
    'zrwnmotg': {
      'fr': 'Paramétrage',
      'en': 'Setting',
    },
    'oru2sbq6': {
      'fr': 'Please evaluate your options below.',
      'en': '',
    },
    'v2a0opm8': {
      'fr': 'My Subscription',
      'en': '',
    },
    'octannun': {
      'fr': 'Déconnecter',
      'en': 'Disconnect',
    },
    'e7ks3dr5': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'jiyd1qsj': {
      'fr': '',
      'en': '',
    },
    'b8bgvnfs': {
      'fr': '',
      'en': '',
    },
    '3gf6h77j': {
      'fr': '',
      'en': '',
    },
    'vfjkc9d7': {
      'fr': '',
      'en': '',
    },
    'mgyor9i8': {
      'fr': '',
      'en': '',
    },
    '5czlz6nt': {
      'fr': '',
      'en': '',
    },
    't4wjd42b': {
      'fr': '',
      'en': '',
    },
    'fngtbarw': {
      'fr': '',
      'en': '',
    },
    'ap2g3mj4': {
      'fr': '',
      'en': '',
    },
    'k3w72hsl': {
      'fr': '',
      'en': '',
    },
    'jaw8eymo': {
      'fr': '',
      'en': '',
    },
    '14jvho60': {
      'fr': '',
      'en': '',
    },
    'wg0tqotb': {
      'fr': '',
      'en': '',
    },
    'j72gyi7h': {
      'fr': '',
      'en': '',
    },
    '8ary7dbh': {
      'fr': '',
      'en': '',
    },
    'yq3k8q3l': {
      'fr': '',
      'en': '',
    },
    'q62cjtc6': {
      'fr': '',
      'en': '',
    },
    '2gpfd8h2': {
      'fr': '',
      'en': '',
    },
    'swet4ai8': {
      'fr': '',
      'en': '',
    },
    'vnji0evy': {
      'fr': '',
      'en': '',
    },
    'pfjl30zv': {
      'fr': '',
      'en': '',
    },
    'v105y5bh': {
      'fr': '',
      'en': '',
    },
    'x1x27dtm': {
      'fr': '',
      'en': '',
    },
    'z3ro0yyf': {
      'fr': '',
      'en': '',
    },
    'h7r8a2fj': {
      'fr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
