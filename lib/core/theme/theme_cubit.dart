import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);

  void toggle() =>
      emit(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
}
