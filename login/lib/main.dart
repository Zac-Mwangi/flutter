import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {


  final _email = TextEditingController();
  final _password = TextEditingController();


  Future<Response?> login() async {
    var dio = Dio();
    try {
      var response = await dio.post('http://192.168.0.157:8000/api/login',
          data: {
            "email":  _email.text,
            "password":  _password.text,
          },
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

        String json = response.data.toString();
         print(json);
          return response;
    } catch (e) {
        print(e.toString());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 35,
                color: Colors.teal,
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Form(child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "Enter Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder()
                        ),
                      onChanged: (String value){

                      },
                      validator: (value){
                        return value!.isEmpty?'Please Enter Email':null;
                      },

                    ),
                  ),

                  const SizedBox(height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: _password,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "Enter password",
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder()
                      ),
                      onChanged: (String value){

                      },
                      validator: (value){
                        return value!.isEmpty?'Please Enter Password':null;
                      },
                    ),
                  ),

                  SizedBox(height: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: MaterialButton(
                      onPressed: (){
                        login();
                      },
                      child: Text('Login'),
                      color: Colors.teal,
                      textColor:Colors.white,
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
