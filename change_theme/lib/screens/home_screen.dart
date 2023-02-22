import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme_cubit.dart';
import '../cubit/theme_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {

            if(state is ThemeDark){
              return Text(state.message);
            }else if(state is ThemeLight){
              return Text( state.message);
            }else{
              return Text('Normal Theme');
            }

          },
        ),
      ),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Center(
            child: ElevatedButton.icon(
                onPressed: () {
                  BlocProvider.of<ThemeCubit>(context).changeTheme();
                },
                icon: Icon(Icons.light_mode),
                label: Text('Chnage Theme')),
          );
        },
      ),
    );
  }
}
