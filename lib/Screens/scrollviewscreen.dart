import 'package:firebase/Constant/colors.dart';
import 'package:firebase/Screens/detailscreen.dart';
import 'package:flutter/material.dart';

class ScrollViewScreen extends StatefulWidget {
  @override
  State<ScrollViewScreen> createState() => _ScrollViewScreenState();
}

class _ScrollViewScreenState extends State<ScrollViewScreen> {

  List name = [
    "Winter Shirt",
    "Summer T-Shirt",
    "T-Shirt",
    "T Shirt",
    "Boys T-Shirt",
    "Girls T-Shirt",
    "Kids Shirt",
    "Shirt",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Center(
           child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined, color: Colors.black,)),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const  Text("What are you\nlooking for?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            const  SizedBox(height: 10,),
              Container(
                decoration:const BoxDecoration(boxShadow: [BoxShadow(offset: Offset(0, 6), blurRadius: 5,color: Colors.grey)]),
                child: TextFormField (decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search...',
                    border: OutlineInputBorder(borderSide: BorderSide(width: 0, style: BorderStyle.none), borderRadius: BorderRadius.all(Radius.circular(10))),
                    filled: true,
                    fillColor: Colors.white,
                ),
                ),
              ),
              const SizedBox(height: 16,),
              Container(
                height: 280,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context,index)
                    {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                            detail: name[index],
                            imagePath: "assets/img/img${index}.jpg",
                            rating: "3.$index",
                            price: "Rs 300$index"
                        )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name[index], style: TextStyle(fontWeight: FontWeight.bold),),
                          const SizedBox(height: 8,),
                          Stack(
                            children: [
                              Container(
                                height: 250,
                                width: 150,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset("assets/img/img${index}.jpg",
                                      fit: BoxFit.cover,)),
                              ),
                        Positioned(

                            left: 0,
                            bottom: 0,
                            child: Opacity(

                              opacity: 0.5,
                              child: Container(
                          height: MediaQuery.of(context).size.height*0.17,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                        ),
                            )),
                        Positioned(
                          left: 5,
                            bottom: 20,


                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Opacity(opacity: 0.8,  child: Text(name[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.white),)),
                            Opacity(opacity: 0.6,child: Text("Time to hang out with \nyour buddies in style \nand admiration in this \nclassic trendy tee that \nhas a pullover", style: TextStyle(color: Colors.white),)),

                          ],),)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
              Row(
                children: [
                  Text("Popular Products", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Spacer(),
                  TextButton(onPressed: (){}, child: Text("View More", style: TextStyle(color: Colors.blueGrey),))
                ],
              ),
              SizedBox(height: 16,),
              Container(
                height: 280,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                                detail: name[index],
                                imagePath: "assets/img/img${index}.jpg",
                                rating: "3.$index",
                                price: "Rs 300$index"
                            )));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 250,
                                    width: 150,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset("assets/img/img${index+1}.jpg",
                                          fit: BoxFit.cover,)),
                                  ),
                                  Positioned(

                                      left: 0,
                                      bottom: 0,
                                      child: Opacity(

                                        opacity: 0.5,
                                        child: Container(
                                          height: MediaQuery.of(context).size.height*0.1,
                                          width: MediaQuery.of(context).size.width,
                                          color: Colors.black,
                                        ),
                                      )),
                                  Positioned(
                                    left: 5,
                                    bottom: 20,


                                    child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Opacity(opacity: 0.8,  child: Text(name[index+1],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.white),)),
                                        Opacity(opacity: 0.6,child: Text("Time to hang out with \nyour buddies in style ", style: TextStyle(color: Colors.white),)),

                                      ],),)
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),

            ],


          ),
        ),
      )
    );
  }
}