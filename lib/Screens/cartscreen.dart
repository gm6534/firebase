import 'package:flutter/material.dart';


class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(onPressed: (){
      //     Navigator.pop(context);
      //   }, icon: Icon(Icons.arrow_back_ios, color: Colors.grey,)),
      // ),
      backgroundColor: Colors.white,
      body: Center(
        child: Icon(Icons.shopping_cart, size: 100, color: Colors.black12,),

      ),
    );
  }
}
