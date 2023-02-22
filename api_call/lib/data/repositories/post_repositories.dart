import 'dart:math';

import 'package:api_call/data/model/post_model.dart';
import 'package:api_call/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepository {
  API api = API();

  Future<List<Post>> fetchPost() async {
    try {
      Response response = await api.sendRequest.get('/posts');
      List<dynamic> postmap = response.data;
     return   postmap.map((map) => Post.fromJson(map)).toList();


    } catch (ex) {
      throw ex;
    }
  }
}
