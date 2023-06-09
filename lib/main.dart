


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'listItemdesign.dart';
import 'listItems.dart';
// import 'package:metadata_god/metadata_god.dart';


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
        theme: ThemeData().copyWith(
          primaryColor: Color(0xFF52524F),
          scaffoldBackgroundColor: Color(0xFF52524F),
        ),
        home: Musicdesign());
  }
}

class Musicdesign extends StatefulWidget {
  @override
  State<Musicdesign> createState() => _MusicdesignState();
}

class _MusicdesignState extends State<Musicdesign> with SingleTickerProviderStateMixin{
  bool playing = false;
  bool favorite = false;
  bool voiceup = true;
  int songLengthinSeconds = 0;
  int min = 0;
  int sec = 0;
  int currentpos = 0;
  int currentmin = 0;
  int currentse = 0;
  double iconSize=50.0;
  listItems list=listItems();
  String songName='';
  String singer='';
  int songNumber=0;
  String image='';
  String songSource='';

  late final player;
@override
void initState() {
  super.initState();
  player=AudioPlayer();
  fetchData(songNumber);
}

void fetchData(int number){
  
  songSource=list.items[number]['music'];
  songName=list.items[number]['title'];
  singer=list.items[number]['singer'];
  image=list.items[number]['image'];

  playingSong(playing);  
}

  double num = 0;
  Widget slider() {
    return  SliderTheme(
        data: SliderTheme.of(context).copyWith(
            trackHeight: 3.0,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 12.0,
            ),
            overlayColor: Colors.white
            
            ),
        child: Slider(
            min: 0.0,
            max:songLengthinSeconds.toDouble(),
            activeColor: Colors.grey,
            inactiveColor: Colors.white,
            value: currentpos.toDouble(),
            thumbColor: Colors.white,
            onChanged: (value) {
              setState(() {
                player.seek(Duration(seconds: value.toInt()));
              });
            }),
      );
    
  }



@override

  void playingSong(bool play){
    if (play) {
      player.play(AssetSource(songSource));
    } else {
      player.pause();
    }


//get the duration of audio
     player.onDurationChanged.listen((Duration d) {
      songLengthinSeconds = d.inSeconds;
      min = (songLengthinSeconds / 60).toInt();
      sec = (songLengthinSeconds % 60).toInt();
      print(songLengthinSeconds);
    });

//get the current position of playing audio
    player.onPositionChanged.listen((Duration p) {
      setState(() {
        currentpos = songLengthinSeconds>10? p.inSeconds:p.inSeconds+1;
        currentse = currentpos < 60 ? currentpos : currentpos % 60;
        currentmin = (currentpos / 60).toInt();
        if (currentpos == songLengthinSeconds) {
          currentpos = 0;
          currentmin = 0;
          currentse = 0;
          playing = false;
        }
      });
    });
  }

  final textColor = Color(0xFFD9D9D9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
            fontFamily: 'Inika', fontSize: 28.0, fontWeight: FontWeight.bold),
        centerTitle: true,
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Color(0xFF52524F),
        title: Text('Music Player'),
        actions: [
          IconButton(
            splashRadius:0.1,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 114, 114, 114),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)
                          
                        )
                        
                      ),
                      
                      height: 550.0,
                      child: Column(
                        children: [
                          Icon(
                            Icons.drag_handle,color: Colors.white.withOpacity(.6),
                            size: 30.0,
                            ),
                            //song list here
                            ...list.items.map((e) {
                            // final index = list.items.indexOf(e);
                            // final id = e['id'];
                            final title = e['title'];
                            // final image = e['image'];
                            // final music = e['music'];
                            return songlistItem(songName: title,songChoose:(){
                              setState(() {
                                songNumber=e['id']-1;
                              });
                              fetchData(songNumber);
                              
                            });
                          })
                        ],
                      ),
                    );
                  },
                  enableDrag: true,
                  // showDragHandle: true,
                  backgroundColor: Color(0xFF52524F).withOpacity(0)
                  );
            },
            icon: Icon(EvaIcons.list,size:28.0),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Listen To Your Favorite Song Here',
              style: TextStyle(
                color: textColor,
                fontSize: 16.0,
                // fontStyle: FontStyle.italic,
                fontFamily: 'Inika',
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            AnimatedRotation(
              turns: playing?10:0,
              duration:playing?Duration(seconds: 250):Duration(seconds: 0),
              child: Container(
                    width: 230.0,
                    height: 230.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(140.0),
                        image: DecorationImage(
                            image: AssetImage(image)),
                        boxShadow: [
                          BoxShadow(
                            // offset: Offset.fromDirection(7.8, 18.0),
                            color: Color.fromARGB(255, 166, 166, 166),
                            blurRadius: 50.0,
                            spreadRadius: 2.0,
                            blurStyle: BlurStyle.normal,
                          )
                        ]),
                ),
            ),
            
            SizedBox(
              height: 40.0,
            ),
            Text(
              songName,
              style: TextStyle(
                  color: Color(0xFFD9D9D9),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              singer,
              style: TextStyle(color: Color(0xFFD9D9D9), fontSize: 16.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  splashRadius:0.1,
                  onPressed: () {
                    setState(() {
                      player.setVolume(voiceup?0.0:1.0);
                      voiceup = !voiceup;
                    });
                  },
                  icon: Icon(voiceup ? EvaIcons.volumeUp : EvaIcons.volumeOff),
                  color: textColor,
                ),
                IconButton(
                  splashRadius:0.1,
                  onPressed: () {
                    setState(() {
                      favorite = !favorite;
                    });
                  },
                  icon: Icon(favorite ? EvaIcons.heart : EvaIcons.heartOutline),
                  color: textColor,
                ),
                IconButton(
                  splashRadius:0.1,
                  onPressed: () {},
                  icon: Icon(EvaIcons.repeat),
                  color: textColor,
                )
              ],
            ),
            SizedBox(
              height: 9.0,
            ),
            Container(
              width: 300.0,
              // height: 17.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '0$currentmin:${currentse > 9 ? currentse : '0$currentse'}',
                    style: TextStyle(color: Colors.white, fontSize: 11.0),
                  ),
                  Text('0$min:${sec < 10 ? '0$sec' : sec}',
                      style: TextStyle(color: Colors.white, fontSize: 11.0))
                ],
              ),
            ),
            Container(
              width: 350.0,
              child: slider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  splashRadius:0.1,
                  onPressed: () {
                    setState(() {
                      playing = false;
                      currentpos = currentmin=currentse= 0;
                      songNumber=songNumber==0?2:--songNumber;
                    });
                    fetchData(songNumber);
                    player.stop();
                  },
                  icon: Icon(Icons.fast_rewind_rounded),
                  color: textColor,
                  iconSize:iconSize,
                ),
                IconButton(
                  splashRadius:0.1,
                  onPressed: () {
                    setState(() {
                      playing = !playing;
                      playingSong(playing);
                    });
                  },
                  icon: Icon(playing ? Icons.pause : Icons.play_arrow_rounded),
                  color: textColor,
                  iconSize: 60.0,
                ),
                IconButton(
                  splashRadius:0.1,
                  onPressed: () {
                    setState(() {
                      playing = false;
                      currentpos = currentmin=currentse= 0;
                      songNumber=songNumber==2?0:++songNumber;
                    });
                    fetchData(songNumber);
                    player.stop();
                  },
                  icon: Icon(Icons.fast_forward_rounded),
                  color: textColor,
                  iconSize: iconSize,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


