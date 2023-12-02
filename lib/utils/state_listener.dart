import 'dart:developer';

import 'package:flutter/material.dart';

class StateListener<T> extends StatelessWidget {
  final Stream<T> listener;
  final Widget Function(BuildContext, T value) builder;
  const StateListener({
    super.key,
    required this.listener,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: listener,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(context, snapshot.data as T);
        } else {
          log('Here!');
          return const SizedBox.shrink();
        }
      },
    );
  }
}
