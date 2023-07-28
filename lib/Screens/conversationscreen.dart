import 'dart:ui';
import 'package:firebase/Screens/cartscreen.dart';
import 'package:firebase/Widgets/gridview.dart';
import 'package:firebase/Widgets/listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constant/colors.dart';

class Conversation extends StatefulWidget {
  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  bool isListView=true;
  bool changeIcon=true;
  bool isHidden=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offwhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
                      Text('Store', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                      Spacer(),
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                      }, icon: Icon(Icons.shopping_cart)),
                      InkWell(
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('Add Items',textAlign: TextAlign.center, style: TextStyle(color: Colors.blueAccent),),
                                  content: Container(
                                    height: 130,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                              hintText: 'Product Name'
                                          ),
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              hintText: 'Price'
                                          ),
                                        ),


                                      ],
                                    ),

                                  ),
                                  actions: [
                                    InkWell(onTap: (){
                                      Navigator.pop(context);
                                    }, child: Text('Cancel', style: TextStyle(fontWeight: FontWeight.bold),)),
                                    SizedBox(width: 10,),
                                    ElevatedButton(onPressed: (){
                                    }, child: Text('ADD'))
                                  ],
                                );
                              });
                        },
                        child: Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blueAccent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: Colors.white,),
                              Text('add', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white, fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 18,
                        backgroundImage: AssetImage('assets/img/img1.jpg'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 3,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search...',
                        border: OutlineInputBorder(borderSide: BorderSide(width: 0, style: BorderStyle.none), borderRadius: BorderRadius.all(Radius.circular(10))),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.settings_input_composite_outlined))
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        setState((){
                          changeIcon=!changeIcon;
                        });
                      }, icon:changeIcon? Icon(Icons.favorite_border): Icon(Icons.favorite, color: Colors.red,)),
                      Text('Wish List', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      SizedBox(width: 20,),
                      Text('Dark', style: TextStyle(fontWeight: FontWeight.bold),),
                      IconButton(
                        onPressed: (){
                          setState((){
                            isHidden=!isHidden;
                          });
                        }, icon: isHidden?Icon(Icons.toggle_off_outlined):Icon(Icons.toggle_on_outlined,color: Colors.white),),
                      IconButton(onPressed: (){
                        setState(() {
                          isListView=true;

                        });
                      }, icon: Icon(Icons.list_outlined)),
                      IconButton(onPressed: (){
                        setState(() {
                          isListView=false;
                        });
                      }, icon: Icon(Icons.grid_view_outlined)),

                    ],
                  ),
                ),
                SizedBox(height: 15,),
                isListView?
                ListViewBuilder() : GridViewBuilder()
              ],
            ),
          ),
        ),
      ),
    );
  }
}