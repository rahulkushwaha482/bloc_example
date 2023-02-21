import 'package:counter_app/cubit/first_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Screen'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/second",
                      arguments: {'title': 'dynamic Second Title'});
                },
                icon: Icon(Icons.arrow_forward)),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              BlocProvider.of<FirstCubit>(context).increment();
            },
            label: Icon(Icons.add)),
        body: Center(
          child: BlocBuilder<FirstCubit, int>(
            builder: (context, state) {
              return Text(
                state.toString(),
                style: TextStyle(fontSize: 15),
              );
            },
          ),
        ));
  }
}
