import 'package:counter_app/cubit/third_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/second");
            },
            icon: Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            BlocProvider.of<ThirdCubit>(context).increment();
          }, label: const Icon(Icons.add)),
      body: Center(
        child: BlocBuilder<ThirdCubit, int>(
            builder: (context, state) {
              return Text(state.toString());
            }
        ),
      ),
    );
  }
}
