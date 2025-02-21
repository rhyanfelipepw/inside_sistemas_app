import 'package:flutter/material.dart';
import 'package:inside_sistemas_teste_app/controller/home_controller.dart';
import 'package:inside_sistemas_teste_app/util/constants.dart';
import 'package:provider/provider.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Constants.mainColorApp,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Rhyan Felipe Guarato'),
            accountEmail: Text('rhyan.guarato@hotmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Constants.mainColorApp,
              child: Image.asset('assets/images/logo.png', height: 20),
            ),
          ),
          ListTile(
            title: Text(
              'Criar postagem',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              context.read<HomeController>().createNewPost(context);
            },
            // Adicionando profundidade com a propriedade elevation
            selectedTileColor:
                Colors.grey[700], // Cor quando o item é selecionado
          ),
        ],
      ),
    );
  }
}
