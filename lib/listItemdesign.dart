import 'package:flutter/material.dart';



class songlistItem extends StatelessWidget {

  songlistItem({required this.songName,required this.songChoose});

  Function songChoose;
  String songName;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 3,vertical: 1),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color:Color(0xFF52524F),
      ),
      // alignment: Alignment.centerLeft,
      child: TextButton(onPressed: (){
        songChoose();
      },
      child: Text(songName,
            style: TextStyle(
              // backgroundColor: Colors.white,
              color: Colors.white
            
            
            ),
      )),
    );
  }
}