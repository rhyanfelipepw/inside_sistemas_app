import 'dart:convert';

import 'package:inside_sistemas_teste_app/model/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBaseService{
   static Future<void> savePosts(List<Post> posts) async {
    final prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> postsJson = posts.map((post) => post.toJson()).toList();
    String encodedPosts = json.encode(postsJson);
    await prefs.setString('posts', encodedPosts);
  }

  static Future<List<Post>> getPosts() async {
    final prefs = await SharedPreferences.getInstance();
    String? encodedPosts = prefs.getString('posts');
    if (encodedPosts != null) {
      List<dynamic> decodedPosts = json.decode(encodedPosts);
      List<Post> posts = decodedPosts.map((json) => Post.fromJson(json)).toList();
      return posts;
    }
    return [];
  }
}
