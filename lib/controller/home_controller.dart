import 'package:flutter/material.dart';
import 'package:inside_sistemas_teste_app/model/post_model.dart';
import 'package:inside_sistemas_teste_app/service/api_service.dart';
import 'package:inside_sistemas_teste_app/service/database_service.dart';
import 'package:inside_sistemas_teste_app/view/widgets/card_create.dart';

class HomeController extends ChangeNotifier {
  final ApiService _apiService;
  List<Post> listPosts = [];
  bool isLoading = false;
  String? errorMessage;
  HomeController(this._apiService);

  void fetchPosts() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      listPosts = await DataBaseService.getPosts();
      if (listPosts.isEmpty) {
        listPosts = await _apiService.fetchPosts();
        await DataBaseService.savePosts(listPosts);
      }
    } catch (error) {
      errorMessage = error.toString(); // Captura o erro
    } finally {
      isLoading = false; // Finaliza o carregamento
      notifyListeners(); // Notifica novamente que o estado mudou (carregado ou erro)
    }
  }

  void createNewPost(BuildContext context) async {
    Post? post = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return PostDialog();
      },
    );
    if (post != null) {
      if (await _apiService.savePosts(post)) {
        listPosts.add(post);
        notifyListeners();
        await DataBaseService.savePosts(listPosts);
        Navigator.pop(context);
      }
    }
  }
}
