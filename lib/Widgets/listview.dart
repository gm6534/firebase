import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/detailscreen.dart';
class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  List name = [
    "Winter Shirt",
    "Summer T-Shirt",
    "T-Shirt",
    "T Shirt",
    "Boys T-Shirt",
    "Girls T-Shirt",
    "Kids Shirt",
    "Shirt",

  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemCount: name.length, itemBuilder: (cotext, index){
        return InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(
              builder: (context)=>DetailScreen(
                detail: name[index],
                imagePath: "assets/img/img$index.jpg",
                rating: '3.$index',
                price: 'Rs 300$index',)));},
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 32,
                    backgroundImage: AssetImage('assets/img/img$index.jpg'),
                  ),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name[index], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      Text('Sold Items', style: TextStyle(fontSize: 15)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text('3.$index', style: TextStyle(fontWeight: FontWeight.bold),)

                        ],
                      ),

                    ],

                  ),
                  Expanded(child: Text('Rs 300$index', textAlign: TextAlign.right, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
                ],
              ),
              Divider()
            ],
          ),
        );
      }),
    );
  }
}
