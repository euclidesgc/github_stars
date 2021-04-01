import 'package:flutter/material.dart';
import 'package:github_stars/modules/home/home_controller.dart';
import 'package:github_stars/modules/home/models/user_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String query = '''
      {
        user(login: "Euclidesgc") {
          name
          login
          avatarUrl
          bio
          location
          email
          url
          starredRepositories{
            nodes{
              name
              description
              url
            }
          }
        }
      }
    ''';

    return Scaffold(
      appBar: AppBar(
        title: Text("Github Stars campo de pe"),
        centerTitle: true,
      ),
      body: Query(
          options: QueryOptions(
            documentNode: gql(query),
          ),
          builder: (
            QueryResult result, {
            Refetch refetch,
            FetchMore fetchMore,
          }) {
            if (result.data == null) {
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
                    TitleHeader(),
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

class TitleHeader extends StatelessWidget {
  const TitleHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "Repositórios favoritos",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key key,
    @required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    child: Image.network(user.avatarUrl),
                    minRadius: 20,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nome: ${user.name}"),
                        Text("Login: ${user.login}"),
                        Text("URL: ${user.url}"),
                        Text("Localidade: ${user.location}"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text("Bio: ${user.bio}"),
          ],
        ),
      ),
    );
  }
}
