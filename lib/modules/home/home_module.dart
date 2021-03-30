import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_stars/modules/home/home_controller.dart';
import 'package:github_stars/modules/home/home_repository.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeRepository()),
        Bind((i) => HomeController(repo: i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/',
            child: (_, args) => HomePage(controller: Modular.get())),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
