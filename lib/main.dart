import 'package:firebase/Constant/constants.dart';
import 'package:firebase/Widgets/bottomnav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/loginscreen.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Constants.prefs = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ('FireBase'),
      home:
    Constants.prefs?.getBool('loggedIn')==true?BottomNav(): LoginScreen(),
  ));

}