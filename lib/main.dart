
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

double num=0;
Widget slider(){
  return SliderTheme(
    data: SliderTheme.of(context).copyWith(
      trackHeight:3.0,
      thumbShape: RoundSliderThumbShape(
        enabledThumbRadius: 13.0,
        elevation: 10.0,
        pressedElevation: 22.0
      ),
      
      overlayColor: Colors.white

    )
    
    
    ,child: Slider(
      activeColor: Colors.grey,
      inactiveColor:Colors.white , 
      value: num,
      thumbColor: Colors.white,
      divisions: 100,
      onChanged: (value){
        setState(() {
          num=value;
        });
    }),
  );
}

void seek(int value){

}
final textColor= Color(0xFFD9D9D9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        titleTextStyle:TextStyle(
            fontFamily:'Inika',
            fontSize: 28.0,
            fontWeight: FontWeight.bold
        ),
        centerTitle: true,
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor:Color(0xFF52524F) ,
        title: Text('Music Player'),
        actions: [
          IconButton(
            splashRadius: 1.0,
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
          }, icon: Icon(EvaIcons.list)
          ,)
        ],
      ),       
      body: Column(

        children: [
          SizedBox(
            height: 50.0,
          ),
          
          Text('Listen To Your Favorite Song Here',style: TextStyle(
            color: textColor,
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
            height: 20.0,
          ),
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    splashRadius: 1.0,
                    onPressed: (){
                    setState(() {
                      voiceup=!voiceup;
                    });
                  },
                    icon: Icon(voiceup?EvaIcons.volumeUp:EvaIcons.volumeOff),
                    color: textColor,
                  ),
                  IconButton(
                    splashRadius: 1.0,
                    onPressed: (){
                    setState(() {
                      favorite=!favorite;
                    });
                  },
                    icon: Icon(favorite?EvaIcons.heart:EvaIcons.heartOutline),
                    color: textColor,
                   ),
                   IconButton(
                    splashRadius: 1.0,
                    onPressed: (){

                  },
                    icon: Icon(EvaIcons.repeat),
                    color: textColor,
                    )
                ],
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
              Container(
                width:310.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('00:00',style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0
                    ),
                    ),
                    Text('02:23',style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0
                    ))
                  ],
                ),
              ),
              Container(
                width: 350.0,
                child:slider() ,
              ),
              Container(
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    IconButton(
                      splashRadius: 1.0,
                      onPressed: (){
                        
                      },
                      icon: Icon(Icons.fast_rewind_rounded),
                      color: textColor,
                      iconSize: 50.0,
                    ),
                    IconButton(
                      splashRadius: 1.0,
                      onPressed: (){
                        setState(() {
                          playing=!playing;
                        });
                      },
                      icon: Icon(playing?Icons.pause:Icons.play_arrow_rounded),
                      color:  textColor,
                      iconSize: 60.0,
                    ),
                    IconButton(
                      splashRadius: 1.0,
                      onPressed: (){
              
                      },
                      icon: Icon(Icons.fast_forward_rounded),
                      color:  textColor,
                      iconSize: 50.0,
                    )
                  ],
                ),
              ),
                
              
              
        ],
      ),         
      );
  }
}
