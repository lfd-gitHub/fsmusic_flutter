import 'dart:developer';

import 'package:fsmusic_flutter/config/cfg.dart';

class FLog {
  static d([m1, m2, Object? error, StackTrace? stackTrace]) {
    if (!isDebug) return;
    const filter = ["RUtils"];
    if (filter.contains(m1)) return;
    if (m2 == null) {
      log("$m1");
      return;
    }
    log(m2, name: m1, error: error, stackTrace: stackTrace);
  }
}
