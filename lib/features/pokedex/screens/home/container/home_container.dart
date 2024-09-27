import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom/error/failure.dart';
import 'package:flutter_application_1/commom/models/pokemon.dart';
import 'package:flutter_application_1/commom/models/repository/pokemon_repo.dart';
import 'package:flutter_application_1/commom/widgets/error.dart';
import 'package:flutter_application_1/commom/widgets/loading.dart';
import 'package:flutter_application_1/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutter_application_1/features/pokedex/screens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.repo, required this.onItemTap});
  final IPokemonRepo repo;
  final Function(String, DetailArguments) onItemTap;

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
            return HomePage(list: snapshot.data!, onItemTap: onItemTap);
          }

          if (snapshot.hasError) {
            return ErrorPo(error: (snapshot.error as Failure).message!);
          }

          return Container();
        });
  }
}
