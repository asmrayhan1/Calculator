import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key, required this.title, required this.buttonColor, required this.ontap});

  final String title;
  final Color buttonColor;

  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Text(title, style: TextStyle(color: Colors.white, fontSize: 30),),),
        ),
      ),
    );
  }
}
