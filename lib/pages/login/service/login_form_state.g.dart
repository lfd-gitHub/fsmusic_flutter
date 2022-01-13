// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_form_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginFormStateCWProxy {
  LoginFormState formState(FormzStatus formState);

  LoginFormState formValidate(LoginFormValidate formValidate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginFormState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginFormState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginFormState call({
    FormzStatus? formState,
    LoginFormValidate? formValidate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginFormState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginFormState.copyWith.fieldName(...)`
class _$LoginFormStateCWProxyImpl implements _$LoginFormStateCWProxy {
  final LoginFormState _value;

  const _$LoginFormStateCWProxyImpl(this._value);

  @override
  LoginFormState formState(FormzStatus formState) => this(formState: formState);

  @override
  LoginFormState formValidate(LoginFormValidate formValidate) =>
      this(formValidate: formValidate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginFormState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginFormState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginFormState call({
    Object? formState = const $CopyWithPlaceholder(),
    Object? formValidate = const $CopyWithPlaceholder(),
  }) {
    return LoginFormState(
      formState: formState == const $CopyWithPlaceholder()
          ? _value.formState
          // ignore: cast_nullable_to_non_nullable
          : formState as FormzStatus,
      formValidate: formValidate == const $CopyWithPlaceholder()
          ? _value.formValidate
          // ignore: cast_nullable_to_non_nullable
          : formValidate as LoginFormValidate,
    );
  }
}

extension $LoginFormStateCopyWith on LoginFormState {
  /// Returns a callable class that can be used as follows: `instanceOfclass LoginFormState extends BaseFormState<LoginFormValidate>.name.copyWith(...)` or like so:`instanceOfclass LoginFormState extends BaseFormState<LoginFormValidate>.name.copyWith.fieldName(...)`.
  _$LoginFormStateCWProxy get copyWith => _$LoginFormStateCWProxyImpl(this);
}
