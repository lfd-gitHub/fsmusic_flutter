class FormValidationError {
  final String msg;
  FormValidationError._(this.msg);

  static final FormValidationError partValidated = FormValidationError._("");
  static final FormValidationError usernameEmpty = FormValidationError._("用户名不能为空");
  static final FormValidationError passwordEmpty = FormValidationError._("密码不能为空");
  static final FormValidationError passwordLengthLess6 = FormValidationError._("密码长度小于6位");

  String? isAndMsg(List<FormValidationError> targets) => targets.contains(this) ? msg : null;

  static FormValidationError? validatePassword(ValidateSOrNot password) {
    if (password.needValidate) {
      if (password.value.isEmpty) return passwordEmpty;
      if (password.value.length < 6) return passwordLengthLess6;
      return null;
    }
    return partValidated;
  }

  static FormValidationError? validateUsername(ValidateSOrNot username) {
    if (username.needValidate) {
      if (username.value.isEmpty) return usernameEmpty;
      return null;
    }
    return partValidated;
  }

  @override
  String toString() => 'FormValidationError(msg: $msg)';
}

class ValidateSOrNot {
  final bool needValidate;
  final String value;

  const ValidateSOrNot(this.value, {this.needValidate = false});

  static ValidateSOrNot pure() => const ValidateSOrNot("");
}
