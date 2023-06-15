
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';


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
      home:Musicdesign()
    );
  }
}

class Musicdesign extends StatefulWidget {
  
  @override
  State<Musicdesign> createState() => _MusicdesignState();
}

class _MusicdesignState extends State<Musicdesign> {
bool playing=false;
bool favorite=false;
bool voiceup=true;

AudioPlayer player=AudioPlayer();

AudioCache cache=AudioCache();

Duration position=Duration();

Duration musicLength=Duration();

Widget slider(){
  return Slider.adaptive(
    activeColor: Colors.grey,
    inactiveColor:Colors.white ,
    max: musicLength.inSeconds.toDouble(),
    value: position.inSeconds.toDouble(), 
    onChanged: (value){
      seek(value.toInt());
  });
}

void seek(int value){
  Duration newPosition=Duration(seconds: value);
  player.seek(newPosition);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        titleTextStyle:TextStyle(
            fontFamily:'Inika',
            fontSize: 27.0,
            fontWeight: FontWeight.bold
        ),
        centerTitle: true,
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor:Color(0xFF52524F) ,
        title: Text('Music Player'),
        actions: [
          IconButton(
            onPressed: (){
              showModalBottomSheet(
                context: context,
                 builder: (BuildContext context){
                  return Container(
                    height: 500.0,
                    child: Column(
                      children: [],
                    ),
                  );
                 },
                 showDragHandle: true,
                 backgroundColor: Color(0xFF52524F)
                 );
          }, icon: Icon(EvaIcons.menu)
          ,)
        ],
      ),       
      body: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          
          Text('Listen To Your Favorite Song Here',style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 16.0,
            // fontStyle: FontStyle.italic,
            fontFamily: 'Inika',
            

          ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Container(
              width: 240.0,
              height: 240.0,
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(140.0),
                image: DecorationImage(image: AssetImage('images/Dusk-Till-Dawn.jpg')),
                boxShadow: [
                  BoxShadow(
                    offset: Offset.fromDirection(7.8,18.0),
                    color:Color.fromARGB(255, 166, 166, 166),
                    blurRadius: 50.0,
                    spreadRadius: 2.0,
                    blurStyle: BlurStyle.normal,
                  )
                ]
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('DUSK TILL DAWN',
            style: TextStyle(
              color:Color(0xFFD9D9D9),
              fontSize: 22.0,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text('ZAYN & SIA',
            style: TextStyle(
              color: Color(0xFFD9D9D9),
              fontSize: 16.0
            ),
            ),
          SizedBox(
            height: 30.0,
          ),
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      voiceup=!voiceup;
                    });
                  },
                    icon: Icon(voiceup?EvaIcons.volumeUp:EvaIcons.volumeOff),
                    color: Colors.white,
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      favorite=!favorite;
                    });
                  },
                    icon: Icon(favorite?EvaIcons.heart:EvaIcons.heartOutline),
                    color: Colors.white,
                   ),
                   IconButton(onPressed: (){

                  },
                    icon: Icon(EvaIcons.repeat),
                    color: Colors.white,
                    )
                ],
              ),
              Container(
                width: 350.0,
                child:slider() ,
              )
                
              
              
        ],
      ),         
      );
  }
}
