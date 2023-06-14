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
        
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor:Color(0xFF52524F) ,
        title: Center(
          child: Text('Music Player',style: TextStyle(
            fontFamily: 'Inika-Bold',
            fontSize: 23.0
          ),),
        ),
      ),                
      )
    );
  }
}
