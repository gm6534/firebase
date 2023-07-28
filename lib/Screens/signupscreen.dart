
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Screens/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../Constant/colors.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isHidden=true;

  TextEditingController? fullnamecontroller = TextEditingController();
  TextEditingController? emailcontroller = TextEditingController();
  TextEditingController? passwordcontroller = TextEditingController();
  TextEditingController? confirmpasswordcontroller = TextEditingController();



  final _formkey=GlobalKey<FormState>();
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  final _auth = FirebaseAuth.instance;

  // String email = "";
  // String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Create an Account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Full Name"),
                    controller: fullnamecontroller,
                    validator:(val){
                      if (val== null || val==""){
                        return "Name Required";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Email"),
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
                  TextFormField(

                    decoration: InputDecoration(hintText: "Password",
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState((){
                                isHidden=!isHidden;
                              });
                            }, icon: Icon(isHidden?Icons.visibility_off_outlined:Icons.visibility))
                    ),
                    controller: passwordcontroller,
                    obscureText: isHidden,
                    validator:(val){
                      if (val== null || val==""){
                        return "Required";
                      }else if(val.length < 8){
                        return "Must be 8 Character";
                      }
                      else{
                        return null;
                      }
                    },

                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Confirm Password",

                    ),
                    controller: confirmpasswordcontroller,
                    obscureText: isHidden,
                    validator:(val){
                      if (val== null || val==""){
                        return "Required ";
                      }
                      else if(passwordcontroller?.text != confirmpasswordcontroller?.text){
                        return "Password not Matched";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,

                    child: ElevatedButton(
                        onPressed: ()
                       async {
                          if(_formkey.currentState!.validate()) {
                            // try {
                            // print(emailcontroller!.text);
                            // print(passwordcontroller!.text);
                            await _auth
                                .createUserWithEmailAndPassword(
                                email: emailcontroller!.text, password: passwordcontroller!.text).then((uid) => sendDataToFireStore()).catchError((e){
                                  print(e);
                            });
                          }
                        },
                        // if(_formkey.currentState!.validate()){
                        //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully Created\nPlease Login")));
                        //
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                        //     }


                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(defaultcolor),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                        ),
                        child: Text("Sign Up",
                            style: TextStyle(fontWeight: FontWeight.bold)
                        )
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("OR"),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                      child: Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
                  SizedBox(height: 30),
                  SignInButton(
                    Buttons.google,
                    onPressed: () {},
                  ),
                  SignInButton(
                      Buttons.facebook,
                      onPressed: (){}
                  )

                ]//Children
              ),
            ),
          ),
        ),
      )
    );
  }
  sendDataToFireStore() async{
    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    User? user=_auth.currentUser;
    await firebaseFirestore.collection("user").doc(user!.uid).set({
      "full_name":fullnamecontroller!.text,
      "email":emailcontroller!.text,
      "password":passwordcontroller!.text
    });
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
            "Successfully Created\nPlease Login")));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);
  }
}
