import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class RotatingIcon extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RotatingIconState();
  }

}

class RotatingIconState extends State<RotatingIcon> with SingleTickerProviderStateMixin{

  Animation _animation;
  AnimationController _controller;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _controller = new AnimationController( vsync: this, duration: new Duration( milliseconds: 500));

  _animation = new Tween<double>(begin: 0.0,end: 1.0).animate(_controller)..addListener((){
        this.setState((){

        });
      });
     /* _animation = new CurvedAnimation( parent: _controller, curve: Curves.easeIn)..addListener((){
        this.setState((){

        });
      });*/

      _controller.forward();
    }

    void _onTap(){
      if(_controller.isAnimating)
      return;
      else if(_controller.status == AnimationStatus.completed){
        _controller.forward(from: 0.0);
      }
      
    }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return new Material(
   child: new Center(
     child: new InkWell(
       child: new Transform.rotate(
          child: new Icon(Icons.local_pizza, color: Colors.green, size: _animation.value * 80,),
          angle: 2*_animation.value * pi,
       ),
       onTap: _onTap,
     ),
   ),
);

  }

}