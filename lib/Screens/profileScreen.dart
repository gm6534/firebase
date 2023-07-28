import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController? fullnamecontroller = TextEditingController();
  TextEditingController? emailcontroller = TextEditingController();
  TextEditingController? numbercontroller = TextEditingController();
  TextEditingController? addresscontroller = TextEditingController();
  String? imgUrl;

  PickedFile? _imageFile;
  final _formkey=GlobalKey<FormState>();
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    upload();
  }
  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.transparent,
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: _imageFile == null
                          ? null
                          : FileImage(File(_imageFile!.path)),

                    ),
                    Positioned(
                        left: 120,
                        bottom: 10,
                        child: Opacity( opacity: 0.5,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.redAccent,
                          ),
                        )),

                    Positioned(
                      left: 116,
                        bottom: 8,
                        child: IconButton(
                          tooltip: "Change Image",
                            onPressed: (){
                                showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Container(
                                      height: 120,
                                      width: 30,
                                      child: Column(
                                        children: [
                                          Text("Choose Image", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.redAccent),),
                                          SizedBox(height: 15,),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: () async{
                                                  final pickedFile = await ImagePicker().getImage(source: ImageSource.camera,imageQuality: 20);
                                                  setState(() {
                                                    _imageFile = pickedFile;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Icon(Icons.camera_rounded, size: 40,),
                                                    SizedBox(height: 10,),
                                                    Text("Camera", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async{
                                                  final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 20);
                                                  setState(() {
                                                    _imageFile = pickedFile;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Icon(Icons.image_outlined, size: 40,),
                                                    SizedBox(height: 10,),
                                                    Text("Gallery", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                  );
                                });
                            },
                            icon: Icon(Icons.add_a_photo_rounded, size: 30, color: Colors.white, ))),

                  ],
                ),
              ),

            ),

            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formkey,
                  child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(hintText: "Enter Full Name", border: OutlineInputBorder(), labelText: "Name", prefixIcon: Icon(Icons.person)),
                    controller: fullnamecontroller,
                    validator:(val){
                      if (val== null || val==""){
                        return "Required*";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "Enter Email", border: OutlineInputBorder(), labelText: "Email", prefixIcon: Icon(Icons.alternate_email_outlined)),
                    controller: emailcontroller,
                    validator:(val){
                      if (val== null || val==""){
                        return "Required*";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: "Enter Mobile Number", border: OutlineInputBorder(), labelText: "Mobile", prefixIcon: Icon(Icons.phone)),
                    controller: numbercontroller,
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Enter Address", border: OutlineInputBorder(), labelText: "Address", prefixIcon: Icon(Icons.location_on_sharp)),
                    controller: addresscontroller,

                  ),
                ],
              )),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () async{

              if(_formkey.currentState!.validate()) {
                // try {
                // print(emailcontroller!.text);
                // print(passwordcontroller!.text);
                // await _auth
                //     .createUserWithEmailAndPassword(
                //     email: emailcontroller!.text, password: passwordcontroller!.text).then((uid) => sendDataToFireStore()).catchError((e){
                //   print(e);
                // });
                uploadImage();
                updateDataToFireStore();

              }

            },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
                child: Text("Update")
            )
          ],
        ),
      ),

    );
  }
  updateDataToFireStore() async{
    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    User? user=_auth.currentUser;
    await firebaseFirestore.collection("user").doc(user!.uid).update({
      "full_name":fullnamecontroller!.text,
      "email":emailcontroller!.text,
      "mobile_number":numbercontroller!.text,
      "address":addresscontroller!.text,
      "image_url":imgUrl,

    });
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile Updated")));
}
  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    // final _imagePicker = ImagePicker();
    // PickedFile image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //Select Image
      // image = await _imagePicker.getImage(source: ImageSource.gallery);
      var file = File(_imageFile!.path);

      if (_imageFile != null){
        //Upload to Firebase
        await _firebaseStorage.ref()
            .child('images/imageName')
            .putFile(file);
        // var downloadUrl = await snapshot.ref.getDownloadURL();
        // setState(() {
        //   imageUrl = downloadUrl;
        // });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }
  upload() async {
    final _firebaseStorage = FirebaseStorage.instance;

    var file = File(_imageFile!.path);
    if (_imageFile != null) {
      var snapshot = await _firebaseStorage.ref()
          .child('images/imageName')
          .putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        imgUrl = downloadUrl;
      });
      print(imgUrl);

    } else {
      print('Not Found');
    }
  }
}
