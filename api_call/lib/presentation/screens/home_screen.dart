import 'package:api_call/data/model/post_model.dart';
import 'package:api_call/logic/cubit/post_cubit/post_cubit.dart';
import 'package:api_call/logic/cubit/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Request API'),
        ),
        body: SafeArea(
          child: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              if (state is PostLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PostResponse) {
                return buildPostListView(state.posts);
              }

              return Center(
                child: Text('Error occured'),
              );
            },
          ),
        ));
  }

  Widget buildPostListView(List<Post> posts){
   return  ListView.builder(
      physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(posts[index].title.toString()),
        );
      },
    );

  }
}
