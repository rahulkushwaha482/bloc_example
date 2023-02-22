abstract class ThemeState {}


class ThemeDark extends ThemeState {
  String message;
  ThemeDark(this.message);
}

class ThemeLight extends ThemeState {
  String message;
  ThemeLight(this.message);
}
