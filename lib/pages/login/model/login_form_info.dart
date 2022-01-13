import 'package:formz/formz.dart';
import 'package:fsmusic_flutter/pages/basic/base_validate_error.dart';
import 'package:fsmusic_flutter/utils/fsm_log.dart';

class LoginFormInfo {
  final ValidateSOrNot username;
  final ValidateSOrNot password;

  const LoginFormInfo(this.username, this.password);

  bool allNeedValidate() => username.needValidate && password.needValidate;
}

class LoginFormValidate extends FormzInput<LoginFormInfo, FormValidationError> {
  const LoginFormValidate.pure() : super.pure(const LoginFormInfo(ValidateSOrNot(""), ValidateSOrNot("")));
  const LoginFormValidate.dirty([
    LoginFormInfo formInfo = const LoginFormInfo(ValidateSOrNot(""), ValidateSOrNot("")),
  ]) : super.dirty(formInfo);

  @override
  FormValidationError? validator(LoginFormInfo value) {
    var error = FormValidationError.validateUsername(value.username);
    error = error ?? FormValidationError.validatePassword(value.password);
    FLog.d("validate", "$error");
    return error;
  }
}
