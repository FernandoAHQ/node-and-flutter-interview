import 'package:flutter/material.dart';
import 'package:frontend/providers/articles_provider.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ArticlesProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NetForemost Flutter',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ));
  }
}
