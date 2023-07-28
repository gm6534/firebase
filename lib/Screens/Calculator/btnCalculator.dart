import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final color;
  final textColor;
  final String btnText;
  final btnTapped;

  MyButton({this.color, this.textColor, required this.btnText, this.btnTapped});


  // const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
            child: Container(
              color: color,
              child: Center(
                child: Text(btnText, style: TextStyle(color: textColor, fontSize: 20,fontWeight: FontWeight.bold),),
              ),
            )
        ),
      ),
    );
  }
}
