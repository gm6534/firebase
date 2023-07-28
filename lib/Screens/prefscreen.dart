import 'dart:convert';
import 'package:firebase/Constant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/listmodel.dart';


class SharedPref extends StatefulWidget {
  const SharedPref({Key? key}) : super(key: key);

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController soldController = TextEditingController();

  List<ListModel> listModel = [];


  void addnewUser(ListModel addnew) {
    setState(() {
      listModel.add(addnew);
    });
  }

  @override
  void getListPref() {
    var listModel = Constants.prefs!.getString("List").toString();
    var abc=jsonDecode(listModel);
    print(abc);

  }

  // void setListPref() {
  //   Constants.prefs!.String("List");
  // }


  void initState() {
    // getListPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {
            getListPref();
            // setListPref();
          },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
              child: Text('Save')),
          ElevatedButton(onPressed: () {
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
                            decoration: InputDecoration(
                                hintText: 'Product Name'),
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
                           Constants.prefs!.setString('List', listModel.toString());
                            Navigator.pop(context);
                            nameController.clear();
                            priceController.clear();
                            // print(listModel);

                          },
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
                          child: Text("Add Items")),
                      SizedBox(
                        width: 6,
                      )
                    ],
                  );

                });
          },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
              child: Text('Add'))

        ],
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
}