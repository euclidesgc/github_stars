import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final qtdRepositories;

  const TitleHeader({
    Key key,
    this.qtdRepositories = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "Repositórios favoritos: $qtdRepositories",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}