import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:fsmusic_flutter/pages/basic/base_event.dart';
import 'package:fsmusic_flutter/pages/basic/base_extension.dart';
import 'package:fsmusic_flutter/pages/basic/base_service.dart';
import 'package:fsmusic_flutter/pages/login/model/login_form_info.dart';
import 'package:fsmusic_flutter/pages/login/service/login_form_state.dart';
import 'package:fsmusic_flutter/repository/api/user/user_api.dart';
import 'package:fsmusic_flutter/routers/routes.dart';

class LoginService extends BaseService<FormEvent, LoginFormState> {
  LoginService({LoginFormState state = const LoginFormState()}) : super(state) {
    when<ValueChangedEvent<LoginFormInfo>>((event, emit) => _onValueChanged(event, emit));
    when<SubmitEvent>((event, emit) => _onLogin(event, emit));
  }

  void validateUserName(String username) {
    add(ValueChangedEvent(LoginFormInfo(username.toValidate(), state.formValidate.value.password)));
  }

  void validatePassword(String password) {
    add(ValueChangedEvent(LoginFormInfo(state.formValidate.value.username, password.toValidate())));
  }

  void _onValueChanged(ValueChangedEvent<LoginFormInfo> event, Emitter<LoginFormState> emit) {
    final dirty = LoginFormValidate.dirty(event.value);
    emit(state.copyWith(formValidate: dirty, formState: Formz.validate([dirty])));
  }

  void _onLogin(SubmitEvent event, Emitter<LoginFormState> emit) async {
    if (state.formState.isValidated) {
      emit(state.copyWith(formState: FormzStatus.submissionInProgress));
      var resp = await request(UserApi.loginByPwd(
        state.formValidate.value.username.value,
        state.formValidate.value.password.value,
      ));
      if (resp?.data?.token?.isNotEmpty == true) {
        //var token = resp!.data!.token;
        toast("登陆成功");
        Nav.pop();
      }

      // if (resp != null) {
      //   emit(state.copyWith(formState: FormzStatus.submissionSuccess));
      // } else {
      //   emit(state.copyWith(formState: FormzStatus.submissionFailure));
      // }

    }
  }
}
