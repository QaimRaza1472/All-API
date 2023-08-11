import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:testing/PathProvider/testing_store.dart';


/*class CounterStorage {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    print("----------------Directory File--------------");
    print(File('$path/counter.txt'));
    print("----------------Directory File--------------");
    return File('$path/counter.txt');
  }


  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      // Read the file
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }


  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$counter');
  }
}*/


class FlutterDemo extends StatefulWidget {
  const FlutterDemo({super.key, required this.storage});
  final CounterStorage storage;

  @override
  State<FlutterDemo> createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {

  int _counter = 0;
  
  List<dynamic>  name =[
    "Muntzer Mehdi",
    "Waseem Aown",
    "Qaim Raza",
    "Shoaib Raza",
    "Uzari Abbas",
    "Adnan Abbas",
    "Aown Hassan",
    "Dr.Ammar Yasir",
    "Arif Mahmood",
  ];


  @override
  void initState() {
    super.initState();
    widget.storage.writeData(name);
    widget.storage.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });

    widget.storage.readData().then((value)  {
      setState(() {

        print("----------Init State value for List -------- ${value}");
        name =  value;
        print("----------Init State value for List2 -------- ${name}");
      });
    });
  }


  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });
    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Reading and Writing Files'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Wrap(
                  direction: Axis.vertical,
                  children:List.generate(
                      name.length,
                          (index) =>
                              Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 70,
                              color: Colors.black,
                              child: Center(
                                child: Text(
                                  name[index].toString(),
                                  style: const TextStyle(
                                      fontSize: 22,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ), ),
                ),
              ),
              const SizedBox(height: 12,),
              Text(
                'Button tapped $_counter time${_counter == 1 ||_counter == 0 ? '' : 's'}.',
                style: const TextStyle(
                    fontSize: 16
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
