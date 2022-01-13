import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:formz/formz.dart';
import 'package:fsmusic_flutter/pages/basic/base_state.dart';
import 'package:fsmusic_flutter/pages/login/model/login_form_info.dart';

part 'login_form_state.g.dart';

@CopyWith()
class LoginFormState extends BaseFormState<LoginFormValidate> {
  const LoginFormState({
    LoginFormValidate formValidate = const LoginFormValidate.pure(),
    FormzStatus formState = FormzStatus.pure,
  }) : super(formValidate: formValidate, formState: formState);
}
