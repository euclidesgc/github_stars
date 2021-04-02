import 'package:flutter/material.dart';
import 'package:github_stars/modules/home/models/user_model.dart';
import 'package:github_stars/modules/utils/debouncer.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'widgets/card_header.dart';
import 'widgets/title_header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _debouncer = Debouncer(milliseconds: 300);

  String busca;

  final String query = '''
      query ReadRepositories(\$nText: String!) {
        user(login: \$nText) {
          name
          login
          avatarUrl
          bio
          location
          email
          url
          starredRepositories {
            nodes {
              name
              description
              url
            }
          }
        }
      }      
    ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Pesquisar...",
            hintStyle: TextStyle(color: Colors.white),
          ),
          onChanged: (value) {
            _debouncer.run(
              () => setState(
                () => busca = value,
              ),
            );
          },
        ),
        centerTitle: true,
      ),
      body: Query(
          options: QueryOptions(
            document: gql(query),
            variables: {'nText': "$busca"},
          ),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              return Center(child: Text("Não localizado!"));
            }

            if (result.isLoading || result.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              UserModel user = UserModel.fromMap(result.data["user"]);

              return SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardHeader(user: user),
                    TitleHeader(
                      qtdRepositories: user.starredRepositories.nodes.length,
                    ),
                    ListView.builder(
                      itemCount: user.starredRepositories.nodes.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(8),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.starredRepositories.nodes[index].name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(user.starredRepositories.nodes[index].url,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.blueAccent)),
                                Text(
                                    user.starredRepositories.nodes[index]
                                        .description,
                                    style: TextStyle(fontSize: 11)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
