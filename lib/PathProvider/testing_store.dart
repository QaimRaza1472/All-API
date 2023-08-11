import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


/*
class CounterStorage{
  Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localFile async{
    final path = await _localPath;
    return File("$path/counter.text");
  }


  Future<File>  writeCounter(int counter)async{
    final file=await _localFile;
    return file.writeAsString('$counter');
  }

  Future<int> readCounter()async{

    try{
      final file =await _localFile;

      final contents=await file.readAsString();
      return int.parse(contents);

    } catch(e){
      return 0;
    }
  }
}*/


///////////////////////////

/*
class CounterStorage {
  Future<String> get _localPath async {
    final directory=await getApplicationDocumentsDirectory();
    print("-----Local Path-------");
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async{
    final path =await _localPath;
    print("-----File-------");
    print(File("$path/counter.text"));
    return File("$path/counter.text");
  }

  Future<File> writeCounter(int count) async{
    final file = await _localFile;
    print("--------Count Value -----------${count}");
    return file.writeAsString('$count');
  }

  Future<int> readCounter()async{
   try {
     final file= await _localFile;
     final contents=await file.readAsString();
     return int.parse(contents);
   }catch (e){
     return 0;
   }
  }
}
*/




class CounterStorage{

  Future<String> get _localPath async {
   final directory = await getApplicationDocumentsDirectory();
   return directory.path;
 }



 Future<File> get _localFile async {
   final path = await _localPath;
   return File("$path/counter.text");
 }

 Future<File> writeCounter(int counter) async{
   final file = await _localFile;
   return file.writeAsString('$counter');
 }

 Future<int> readCounter()async{
   try{
     final file = await _localFile;
     final contents = await file.readAsString();
     return int.parse(contents);
   }
   catch (e){
     return 0;
   }
 }


 Future<File> get _localFile2 async {
   final path = await _localPath;
   return File("$path/data.text");
 }

 Future<File> writeData(List<dynamic> name) async {
   final file = await _localFile2;
   //return.file.
   return file.writeAsString(jsonEncode(name));
 }


 Future<List<dynamic>> readData()async{
   try{
     final file    = await _localFile2;
     final contents = await file.readAsString();
     final jsonList = json.decode(contents);
     return jsonList;
   }
   catch (e){
     print('Error reading file: $e');

   }
   return ["sdfsd"];
 }

}









