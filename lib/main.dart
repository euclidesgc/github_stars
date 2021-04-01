// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'app/app_module.dart';

Future main() async {
  await DotEnv.load(fileName: "./lib/.env");

  runApp(ModularApp(module: AppModule()));
}
