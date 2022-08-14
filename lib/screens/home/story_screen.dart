// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({Key? key}) : super(key: key);
  static const routeName = '/story';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lime[100],
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Hero(
              tag: 'hero',
              child: Text(
                "Story of a Baby Dinasaur",
                style: TextStyle(
                  color: Colors.green[600],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Image(image: AssetImage('assets/images/dino3.png')),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Center(
                child: Text(
                  "Once upon a time, 210 million years ago, the sun was shining as Sammy the Stegosaurus watched the pterodactyls flap their wings and fly above the treetops. 'Wow!' she thought, 'I have never seen a dinosaur that flies before!' She could not believe that pterodactyl's wingspan can be as large as 30 feet. It looked like fun, but it made Sammy feel frustrated and sad.\n\n\nShe was a stegosaurus and could not fly. She did not have any friends to play with. Tippy the Pterodactyl saw Sammy crying and flew down to the forest to talk to her. Tippy landed and was walking on all fours, unlike other birds Sammy had seen. Sammy was excited that a new friend was coming to her. She thought she might finally have a friend to play with.'Hi! I'm Sammy.\n\n\nDo you want to play a game with me over here?' Sammy asked.Tippy replied,'I don't want to play down here. I want to soar in the sky. Why can't you just fly up here and play with us?''I can't. I can't fly. I am a stegosaurus. ' Sammy replied.'You don't know how to fly?! That is so weird! And what are those pointy things on your back? I only play games up in the sky with my pterodactyl friends.'\n\n\nBefore Sammy could tell her about all 17 bony plates that pointed out like spikes and ran down her back in two rows, Tippy had already started to fly away.Sammy could hear her laughing in the distance.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black54,
                    height: 1.34,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
