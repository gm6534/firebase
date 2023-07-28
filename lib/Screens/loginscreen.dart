import 'package:firebase/Constant/colors.dart';
import 'package:firebase/Screens/signupscreen.dart';
import 'package:firebase/Widgets/bottomnav.dart';
import 'package:firebase/Widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
final _auth = FirebaseAuth.instance;
class _LoginScreenState extends State<LoginScreen> {
  bool isHidden=true;
  TextEditingController? emailcontroller;
  TextEditingController? passwordcontroller;
  final _formkey=GlobalKey<FormState>();
  String email="";
  String password="";
  @override
  void initState() {
    emailcontroller=TextEditingController();
    passwordcontroller=TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundcolor,
      body: Form(
        key: _formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Log into\nYour Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(offset: Offset(0, 3), blurRadius: 7)],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,

                  ),
                  // height: 150,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Textfield(hintText: "Email", obsecureText: false,
                          controller: emailcontroller,
                          validator:(val){
                            if (val== null || val==""){
                              return "Email Required";
                            }else if(!RegExp("[a-zA-Z0-9+_.-]+@[a-zA-Z0-0.-]+.[a-z]")
                                .hasMatch(val)){
                              return ("Enter Valid Email");
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                        Divider(),
                        Textfield(hintText: "Password", obsecureText: isHidden,
                            controller: passwordcontroller,
                            validator:(val){
                              if (val== null || val==""){
                                return "Password Required";
                              }else if(val.length < 8){
                                return "Must be 8 Character";
                              }
                              // else if(val.contains(RegExp(r'^[a-zA-Z0-9]+$'))){
                              //   return "Must be Alphabets";
                              // }
                              else{
                                return null;
                              }
                            },
                            suffix: IconButton(
                                onPressed: (){
                                  setState((){
                                    isHidden=!isHidden;
                                  });
                                }, icon: Icon(isHidden?Icons.visibility_off_outlined:Icons.visibility))),
                      ],

                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('forgot?', style: TextStyle(fontWeight: FontWeight.bold),

                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 50,
                    width: double.infinity,
                    child:
                    ElevatedButton(onPressed: ()
                          async {
                          if(_formkey.currentState!.validate()) {
                            // try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: emailcontroller!.text, password: passwordcontroller!.text);
                            if (user != null) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("Successfully LoggedIn")));
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => BottomNav()));
                            }
                          }
    // } catch (e) {
    // print(e);
    // }


    // if(_formkey.currentState!.validate()){
                      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully Login")));
                      //   Constants.prefs?.setBool('loggedIn', true);
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
                      // }
                    },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(defaultcolor),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                        ),
                        child: Text("Login",
                            style: TextStyle(fontWeight: FontWeight.bold)
                        )
                    )
                ),
                SizedBox(height: 10),

                Align(
                  alignment: Alignment.center,
                  child: Text('Or signup with social account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){},
                      child: Icon(Icons.facebook_sharp),
                      style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          backgroundColor: MaterialStateProperty.all(defaultcolor)

                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
                    },
                      child: Icon(Icons.facebook_sharp),
                      style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                      )),
                          backgroundColor: MaterialStateProperty.all(primarycolor)
                      ),
                    )
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Text("Don't have an Account  ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                      },
                      child: Text("Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
