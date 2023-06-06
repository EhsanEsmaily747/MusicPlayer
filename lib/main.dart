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
        scaffoldBackgroundColor:  Color(0xFF52524F)
      ),
      home:Scaffold(
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 145.0,
                  ),
                    Text(
                              'Music Player',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inika'
                              ),
                              
                  ),
                  SizedBox(
                    width: 130.0,
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: Icon(
                      Icons.menu_sharp,
                    
                      color: Colors.white,
                      size: 30.0,
                    
                    ),
                  )
                ],
              ),
            ],
          )
        ),
                      
                  
          
      )
    );
  }
}
