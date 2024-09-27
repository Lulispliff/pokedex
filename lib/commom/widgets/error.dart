import 'package:flutter/material.dart';

class ErrorPo extends StatelessWidget {
  const ErrorPo({Key? key, this.error}) : super(key: key);
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error ?? 'Não foi possível carregar os dados'),
      ),
    );
  }
}
