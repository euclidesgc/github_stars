import 'package:flutter/material.dart';
import 'package:github_stars/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Stars"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Text("Página 1")],
        ),
      ),
    );
  }
}
