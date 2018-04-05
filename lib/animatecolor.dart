import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimateColor extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AnimateColorState();
  }

}

class AnimateColorState extends State<AnimateColor> with SingleTickerProviderStateMixin{

  Animation _animation;
  AnimationController _controller;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _controller = new AnimationController( vsync: this, duration: new Duration( milliseconds: 5000));
_animation = new ColorTween( begin: Colors.yellow, end: Colors.black45).animate(_controller)..addListener((){
  this.setState((){

  });
});
  

      _controller.forward();
    }

    void _onTap(){
     
       if(_controller.status == AnimationStatus.completed){
        _controller.reset();_controller.forward();
      }
      
    }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return new Material(
   child: new Center(
     child: new InkWell(
       child:  new Icon(Icons.local_pizza, color: _animation.value, size: 80.0,),
       onTap: _onTap,
     ),
   ),
);

  }

}