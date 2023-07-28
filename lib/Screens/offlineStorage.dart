import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfflineStorData extends StatefulWidget {
  @override
  State<OfflineStorData> createState() => _OfflineStorDataState();
}

class _OfflineStorDataState extends State<OfflineStorData> {
  SharedPreferences? prefs;
  TextEditingController productController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String productname = "";
  String description = "";
  String price = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      // appBar: AppBar(
      //   title: const Text("Offline"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Container(
              // height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: productController,
                    decoration: const InputDecoration(
                      hintText: "Product Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      hintText: "Price",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    productname,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
                    child: const Text("Save"),
                    onPressed: () {
                      save();
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
                    child: const Text("Show"),
                    onPressed: () {
                      retrieve();
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }

  save() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString("productname", productController.text.toString());
    prefs!.setString("description", descriptionController.text.toString());
    prefs!.setString("price", priceController.text.toString());
  }

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    productname = prefs!.getString("productname")!;
    description = prefs!.getString("description")!;
    price = prefs!.getString("price")!;
    setState(() {});
  }
}
