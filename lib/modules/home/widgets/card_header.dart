import 'package:flutter/material.dart';
import 'package:github_stars/modules/home/models/user_model.dart';

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
            SizedBox(height: 8),
            Text("Bio: ${user.bio}"),
          ],
        ),
      ),
    );
  }
}
