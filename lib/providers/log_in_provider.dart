import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogTextNotifier extends StateNotifier<String> {
  LogTextNotifier() : super('Log In');

  void toggleLogText() {
    state = 'Log Out';
  }
}

final logTextProvider = StateNotifierProvider<LogTextNotifier, String>(
  (ref) => LogTextNotifier(),
);
