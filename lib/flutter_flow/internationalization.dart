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
    'fbvat1ar': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Login
  {
    'w321lyq6': {
      'fr': '@Trap',
      'en': '',
    },
    'jhqhmbi9': {
      'fr': 'connexion',
      'en': 'Log In',
    },
    '6t7d1wfh': {
      'fr': 'Bon retour',
      'en': 'Welcome Back',
    },
    'olia1d87': {
      'fr': 'Remplissez les informations ci-dessous',
      'en': 'Fill out the information below in order to access your account.',
    },
    'b1tskjih': {
      'fr': 'Email',
      'en': '',
    },
    'h407hzqq': {
      'fr': 'mot de passe',
      'en': 'Password',
    },
    'l5igptiy': {
      'fr': 'Field is required',
      'en': 'Field is required',
    },
    '95t2f286': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wsv0hwyj': {
      'fr': 'Champs requis',
      'en': 'Field is required',
    },
    'ltuh3xs0': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'exhhh0ih': {
      'fr': ' Enregistre toi',
      'en': 'Sign In',
    },
    '6lgza26z': {
      'fr': 'FlutterFlow',
      'en': '',
    },
    'zz48dhfe': {
      'fr': ' - Build Different',
      'en': '',
    },
    'w9qeahip': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Registerpage
  {
    'j2b7ysku': {
      'fr': 'Create Account',
      'en': '',
    },
    'vjvmlkey': {
      'fr': 'Créer un compte',
      'en': '',
    },
    'n1xhhrrv': {
      'fr': 'Remplissez le formulaire ci-dessous',
      'en': '',
    },
    'x0l6umog': {
      'fr': 'Email',
      'en': '',
    },
    'wzci4gd3': {
      'fr': 'Password',
      'en': '',
    },
    'qcqdiw80': {
      'fr': 'C\'est parti',
      'en': 'Get Started',
    },
    'rbioj0le': {
      'fr': 'FlutterFlow',
      'en': '',
    },
    'khqfzf79': {
      'fr': ' - connecte toi',
      'en': '',
    },
    'ytg73jzm': {
      'fr': 'Champ requis',
      'en': 'Required field',
    },
    'bppg2whz': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'no14dghw': {
      'fr': 'Champ requis',
      'en': 'Required field',
    },
    'mj21uu5v': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'y4oqw8ph': {
      'fr': 'Home',
      'en': '',
    },
  },
  // settingpage
  {
    'h70uo0cj': {
      'fr': 'Settings Page',
      'en': '',
    },
    'mi6bo4ck': {
      'fr': 'Please evaluate your options below.',
      'en': '',
    },
    'ondz3z2f': {
      'fr': 'My Subscription',
      'en': '',
    },
    '7cquqj7i': {
      'fr': 'Déconnexion',
      'en': 'Disconnect',
    },
    'rt3hc6z2': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'b8h5savs': {
      'fr': '',
      'en': '',
    },
    '8hxf976r': {
      'fr': '',
      'en': '',
    },
    'xxnp4o5w': {
      'fr': '',
      'en': '',
    },
    '1250xdj6': {
      'fr': '',
      'en': '',
    },
    'qzm6qep8': {
      'fr': '',
      'en': '',
    },
    'sf3qbb15': {
      'fr': '',
      'en': '',
    },
    'j0a0wmgn': {
      'fr': '',
      'en': '',
    },
    'c1u1lakj': {
      'fr': '',
      'en': '',
    },
    'ujis8bjt': {
      'fr': '',
      'en': '',
    },
    'sn8yt67q': {
      'fr': '',
      'en': '',
    },
    '7iywf4uq': {
      'fr': '',
      'en': '',
    },
    'tz807w0s': {
      'fr': '',
      'en': '',
    },
    '46z11s3u': {
      'fr': '',
      'en': '',
    },
    'jigqgni0': {
      'fr': '',
      'en': '',
    },
    'rgtj42p4': {
      'fr': '',
      'en': '',
    },
    'mqc93srj': {
      'fr': '',
      'en': '',
    },
    'pqxp0exr': {
      'fr': '',
      'en': '',
    },
    'kuubdpq9': {
      'fr': '',
      'en': '',
    },
    'jnvjkhku': {
      'fr': '',
      'en': '',
    },
    'zbw3oksq': {
      'fr': '',
      'en': '',
    },
    'gkzkwd4p': {
      'fr': '',
      'en': '',
    },
    '02ehlso4': {
      'fr': '',
      'en': '',
    },
    'xlbqkea3': {
      'fr': '',
      'en': '',
    },
    'i0a1yue7': {
      'fr': '',
      'en': '',
    },
    '13soy3f6': {
      'fr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
