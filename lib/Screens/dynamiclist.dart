import 'dart:core';
import 'package:firebase/Models/listmodel.dart';
import 'package:flutter/material.dart';


class DynamicList extends StatefulWidget {

  // const DynamicList({Key? key}) : super(key: key);

  @override
  State<DynamicList> createState() => _DynamicListState();
}

class _DynamicListState extends State<DynamicList> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
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
                    "Add New Item",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  content: Container(
                    height: 130,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(hintText: 'Product Name'),
                        ),
                        TextFormField(
                          controller: priceController,
                          decoration: InputDecoration(hintText: 'Price'),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    InkWell(
                        radius: 20,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel")),
                    ElevatedButton(
                        onPressed: () {
                          addnewUser(ListModel(
                              productName: nameController.text,
                              price: priceController.text,

                   ));
                          // setState((){
                          // });
                          // setListPref();
                          Navigator.pop(context);
                          nameController.clear();
                          priceController.clear();
                          // print(listModel);


                        },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),

                        child: Text("Add")),
                    SizedBox(
                      width: 6,
                    )
                  ],
                );

                // return AddFruitDialog(addfruits: addfruits)
              });
        },
      ),
      body: Center(
          child: ListView.builder(
              itemCount: listModel.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(

                        title: Text("${listModel[index].productName}"),
                      subtitle: Text("${listModel[index].price}"),
                    ));
              })),
    );
  }
  // Future<void> setlistModel(addnew) async{
  //   final SharedPreferences pref= await SharedPreferences.getInstance();
  //   pref.setString('listModel', addnew);
  // }
}
