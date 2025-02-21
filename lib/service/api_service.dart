import 'package:dio/dio.dart';
import 'package:inside_sistemas_teste_app/model/post_model.dart';
import 'package:inside_sistemas_teste_app/util/constants.dart';


class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constants.url,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await _dio.get("/posts");
      if (response.data is List) {
        // Utilizarei apenas os 5 primeiros pra facilitar a visualização da função de cadastro em banco 
        return (response.data as List)
            .take(5)
            .map((json) => Post.fromJson(json))
            .toList();
      } else {
        throw Exception('Formato de resposta inesperado');
      }
    } catch (error) {
      rethrow;
    }
  }

   Future<bool> savePosts(Post post) async {
     try {
      final response = await _dio.post(
        '/posts',
        data: {
          'title': post.title,
          'body': post.description,
          'userId': 1, // Pode ser qualquer valor, o jsonplaceholder não valida isso
        },
      );

      return true;
    } catch (error) {
      return false;
    }
  }
}
