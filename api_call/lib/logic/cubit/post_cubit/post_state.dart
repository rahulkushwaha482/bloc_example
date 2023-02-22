import '../../../data/model/post_model.dart';

abstract class PostState {}

class PostResponse extends PostState {
  final List<Post> posts;

  PostResponse(this.posts);
}

class PostLoading extends PostState {}

class PostError extends PostState {
  final String error;

  PostError(this.error);
}
