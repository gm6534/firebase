import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../Constant/colors.dart';


class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {


  List data = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "https://mocki.io/v1/db49725b-2893-4651-b5bd-0be6ee7228b6";
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if(response.statusCode == 200){
      var items = json.decode(response.body)['transactions'];
      setState(() {
         data= items;
        isLoading = false;
      });
    }else{
       data= [];
      isLoading = false;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
          Color.fromARGB(255,226,226,226),
          Color.fromARGB(255, 145, 144, 142),
        ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(backgroundColor: Colors.orange, child: Text("MS", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),),
                    TextButton(onPressed: (){}, child: Text("Account", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
                    TextButton(onPressed: (){}, child: Text("Budget", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
                    TextButton(onPressed: (){}, child: Text("Analytics", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
                    TextButton(onPressed: (){}, child: Text("Finance", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Text("Transactions", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("Cashflow this week: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    Text("Good: ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    Text("- £250", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    SizedBox(width: 15,)
                  ]
                ),
                SizedBox(height: 10,),
                Container(
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(width: 0, style: BorderStyle.solid), borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                  ),
                ),
                 SizedBox(height: 20,),
              (data.contains(null) || data.length < 0 || isLoading)?
       Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(backgroundcolor),))
                  : Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromARGB(255,226,226,226),
                                Color.fromARGB(255, 145, 144, 142),
                              ])
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: backgroundcolor,
                                borderRadius: BorderRadius.circular(60/2),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(data[index]['company_logo'])
                                )
                            ),
                          ),
                          title: Text(data[index]['company_name'], style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text( DateFormat('yyyy-mm-dd').format(DateTime.parse(data[index]['date']))),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 8,),
                              Text(data[index]['amount'].toString().replaceAll('Â', ''), style: TextStyle(color: data[index]['amount'].toString().contains("+")?Colors.green:Colors.red, fontWeight: FontWeight.bold)),
                              SizedBox(height: 8,),
                              Text(data[index]['card'].toString().replaceRange(1, 10, "*"*10), style: TextStyle(color: Colors.grey.shade700,))
                            ],
                          ),

                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
