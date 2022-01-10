import 'dart:developer';

class FsmLog {
  static d([m1, m2]) {
    if (m2 == null) {
      log("$m1");
      return;
    }
    log("[$m1] $m2");
  }
}
