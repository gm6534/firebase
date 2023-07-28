import 'package:firebase/Constant/constants.dart';
import 'package:firebase/Screens/cartscreen.dart';
import 'package:firebase/Screens/scrollviewscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Screens/conversationscreen.dart';
import '../Screens/homescreen.dart';
import 'Drawer.dart';

User? loggedinUser;
class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  PageController _pageController = PageController(initialPage: 0);
  int pageIndex = 0;
  final _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    Constants.prefs?.setBool("loggedIn", true);

    getCurrentUser();
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.redAccent,
      // title: Text('Internship', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      // centerTitle: true,
    ),

      body: PageView(
        children: <Widget>[
          HomeScreen(),
          ScrollViewScreen(),
          CartScreen(),
          Conversation()

        ],
        controller: _pageController,
        onPageChanged: (int index){
          setState((){
            pageIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: pageIndex,
        onTap: (int index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
          );
        },
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', tooltip: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chair_rounded), label: 'Furniture', tooltip: 'Furniture'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart', tooltip: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.store_outlined), label: "Store", tooltip: 'Store'),

        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Conversation()));
      // },
      //   child: Icon(Icons.home),
      // ),
    );
  }
}
