import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/detailscreen.dart';
class GridViewBuilder extends StatefulWidget {
  const GridViewBuilder({Key? key}) : super(key: key);

  @override
  State<GridViewBuilder> createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
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
    return Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2/2.2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10), itemCount: name.length ,itemBuilder: (BuildContext context, index){
      return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(detail: name[index],imagePath: "assets/img/img$index.jpg", rating: '3.$index', price: 'Rs 300$index',)));

        },
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(

            children: [
              Container(
                  height:98,
                  width: 172,
                  child: Image.asset('assets/img/img$index.jpg', fit: BoxFit.cover,)
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name[index], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      Text('Rs 300$index', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Text('Sold Items', style: TextStyle(fontSize: 15)),
                          Spacer(),
                          Icon(Icons.star, color: Colors.yellow),
                          Text('3.$index', style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }));
  }
}
