import 'package:counter_app/cubit/second_cubit.dart';
import 'package:counter_app/cubit/third_cubit.dart';
import 'package:counter_app/screens/first_screen.dart';
import 'package:counter_app/screens/second_screen.dart';
import 'package:counter_app/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/first_cubit.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/first":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => FirstCubit(),
                  child: FirstScreen(),
                ));

      case "/second":
        var argument = settings.arguments as Map<String,dynamic>;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SecondCubit(),
                  child: SecondScreen(title: argument['title'],),
                ));

      case "/third":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ThirdCubit(),
                  child: ThirdScreen(),
                ));
    }
  }
}
