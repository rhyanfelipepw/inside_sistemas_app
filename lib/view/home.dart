import 'package:flutter/material.dart';
import 'package:inside_sistemas_teste_app/controller/home_controller.dart';
import 'package:inside_sistemas_teste_app/util/constants.dart';
import 'package:inside_sistemas_teste_app/view/widgets/card_post.dart';
import 'package:inside_sistemas_teste_app/view/widgets/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>().fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColorApp,
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon:  Icon(Icons.menu, size: 30, color: Constants.secondColorApp,), // Ícone do menu (hamburguer)
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      backgroundColor: Constants.mainColorApp,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Consumer<HomeController>(
          builder: (context, homeController, child) {
            if (homeController.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (homeController.errorMessage != null) {
              return Center(
                  child: Text('Erro: ${homeController.errorMessage}'));
            }

            return ListView.builder(
              itemCount: homeController.listPosts.length,
              itemBuilder: (context, index) {
                return CardPost(
                  post: homeController.listPosts[index],
                );
              },
            );
          },
        ),
      ),
      drawer: DrawerApp()
    );
  }
}
