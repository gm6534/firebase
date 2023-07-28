// import 'dart:core';
// import 'package:firebase/Models/listmodel.dart';
// import 'package:flutter/material.dart';
//
// import 'timePicker.dart';
//
//
// class TodoScreen extends StatefulWidget {
//
//   // const TodoScreen({Key? key}) : super(key: key);
//
//   @override
//   State<TodoScreen> createState() => _TodoScreenState();
// }
//
// class _TodoScreenState extends State<TodoScreen> {
//
//   TextEditingController titleController = TextEditingController();
//   TextEditingController subtitleController = TextEditingController();
//   TextEditingController messageController = TextEditingController();
//
//   List<TodoModel> todoModel = [];
//   // List<dynamic> list=[];
//
//   void addnewTask(TodoModel addnew) {
//     setState((){
//       todoModel.add(addnew);
//     });
//
//   }
//   // void setListPref(){
//   //   Constants.prefs!.setString("List", jsonEncode(listModel));
//   // }
//   // void getListPref(){
//   //   list = jsonDecode(Constants.prefs!.getString("List").toString());
//   // }
// // @override
//   // void initState() {
//   //   // setListPref();
//   //   getListPref();
//   //   super.initState();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.redAccent,
//       ),
//
//       // appBar: AppBar(
//       //   elevation: 0,
//       //   backgroundColor: Colors.blue,
//       //   actions:[
//       //     IconButton(onPressed: (){
//       //     Navigator.pop(context);
//       //   }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),],
//       // ),
//       //Drawer
//       // drawer: CustomDrawer(),
//       //Floating Action Button
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.redAccent,
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=> AddTask()));
//         },
//       ),
//       body: Center(
//           child: ListView.builder(
//               itemCount: todoModel.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                     child: Row(
//                       children: [
//                         Column(
//                           children: [
//                             Text("${todoModel[index].title}"),
//                             Text("${todoModel[index].subtitle}"),
//                             Text("${todoModel[index].message}"),
//                           ],
//                         )
//                       ]
//                     ));
//               })),
//     );
//   }
// // Future<void> setlistModel(addnew) async{
// //   final SharedPreferences pref= await SharedPreferences.getInstance();
// //   pref.setString('listModel', addnew);
// // }
// }


import 'dart:core';
import 'package:firebase/Models/listmodel.dart';
import 'package:flutter/material.dart';

import 'description.dart';


class TodoScreen extends StatefulWidget {
  TodoScreen(TextEditingController titleController, TextEditingController subtitleController, TextEditingController messageController);


  // const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController soldController = TextEditingController();

  List<ListModel> listModel = [];
  List<String> dummy=[];
  // List<dynamic> list=[];

  void addnewUser(ListModel addnew) {
    setState((){
      listModel.add(addnew);
    });

  }
  // void setListPref(){
  //   Constants.prefs!.setString("List", jsonEncode(listModel));
  // }
  // void getListPref(){
  //   list = jsonDecode(Constants.prefs!.getString("List").toString());
  // }
// @override
  // void initState() {
  //   // setListPref();
  //   getListPref();
  //   super.initState();
  // }

  DateTime? _selectedDate;
  String? _selectedTime;
  Future<void> _show() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text("Todo List"),
      ),

      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.blue,
      //   actions:[
      //     IconButton(onPressed: (){
      //     Navigator.pop(context);
      //   }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),],
      // ),
      //Drawer
      // drawer: CustomDrawer(),
      //Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    "Add Todo",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  content: Container(
                    height: 400,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(hintText: 'Title'),
                          ),
                          TextFormField(
                            controller: priceController,
                            decoration: InputDecoration(hintText: 'Subtitle'),
                          ),
                          TextFormField(
                            controller: soldController,
                            decoration: InputDecoration(hintText: 'Message'),
                          ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 12,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 12,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 12,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.teal,
                                radius: 12,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.cyan,
                                radius: 12,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                radius: 12,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _show,
                            child: const Text(
                              'Select Time',
                              style: TextStyle(fontSize: 14),
                            ),
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  radius: 20,
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel")),
                              SizedBox(width: 10,),
                              ElevatedButton(
                                  onPressed: () {
                                    addnewUser(ListModel(
                                      productName: nameController.text,
                                      price: priceController.text,
                                      sold: soldController.text,


                                    ));
                                    // setState((){
                                    // });
                                    // setListPref();
                                    Navigator.pop(context);
                                    nameController.clear();
                                    priceController.clear();
                                    soldController.clear();
                                    // print(listModel);


                                  },
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),

                                  child: Text("Add")),
                              SizedBox(
                                width: 6,
                              )
                            ],
                          )

                  ]),
                    ),

                ));

                // return AddFruitDialog(addfruits: addfruits)
              });
        },
      ),
      body: Center(
          child: ListView.builder(
              itemCount: listModel.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DescScreen()));
                  },
                  child: Card(
                      child: Container(
                        height: 70,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text("${listModel[index].productName}", style: TextStyle(fontWeight: FontWeight.bold),),
                                Text("${listModel[index].price}"),
                                Text("${listModel[index].sold}"),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.edit),
                            SizedBox(width: 10,),
                            Icon(Icons.alarm),
                            SizedBox(width: 15,),
                          ],
                        ),
                      )),
                );
              })),
    );
  }
// Future<void> setlistModel(addnew) async{
//   final SharedPreferences pref= await SharedPreferences.getInstance();
//   pref.setString('listModel', addnew);
// }
}
