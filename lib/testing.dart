/*
import 'package:http/http.dart' as http;
class Album {
  final int id;
  final String title;

  const Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}


Future<Album> fetchAlbum(String title)async{
  final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'),
  headers: <String, String >{
    "Content-Type":"application/json;  ",
  }
  );
}



*/
