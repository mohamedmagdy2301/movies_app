import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    log(bloc.toString());
  }

  @override
  void onCreate(BlocBase bloc) {
    log(bloc.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log(error.toString());
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log(event.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log(transition.toString());
  }
}
