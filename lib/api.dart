import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  // const Api({ Key? key }) : super(key: key);

  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {
  getUser() async {
    List users = [];
    dynamic response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', '/users'));
    dynamic jsonData = jsonDecode(response.body);

    for (var i in jsonData) {
      UserModel user = UserModel(i['name'], i['username'], i['email']);
      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Text("Nothing in Api"),
            );
          } else if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(snapshot.data[i].name),
                  subtitle: Text(snapshot.data[i].email),
                  //  title: Text("ok"),
                );
              },
            );
          } else {
            return Container(
              child: Text("Loading..."),
            );
          }
        },
      ),
    );
  }
}

class UserModel {
  String name;
  String username;
  String email;

  UserModel(this.name, this.username, this.email);
}
