import 'package:flutter/material.dart';
import 'package:flutter_application_1/commom/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.pokemon, required this.list});
  final Pokemon pokemon;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pokemon.name),
          backgroundColor: pokemon.baseColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: ListView(
                  children: list
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(top: 32),
                          ))
                      .toList(),
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          ),
        ));
  }
}
