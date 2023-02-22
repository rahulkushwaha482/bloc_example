import 'package:api_call/data/repositories/post_repositories.dart';
import 'package:api_call/logic/cubit/post_cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/post_model.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoading()) {
    fetchPost();
  }

  PostRepository postRepository = PostRepository();

  void fetchPost() async {
    try {
      List<Post> posts = await postRepository.fetchPost();
      emit(PostResponse(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
