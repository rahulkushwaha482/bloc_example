import 'package:change_theme/cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeLight('Theme is Light'));

  bool _isDark = false;

  void changeTheme() {
    _isDark = !_isDark;
    if (_isDark) {
      emit(ThemeDark('Theme is Dark!'));
    } else {
      emit(ThemeLight('Theme is Light!'));
    }
  }

  bool get isDark => _isDark;
}
