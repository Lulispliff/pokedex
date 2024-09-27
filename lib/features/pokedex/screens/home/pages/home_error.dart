import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  const HomeError({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(errorMessage),
      ),
    );
  }
}
