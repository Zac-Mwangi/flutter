import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MaterialApp(


  home: Scaffold(
    appBar: AppBar(
      title: const Text('Title'),
      centerTitle: true,
    ),
    body: const Center(
      child: Text('Hello World')
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        Fluttertoast.showToast(
          msg: "Floating Action Button",
        );
      },
      child: const Icon(Icons.add),
    ),
  ),
));



