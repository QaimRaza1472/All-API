import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Model/data_model.dart';
import 'model.dart';


Future<DataModel> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://randomuser.me/api/?results=15'));
  // print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    //final data=jsonDecode(response.body);
    //return dataModelFromJson(jsonDecode(response.body));
    return DataModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class MyApp3 extends StatefulWidget {
  const MyApp3({super.key});
  @override
  State<MyApp3> createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {
  Future<DataModel>? futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum =  fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<DataModel>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Wrap(
                direction:Axis.vertical,
                children: List.generate(
                  snapshot.data!.results!.length,
                      (index) {
                    var data= snapshot.data!.results![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.lightGreen
                        ),
                        child: Text(
                          data.name.last,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }  else if (snapshot.hasError){
              return Text('${snapshot.error}',
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

