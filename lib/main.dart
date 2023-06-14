import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:ThemeData().copyWith(
        primaryColor: Color(0xFF52524F),
        scaffoldBackgroundColor:  Color(0xFF52524F),
      ),
      home:Scaffold(
      appBar: AppBar(
        
        titleTextStyle:TextStyle(
            fontFamily:'Inika',
            fontSize: 27.0,
        ),
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor:Color(0xFF52524F) ,
        title: Text('Music Player'),
        actions: [
          IconButton(
            onPressed: (){

          }, icon: Icon(Icons.menu_outlined))
        ],
      ),                
      )
    );
  }
}
