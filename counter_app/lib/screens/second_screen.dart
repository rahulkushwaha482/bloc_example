import 'package:counter_app/cubit/first_cubit.dart';
import 'package:counter_app/cubit/second_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatelessWidget {
  String title;
   SecondScreen({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/third");
              },
              icon: Icon(Icons.arrow_forward)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            BlocProvider.of<SecondCubit>(context).increment();
          },
          label: Icon(Icons.add)),
      body: Center(
        child: BlocBuilder<SecondCubit, int>(
          builder: (context, state) {
            return Text(state.toString());
          },
        ),
      ),
    );
  }
}
