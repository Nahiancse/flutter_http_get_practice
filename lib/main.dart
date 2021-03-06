import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_flutter/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HttpScreen(),
    );
  }
}

class HttpScreen extends StatelessWidget {
  const HttpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Student>(
          future: getStudent(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              final student = snapshot.data;
              return Text('your name is ${student?.firstName}\n your id is ${student?.lastName}');

            }else if(snapshot.hasError){

              return Text(snapshot.error.toString());

            }
            return CircularProgressIndicator();
          }),
      ),
      
    );
  }
}






Future<Student> getStudent()async{
  final url=Uri.parse('https://reqres.in/api/users/2') ;
  final response =await http.get(url);
  if(response.statusCode ==200){
    final jsonStudent = jsonDecode(response.body);

  return Student.fromJson(jsonStudent);

  }else{
    throw Exception();
  }

  
}