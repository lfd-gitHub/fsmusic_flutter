import 'package:formz/formz.dart';

abstract class BaseState {
  final UIStatus uiStatus;

  const BaseState({this.uiStatus = UIStatus.initial});
}

enum UIStatus { initial, loading, success, failure, empty }

class FetchState<T> extends BaseState {
  final List<T>? datas;
  const FetchState({this.datas, UIStatus uiStatus = UIStatus.initial}) : super(uiStatus: uiStatus);
}

class DefaultState extends BaseState {
  const DefaultState({UIStatus uiStatus = UIStatus.initial}) : super(uiStatus: uiStatus);
}

abstract class BaseFormState<T> extends BaseState {
  final T formValidate;
  final FormzStatus formState;

  const BaseFormState({required this.formValidate, required this.formState}) : super(uiStatus: UIStatus.initial);
}
