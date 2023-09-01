
import 'package:flutter/material.dart';

import '../model/model.dart';

import 'package:flutter/material.dart';
import '../model/model.dart';  

class MyHomePage extends StatelessWidget {
  final Welcome car;  

  MyHomePage({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CarInfoWidget(car: car),
    );
  }
}


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100.0);
  

  @override
  Widget build(BuildContext context) {
    
    return AppBar(
      title: const Padding(
        
        padding:  EdgeInsets.all(8.0),
        child:  Row(
          children: [
            CircleAvatar(
              backgroundImage: 
              NetworkImage('https://marketplace.canva.com/EAFfyNv3EC4/2/0/1600w/canva-orange-black-modern-facebook-profile-picture-17RW-gVJo5k.jpg'), // Replace with your profile photo asset
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text('Welcome! 👋', style: TextStyle(fontSize: 12,fontFamily: 'NotoEmoji')),
                Text('John Doe', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
          },
        ),
      ],
    );
  }
}

class CarInfoWidget extends StatelessWidget {
  final Welcome car;  

  CarInfoWidget({required this.car});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(car.model),
      subtitle: Text(car.make.toString()), 
    );
  }
}
