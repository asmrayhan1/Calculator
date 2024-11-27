import 'package:calculator/components/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fast_expressions/fast_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  String expresion = "";
  bool flag = true;
  String result = "";
  bool isEqual = false;

  void calculation(){
    try{
      if (expresion.isNotEmpty) {
        final r = parseExpression(expresion);
        if (r() >= -1e18 && r() <= 1e18) result = r().toString();
        else result = "Overflow";
        print(result);
      } else {
        result = "";
      }
    } catch (e){
      result = "Invalid Input";
      print("Error Found");
    }
  }

  void update(bool ok){
    setState(() {
      isEqual = false;
      _controller.text = expresion;
      if (ok) calculation();
    });
    print(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  SizedBox(height: 50),
                  //Text(expresion,style: TextStyle(color: Colors.white),),
                  TextField(
                    textAlign: TextAlign.end,
                    maxLines: 4,
                    controller: _controller,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                    decoration: InputDecoration(

                      enabledBorder: InputBorder.none, // Ensure no border in the enabled state
                      focusedBorder: InputBorder.none, // Ensure no border when focused
                    ),
                    showCursor: false, // Ensures the cursor is visible
                    readOnly: true, // Make the text field read-only so the keyboard doesn't trigger
                  ),
                  if (isEqual) Text(result, style: TextStyle(fontSize: (result.length <= 11?  60 : (result.length <= 15? 45  : 35)), color: Colors.white))
                  else Text(result, style: TextStyle(fontSize: (result.length <= 11?  60 : (result.length <= 15? 45  : 35)), color: Colors.white38)),
                ],
              ),
            ),

            Expanded(
              flex: 8,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Custombutton(title: "C", buttonColor: Colors.white38, ontap: (){
                          expresion = '';
                          setState(() {
                            result = '';
                          });
                          update(false);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "( )", buttonColor: Colors.white38, ontap: () {
                          //if (expresion.isEmpty || expresion[expresion.length - 1] != '(')
                          if (flag) expresion += '(';
                          else expresion += ')';
                          flag = !flag;
                          update(false);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "%", buttonColor: Colors.white38, ontap: (){
                          expresion += '%';
                          update(false);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "/", buttonColor: Colors.blueAccent, ontap: () {
                          expresion += '/';
                          update(false);
                        })
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      children: [
                        Custombutton(title: "7", buttonColor: Colors.white24, ontap: (){
                          if (expresion.length == 1 && expresion[0] == '0') expresion = '';
                          expresion += '7';
                          update(true);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "8", buttonColor: Colors.white24, ontap: () {
                          if (expresion.length == 1 && expresion[0] == '0') expresion = '';
                          expresion += '8';
                          update(true);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "9", buttonColor: Colors.white24, ontap: (){
                          if (expresion.length == 1 && expresion[0] == '0') expresion = '';
                          expresion += '9';
                          update(true);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "x", buttonColor: Colors.blueAccent, ontap: () {
                          expresion += '*';
                          update(false);
                        })
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      children: [
                        Custombutton(title: "4", buttonColor: Colors.white24, ontap: (){
                          if (expresion.length == 1 && expresion[0] == '0') expresion = '';
                          expresion += '4';
                          update(true);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "5", buttonColor: Colors.white24, ontap: () {
                          if (expresion.length == 1 && expresion[0] == '0') expresion = '';
                          expresion += '5';
                          update(true);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "6", buttonColor: Colors.white24, ontap: (){
                          if (expresion.length == 1 && expresion[0] == '0') expresion = '';
                          expresion += '6';
                          update(true);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "-", buttonColor: Colors.blueAccent, ontap: () {
                          expresion += '-';
                          update(false);
                        })
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      children: [
                        Custombutton(title: "1", buttonColor: Colors.white24, ontap: (){
                          if (expresion.length == 1 && expresion[0] == '0') expresion = '';
                          expresion += '1';
                          update(true);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "2", buttonColor: Colors.white24, ontap: () {
                          if (expresion.length == 1 && expresion[0] == '0') expresion = '';
                          expresion += '2';
                          update(true);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "3", buttonColor: Colors.white24, ontap: (){
                          if (expresion.length == 1 && expresion[0] == '0') expresion = '';
                          expresion += '3';
                          update(true);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "+", buttonColor: Colors.blueAccent, ontap: () {
                          expresion += '+';
                          update(false);
                        })
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      children: [
                        Custombutton(title: ".", buttonColor: Colors.white24, ontap: (){
                          if (expresion.isEmpty) expresion = '0';
                          expresion += '.';
                          update(false);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "0", buttonColor: Colors.white24, ontap: () {
                          if (expresion.length >= 1 && expresion[0] != '0') expresion += '0';
                          else if (expresion.length == 0) expresion += '0';
                          update(true);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "<--", buttonColor: Colors.white24, ontap: (){
                          if (expresion.isNotEmpty) expresion = expresion.substring(0, expresion.length - 1);
                          update(true);
                        }),
                        SizedBox(width: 10),
                        Custombutton(title: "=", buttonColor: Colors.blueAccent, ontap: () {
                          setState(() {
                            isEqual = true;
                          });
                          calculation();
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
