import 'package:flutter/material.dart';
import 'package:inside_sistemas_teste_app/controller/home_controller.dart';
import 'package:inside_sistemas_teste_app/service/api_service.dart';
import 'package:inside_sistemas_teste_app/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiService>(create: (_) => ApiService()), // ApiService fornecido
        ChangeNotifierProvider(create: (context) => HomeController(Provider.of<ApiService>(context, listen: false))), // HomeController com ApiService
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inside sistemas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}