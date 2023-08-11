import 'package:flutter/material.dart';
import 'GetData/get_data.dart';

import 'GetData/get_data1.dart';
import 'GetData/get_data_by_model.dart';
import 'PathProvider/read_and_write.dart';
import 'PathProvider/testing_store.dart';


void main() {
  runApp(
     const MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Reading and Writing Files',

      //home: FlutterDemo(storage: CounterStorage()),
       home: MyApp(),
       //home: AlbumScreen(),
         //home: MyApp1(),


       //home: MyApp3(),

     ),
  );
}




