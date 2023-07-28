import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Constant/constants.dart';
import 'package:firebase/Screens/cartscreen.dart';
import 'package:firebase/Screens/conversationscreen.dart';
import 'package:firebase/Screens/dynamiclist.dart';
import 'package:firebase/Screens/loginscreen.dart';
import 'package:firebase/Screens/offlineStorage.dart';
import 'package:firebase/Screens/prefscreen.dart';
import 'package:firebase/Screens/profileScreen.dart';
import 'package:firebase/Screens/scrollviewscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


User? loggedinUser;

class CustomDrawer extends StatefulWidget {

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  final _auth = FirebaseAuth.instance;
  var loadImage;

  void initState() {
    super.initState();
    getCurrentUser();
    getImage();
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    // try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()));
      }
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.redAccent,
            boxShadow: [BoxShadow(offset: Offset(0, 3),blurRadius: 5,color: Colors.grey, blurStyle: BlurStyle.inner)],
            ),
            child: Container(

              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(loadImage == null
                          ? "https://oneill.law.georgetown.edu/wp-content/uploads/2021/06/generic-profile.png"
                          : loadImage.toString()),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Ghulam Mustafa", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),),
                  Text("6534gm@gmail.com", style: TextStyle(color: Colors.white, fontSize: 12, fontStyle: FontStyle.italic),),
                  SizedBox(height: 10,),


                ],

              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.62,
            child: SingleChildScrollView(
              child: Column(children: [
              ExpansionTile(
                iconColor: Colors.redAccent,
                textColor: Colors.redAccent,
                leading: Icon(Icons.home),
                title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold),),
                childrenPadding: EdgeInsets.only(left: 55),
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Conversation()));
                    },
                    leading: Icon(Icons.store_outlined), title: Text("Store"),),
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DynamicList()));
                    },
                    leading: Icon(Icons.edit_calendar_outlined), title: Text("Dynamic List"),),
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> OfflineStorData()));
                    },
                    leading: Icon(Icons.list_alt_outlined), title: Text("Offline"),),
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SharedPref()));
                    },
                    leading: Icon(Icons.layers_rounded), title: Text("Shared Pref"),),
                ],
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ScrollViewScreen()));
                },
                leading: Icon(Icons.chair_rounded),
                title: Text('Furniture', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Conversation()));
                },
                leading: Icon(Icons.store_outlined),
                title: Text('Store', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                },
                leading: Icon(Icons.shopping_cart),
                title: Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
              ),

              ],),
            ),
          ),
          Divider(),
          ListTile(
            onTap: (){
                  Constants.prefs?.setBool("loggedIn", false);
                   _auth.signOut();
                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);
                      },
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
          ),
        ],
      ),
    );
  }
  getImage()async {

    User? user=_auth.currentUser;

    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    DocumentSnapshot getimg
    = await firebaseFirestore.collection('user').doc(user!.uid).get();

    var imageUrl= getimg['imgUrl'];

    setState(() {
      loadImage=imageUrl;

    });

  }
}

