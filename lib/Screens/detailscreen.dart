import 'package:firebase/Screens/cartscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DetailScreen extends StatelessWidget {
String detail;
String imagePath;
String rating;
String price;
DetailScreen({required this.detail,required this.imagePath, required this.rating, required this.price });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Expanded(
              child: Center(
                child: Column(
                  children: [

                    Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Image.asset(imagePath, height: 265,width: 265,)),
                    Padding(padding: EdgeInsets.all(25),child: Column(children: [
                      Row(
                        children: [
                          Text(detail, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                          Spacer(),
                          Icon(Icons.star, color: Colors.yellow),
                          Text(rating, style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Align(alignment: Alignment.bottomLeft, child: Text("Sold By Ghulam Mustafa")),
                      SizedBox(height: 10,),
                      Align(
                            alignment: Alignment.topLeft,
                              child: Text("Description:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                      SizedBox(height: 10,),
                      Text("Time to hang out with your buddies in style and admiration in this classic trendy tee that has a pullover crewneck with a classic fit throughout. This regular fit shirt has regular crew round neck with short sleeves and waist length and straight hem. Some graphical design printed on the front so beautifully it gives charm to this simple T-shirt. 100% cotton is so soft, light weight and breathable for summer season. Easy to machine wash and tumble dry.", textAlign: TextAlign.justify,),
                      SizedBox(height: 20),
                      Align(alignment: Alignment.centerLeft,child: Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                                // maximumSize: MaterialStateProperty.all(Size(220, 40))

                                ),
                                onPressed: (){}, child: Text('Add to Cart')),
                          ),
                          SizedBox(width: 10,),
                          IconButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                          }, icon: Icon(Icons.shopping_cart))
                        ],
                      )
                    ],),),

                  ],
                ),
              ))
        ],
      ),

    );
  }
}
