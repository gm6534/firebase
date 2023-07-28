import 'package:firebase/Screens/apiScreen.dart';
import 'package:firebase/Screens/offlineStorage.dart';
import 'package:firebase/Screens/prefscreen.dart';
import 'package:firebase/Screens/VCall%20Screens/vCallScreen.dart';
import 'package:flutter/material.dart';
import 'Calculator/mainCalculator.dart';
import 'Testing.dart';
import 'Todo/todo.dart';
import 'Todo/todoScreen.dart';
import 'Weather Screens/weatherScreen.dart';
import 'chatScreen.dart';
import 'conversationscreen.dart';
import 'dynamiclist.dart';
import 'jazzCashScreen.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({Key? key}) : super(key: key);
// int _currentindex = 1;
// PageController _pageController = PageController(initialPage: 4);
// int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: AppBar(
    //     elevation: 0,
    //     backgroundColor: Colors.blue,
    //     title: Text('Internship', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
    //     centerTitle: true,
    // ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10, ),
            children: [
              ///Testing
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.teal,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Test', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                    ],
                  ),
                ),
              ),

              ///Store
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Conversation()));
                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Store', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                    ],
                  ),
                ),
              ),

              ///Dynamic List
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DynamicList()));
                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.yellow.shade800,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dynamic List', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white), textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),

              ///Offline
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OfflineStorData()));
                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Offline', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                    ],
                  ),
                ),
              ),

              ///SharedPref
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SharedPref()));
                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.pink,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Shared\nPref', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white), textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),

              ///Api
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ApiScreen()));
                },
                child: Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('API', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                    ],
                  ),
                ),
              ),

              ///Chat
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                },
                child: Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.purpleAccent,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Chat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                    ],
                  ),
                ),
              ),

              ///JazzCash
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>JazzCashScreen()));
                },
                child: Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.black87,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('JazzCash', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                    ],
                  ),
                ),
              ),

              ///Agora Video Calling
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoCallScreen()));
                },
                child: Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green.shade300,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Agora\nVideo\nCalling', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white), textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
              ///Calculator
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CalculatorScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.deepPurple,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Calculator', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                    ],
                  ),
                ),
              ),
              ///Weather
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherScreens()));
                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Weather', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                    ],
                  ),
                ),
              ),
              ///Todo Screen
              // InkWell(
              //   onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoScreen()));
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.deepOrange,),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text('Todo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
