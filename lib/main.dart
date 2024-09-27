import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom/models/repository/pokemon_repo.dart';
import 'package:flutter_application_1/features/pokedex/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PokeTest',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: PokedexRoute(repo: PokemonRepo(dio: Dio())));
  }
}
