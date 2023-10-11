import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    title: "Calculator",
    debugShowCheckedModeBanner: false,
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var input='';
  var output='';
  onButtonClick(value){
    if(value== "AC"){
      input='';
      output = '';
    }
    else if(value=='<'){
      input = input.substring(0,input.length-1);
    }
    else if(value == "="){
       var userInput = input;
       userInput = input.replaceAll('x', "*");
       Parser p = Parser();
       Expression expression = p.parse(userInput);
       ContextModel cm = ContextModel();
       var finalValue = expression.evaluate(EvaluationType.REAL, cm);
       output = finalValue.toString();

    }
    else{
      input = input + value;
    }

    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    output,
                    style: TextStyle(fontSize: 48, color: Colors.white.withOpacity(0.7)),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            )),
            Row(
              children: [
                button(
                    text: "AC",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor),
                button(
                    text: "<",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor),
                button(
                    text: "",
                    buttonBgColor: operatorColor,
                    tColor: Colors.transparent),
                button(
                    text: "/",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor),
              ],
            ),
            Row(
              children: [
                button(text: "7"),
                button(text: "8"),
                button(text: "9"),
                button(
                    text: "x",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor),
              ],
            ),
            Row(
              children: [
                button(text: "4"),
                button(text: "5"),
                button(text: "6"),
                button(
                    text: "-",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor),
              ],
            ),
            Row(
              children: [
                button(text: "1"),
                button(text: "2"),
                button(text: "3"),
                button(
                    text: "+",
                    buttonBgColor: operatorColor,
                    tColor: orangeColor),
              ],
            ),
            Row(
              children: [
                button(text: "%"),
                button(text: "0"),
                button(text: ""),
                button(text: "=", buttonBgColor: orangeColor),
              ],
            ),
          ],
        ));
  }

  Widget button({text, tColor = Colors.white, buttonBgColor = buttonColor}) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(22),
            backgroundColor: buttonBgColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: () {onButtonClick(text);},
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18, color: tColor, fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
