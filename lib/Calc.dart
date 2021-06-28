import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}


class _CalcState extends State<Calc> {

  var inputt="";
  
Widget btn(var textt){
  return Container(
    height: 85,
    width: 85,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
    onPrimary: Colors.black,
     textStyle: TextStyle(
                    fontSize: 30,)
    ),
      onPressed: (){
      setState(() {
              inputt=inputt+textt;
            });
  }, child: Text(textt)));
}


clearr(){
  setState(() {
      inputt="";
    });  
}

outp(){
      Parser p = Parser();
  Expression expr = p.parse(inputt);
  ContextModel cm = ContextModel();
  double eval = expr.evaluate(EvaluationType.REAL, cm);

setState(() {
  inputt = eval.toString();
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(inputt,style: TextStyle(
          fontSize: 70,
        ),)
            ],
          ),
        Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            ElevatedButton(onPressed: clearr, child: Text("Clear"),style: ElevatedButton.styleFrom(
        primary: Colors.white,
    onPrimary: Colors.black,
    padding: EdgeInsets.symmetric(horizontal: 155, vertical: 20),
     textStyle: TextStyle(
                    fontSize: 30)
    ),),
          ],
        ),
          SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn("7"),
              btn("8"),
              btn("9"),
              btn("/"),    
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            btn("4"),
            btn("5"),
            btn("6"),
            btn("*")
          ],
        ),),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            btn("1"),
            btn("2"),
            btn("3"),
            btn("-")
          ],
        ),),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: outp, child: Text("="),style: ElevatedButton.styleFrom(
        primary: Colors.white,
    onPrimary: Colors.black,
    padding: EdgeInsets.symmetric(horizontal: 33, vertical: 24),
     textStyle: TextStyle(
                    fontSize: 30,fontWeight: FontWeight.bold)
    ),),
            btn("0"),
            btn("."),
            btn("+")
          ],
        ),),
      ],
      ),
    );
  }
}