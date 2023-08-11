import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

/*
Future <List<dynamic>>? fetchAlbum() async{
  final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
   if(response.statusCode==200){
     List<dynamic> data=json.decode(response.body);
     print(data);
     return data;
   }else{
     throw('Failed to load Album');
   }
}
*/

Future<List<GetData>?> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  if (response.statusCode == 200) {
       print(response.body);
       final List<dynamic> data = json.decode(response.body);
       final List<GetData> albums = data.map((item) => GetData.fromJson(item)).toList();
       return albums;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


/*
Future<List<dynamic>> fetchAlbums() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    List<dynamic> data = json.decode(response.body);
    return data;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load albums');
  }
}

class AlbumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchAlbums(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<dynamic> albums = snapshot.data!;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(albums[index]['title']),
                  subtitle: Text('User ID: ${albums[index]['userId']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
*/


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<List<GetData>?>? futureAlbum;

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
        child: FutureBuilder<List<GetData>?>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 15),
               child: Container(
                  height: double.infinity,
                 width: double.infinity,
                // color: Colors.yellow,
                 child: ListView.builder(
                   itemCount: snapshot.data!.length,
                     itemBuilder: (BuildContext context, index){
                       return Padding(
                         padding: const EdgeInsets.fromLTRB(15.0,5,15,5),
                         child: Container(
                           height: 50,
                           decoration: const BoxDecoration(
                               color: Colors.lightGreen
                           ),
                           child: Center(
                             child: Text(
                               snapshot.data![index].title.toString(),
                               style: const TextStyle(
                                 color: Colors.black,
                                 fontSize: 16
                               ),
                             ),
                           ),
                         ),
                       );
                     },
                 ),
                ),
             );
            }  else if (snapshot.hasError) {
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

