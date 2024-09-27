import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom/error/failure.dart';
import 'package:flutter_application_1/commom/models/pokemon.dart';
import 'package:flutter_application_1/commom/models/repository/pokemon_repo.dart';
import 'package:flutter_application_1/commom/widgets/error.dart';
import 'package:flutter_application_1/commom/widgets/loading.dart';
import 'package:flutter_application_1/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments {
  DetailArguments({required this.pokemon});
  final Pokemon pokemon;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {super.key, required this.repo, required this.arguments});
  final IPokemonRepo repo;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repo.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailPage(pokemon: arguments.pokemon, list: snapshot.data!);
          }

          if (snapshot.hasError) {
            return ErrorPo(error: (snapshot.error as Failure).message!);
          }

          return Container();
        });
  }
}
