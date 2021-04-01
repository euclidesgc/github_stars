
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AppWidget extends StatelessWidget {
  //Github token
  // 8b441e6903189dcd7f2f457eaea14e6bad5367a4
  final String personalAccessToken = "8b441e6903189dcd7f2f457eaea14e6bad5367a4";

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
        uri: "https://api.github.com/graphql",
        headers: {"authorization": "Bearer $personalAccessToken"});

    ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        // cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
        cache: InMemoryCache()
      ),
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
