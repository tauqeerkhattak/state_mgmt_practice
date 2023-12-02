import 'dart:async';

class BaseController<T> {
  T? _currentValue;
  final StreamController<T> _streamController = StreamController<T>();

  T get state {
    if (_currentValue == null) {
      throw Exception('controller has not been initialized');
    }
    return _currentValue!;
  }

  set state(T value) {
    _currentValue = value;
    _streamController.add(value);
  }

  Stream<T> get stream {
    return _streamController.stream;
  }
}
