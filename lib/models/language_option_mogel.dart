class LanguageOptionMogel {
  final String code;
  final String name;

  LanguageOptionMogel({required this.code, required this.name});
  static List<LanguageOptionMogel> options = [
        LanguageOptionMogel(code: 'en', name: 'English 🇺🇸'),
        LanguageOptionMogel(code: 'ar', name: 'العربية 🇪🇬'),
      ];
}
