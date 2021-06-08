import 'package:blink_app/logic/api/playbackApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';

class PlaybackControllerPage extends StatelessWidget {
  const PlaybackControllerPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
        title: Text(
          "Playback Control"
        ),

        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.swap_horizontal_circle_sharp))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              color: Color(0xfffafafa),
              child: GridView.builder(
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  shadowColor: Colors.black.withOpacity(0.2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${index+1}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        "Play",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                )
              ),
            )
          ),
          Material(
            color: Colors.white,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 70,
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        PlaybackApi().callCommand("play_pause");
                      }, 
                      icon: Icon(Icons.play_arrow_rounded)
                    ),
                    SizedBox(width: 8,),
                    IconButton(
                      iconSize: 70,
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        PlaybackApi().callCommand("record");
                      }, 
                      icon: Icon(Icons.voicemail)
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}