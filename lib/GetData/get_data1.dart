import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp1 extends StatefulWidget {
  const MyApp1({super.key});

  @override
  State<MyApp1> createState() => _MyApp1State();
}

List<dynamic> users = [];

class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Rest Api Call'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: fetchUsers,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: Image.network(
                    users[index]['picture']['thumbnail'],
                  ),
                ),
                title: Text(
                  users[index]['name']['first'],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            );
          }),
    );
  }

  void fetchUsers() async {
    print("Fetch User called");
    final url = Uri.parse("https://randomuser.me/api/?results=15");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      setState(() {
        users = json['results'];
      });
      print(response.body);
      print('fetchUsers completed');
    } else {
      throw Exception('Failed to load albums');
    }
  }
}
