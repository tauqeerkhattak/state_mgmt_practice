import 'dart:developer';

import 'base_controller.dart';

class Factory {
  static final List<dynamic> _controllers = <dynamic>[];
  static T read<T extends BaseController>(T Function() creator) {
    for (final controller in _controllers) {
      if (controller is T) {
        log('Controller found: ${controller.runtimeType}');
        return controller;
      }
    }
    final newController = creator();
    _controllers.add(newController);
    return newController;
  }
}

typedef ItemCreator<S> = S Function();
