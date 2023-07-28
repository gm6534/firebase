import 'package:firebase/Screens/Calculator/btnCalculator.dart';
import 'package:firebase/Widgets/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  var userQuestion = '';
  var userAnswer ='';



  final List<String> buttons =
  [
    'C', 'DEL', '%', '/',
    '9', '8', '7', 'x',
    '6', '5', '4', '-',
    '3', '2', '1', '+',
    '0', '00', '.', '=',

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: Text('Calculator'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> BottomNav()), (route) => false);
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                          child: Text(userQuestion, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),)
                      ),
                      Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.centerRight,
                          child: Text(userAnswer, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),)
                      )
                    ],
                  ),
                ),
              )
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index){

                      if(index == 0){
                        return MyButton(
                          btnTapped: (){
                            setState(() {
                              userQuestion = '';
                              userAnswer = '';
                            });
                          },
                          btnText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white,
                        );
                      }else if(index == 1){
                        return MyButton(
                          btnTapped: (){
                            setState(() {
                              userQuestion = userQuestion.substring(0, userQuestion.length-1);
                            });
                          },
                          btnText: buttons[index],
                          color: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                      ///Equal Sign
                      else if(index == buttons.length-1){
                        return MyButton(
                        btnTapped: (){
                        setState(() {
                          equalPressed();
                        });
                        },
                        btnText: buttons[index],
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        );} else{
                        return MyButton(
                          btnTapped: (){
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          btnText: buttons[index],
                          color: isOperator(buttons[index]) ? Colors.deepPurple : Colors.white,
                          textColor: isOperator(buttons[index]) ? Colors.white : Colors.deepPurple,
                        );

                      }
                  }
                )

              )
          ),
        ],
      ),
    );
  }
  bool isOperator(String x){
    if(x == '%' || x == '/'  || x == 'x' || x == '-' || x == '+' || x == '=' ){
      return true;
    }
    return false;
  }

  void equalPressed(){

    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);



    userAnswer = eval.toString();
  }

}
