import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<Brightness> {
  ThemeCubit() : super(Brightness.light);

  void toggleMode() {
    if (state == Brightness.light) {
      emit(Brightness.dark);
    } else {
      emit(Brightness.light);
    }
  }
}
