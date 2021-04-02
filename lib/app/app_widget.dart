import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Obtendo o token de uma variável de ambiente
    final String personalAccessToken = env['GIT_TOKEN'];

    final HttpLink httpLink = HttpLink(
      "https://api.github.com/graphql",
    );

    final AuthLink authlink = AuthLink(
      getToken: () async => 'Bearer $personalAccessToken',
    );

    final Link link = authlink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(link: link, cache: GraphQLCache()),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: "Github Stars",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        navigatorKey: Modular.navigatorKey,
        onGenerateRoute: Modular.generateRoute,
      ),
    );
  }
}
