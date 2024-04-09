import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super('English');

  void toggleLanguage(currentLanguage) {
    if (currentLanguage == 'Sinhala') {
      state = 'Sinhala';
    }
    if (currentLanguage == 'English') {
      state = 'English';
    }
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, String>(
  (ref) => LanguageNotifier(),
);
