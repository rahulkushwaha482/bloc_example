import 'package:change_theme/cubit/theme_cubit.dart';
import 'package:change_theme/cubit/theme_state.dart';
import 'package:change_theme/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(NewClass());
}

class NewClass extends StatelessWidget {
  const NewClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ThemeCubit>(create: (context) => ThemeCubit())
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeCubit cubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    bool isDark = cubit.isDark;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: HomePage(),
    );
  }
}
