import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom/models/pokemon.dart';
import 'package:flutter_application_1/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutter_application_1/features/pokedex/screens/home/pages/widgets/pokemon_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.list, required this.onItemTap});
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text('Pokedex - by LuliPliff',
              style: TextStyle(color: Colors.black)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: list
              .map((e) => PokemonItem(pokemon: e, onTap: onItemTap))
              .toList(),
        ),
      ),
    );
  }
}
