
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/internet_cubit.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetStateNew>(
            builder: (context, state) {
              if (state ==  InternetStateNew.Gained) {
                return Text('Connected!');
              } else if (state  == InternetStateNew.Lost) {
                return Text('Not Connected!');
              } else {
                return Text('Loading');
              }
            },
            listener: (context, state) {
              if (state ==InternetStateNew.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Internet Connected'),
                  backgroundColor: Colors.greenAccent,
                ));
              } else if (state == InternetStateNew.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Internet Not Connected'),
                  backgroundColor: Colors.redAccent,
                ));
              }
            },
          ),
        ),
      ),
    );
  }
}
