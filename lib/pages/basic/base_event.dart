abstract class BaseEvent {
  const BaseEvent();
}

class DefaultEvent extends BaseEvent {
  const DefaultEvent();
}

class FetchEvent extends BaseEvent {
  const FetchEvent();
}

class FormEvent extends BaseEvent {
  const FormEvent();
}

class ValueChangedEvent<T> extends FormEvent {
  final T value;
  const ValueChangedEvent(this.value);
}

class SubmitEvent extends FormEvent {
  const SubmitEvent();
}
