import 'package:flutter/material.dart';

//Container tasarımları
class MyContainer extends StatelessWidget {
  var color;
  var child;
  var onPress;

  //renk belirtmezsem default olarak white60 rengini ver
  MyContainer({this.color = Colors.white, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}

