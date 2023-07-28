import 'package:flutter/material.dart';

import '../../Models/listmodel.dart';

class DescScreen extends StatelessWidget {
  // const DescScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController soldController = TextEditingController();


  List<ListModel> listModel = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Description"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(10))),
              // child: Text("${listModel[index].productName}", style: TextStyle(fontWeight: FontWeight.bold),),

            ),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
