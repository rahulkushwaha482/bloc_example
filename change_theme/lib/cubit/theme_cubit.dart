

import 'package:change_theme/cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState>{

  ThemeCubit() :super(ThemeInitial());

  bool _isDark =false;

  void changeTheme(){

    _isDark = !_isDark;
    emit(ThemeFinal());
  }

  bool get isDark => _isDark;


}