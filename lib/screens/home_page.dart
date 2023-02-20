import 'package:block_demo/blocs/internet_bloc/internet_bloc.dart';
import 'package:block_demo/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetGainedState) {
                return Text('Connected!');
              } else if (state is InternetLostState) {
                return Text('Not Connected!');
              } else {
                return Text('Loading');
              }
            },
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Internet Connected'),
                  backgroundColor: Colors.greenAccent,
                ));
              } else if (state is InternetLostState) {
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
