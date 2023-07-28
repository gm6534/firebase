import 'package:flutter/material.dart';

class JazzCashScreen extends StatelessWidget {
  const JazzCashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        automaticallyImplyLeading: false,
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text("JazzCash", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        ),
        actions: [
          Icon(Icons.help_outline_rounded),
          SizedBox(width: 20,),
          Icon(Icons.notifications_none_rounded),
          SizedBox(width: 20,),
        ],
        shape: Border(
            bottom: BorderSide(
                color: Colors.grey.shade700,
                width: 1
            )
        ),
      ),
      body: SingleChildScrollView(
        ///Body Column
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.yellow.shade700,
                          radius: 25,
                          child: CircleAvatar(
                            backgroundColor: Colors.black87,
                            radius: 23,
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/img/myPic.jpg"),

                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text("Ghulam",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                        Spacer(),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                            onPressed: (){},
                            child: Text("Loan", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow.shade700),))
                      ],),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text("Rs. 0", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                            Baseline(
                                baseline: 12,
                                baselineType: TextBaseline.alphabetic,
                                child: Text(".00", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),)),
                          ],
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                            child: CircleAvatar(
                              backgroundColor: Colors.red.shade600,
                              radius: 12,
                              child: Text("!",style: TextStyle(fontWeight: FontWeight.bold),),)),
                        SizedBox(width: 10,),
                        InkWell(
                          child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.grey.shade800,
                              child: Icon(Icons.cached_rounded, color: Colors.yellow.shade700,)),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red.shade800),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                            onPressed: (){},
                            child: Row(
                              children: [
                                Icon(Icons.add,),
                                Text("   Add Money", style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            )),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.grey.shade700),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                            onPressed: (){},
                            child: Row(
                              children: [
                                Icon(Icons.wallet_sharp,),
                                Text("   My Account", style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ///Main Column
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("My JazzCash", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
                     ElevatedButton(
                         style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
                             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                         onPressed: (){},
                         child: Row(
                           children: [
                             Icon(Icons.edit, size: 20, color: Colors.black,),
                             Text("  Edit", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                           ],
                         ))
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     ///Money Transfer
                     Container(
                       height: 140,
                       child: Column(
                         children: [
                           Card(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                             child: Container(
                               height: 65,
                               width: 65,
                               child: Icon(Icons.send),
                             ),
                           ),
                           SizedBox(height: 10,),
                           Text("Money\nTransfer", textAlign: TextAlign.center,)
                         ],
                       ),
                     ),

                     ///Utility Bills
                     Container(
                       height: 140,
                       child: Column(
                         children: [
                           Card(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                             child: Container(
                               height: 65,
                               width: 65,
                               child: Icon(Icons.panorama_vertical),
                             ),
                           ),
                           SizedBox(height: 10,),
                           Text("Utility Bills", textAlign: TextAlign.center,)
                         ],
                       ),
                     ),

                     ///Mobile Load
                     Container(
                       height: 140,
                       child: Column(
                         children: [
                           Card(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                             child: Container(
                               height: 65,
                               width: 65,
                               child: Icon(Icons.mobile_friendly_sharp),
                             ),
                           ),
                           SizedBox(height: 10,),
                           Text("Mobile\nLoad &\nPackages", textAlign: TextAlign.center,)
                         ],
                       ),
                     ),

                     ///Banking and Finance
                     Container(
                       height: 140,
                       child: Column(
                         children: [
                           Card(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                             child: Container(
                               height: 65,
                               width: 65,
                               child: Icon(Icons.currency_exchange_outlined),
                             ),
                           ),
                           SizedBox(height: 10,),
                           Text("Banking &\nFinance", textAlign: TextAlign.center,)
                         ],
                       ),
                     ),
                   ],
                 ),
                 Align(
                     alignment: Alignment.topLeft,
                     child: Text("Top Picks for You", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                 SizedBox(height: 10,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     ///Jazzcash DebitCard
                     Stack(
                       children: [
                         Container(
                           height: 140,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Card(
                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                 child: Container(
                                   height: 65,
                                   width: 65,
                                   child: Icon(Icons.credit_card_rounded),
                                 ),
                               ),
                               SizedBox(height: 10,),
                               Text("JazzCash\nDebit Card", textAlign: TextAlign.center,),

                             ],
                           ),
                         ),
                         Positioned(
                             top: 5,
                             left: 12,
                             right: 12,
                             child: Card(
                               color: Colors.yellow.shade800,
                               child: Container(
                                   height: 20,
                                   width: 40,
                                   child: Text("New", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                             )),
                       ],
                     ),

                     ///Mobile Packages
                     Stack(
                       children: [
                         Container(
                           height: 140,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Card(
                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                 child: Container(
                                   height: 65,
                                   width: 65,
                                   child: Icon(Icons.card_giftcard_rounded),
                                 ),
                               ),
                               SizedBox(height: 10,),
                               Text("Mobile\nPackages", textAlign: TextAlign.center,),

                             ],
                           ),
                         ),
                         Positioned(
                             top: 5,
                             left: 12,
                             right: 12,
                             child: Card(
                               color: Colors.yellow.shade800,
                               child: Container(
                                   height: 20,
                                   width: 40,
                                   child: Text("New", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                             )),
                       ],
                     ),

                     ///Khelo aur Jeeto
                     Stack(
                       children: [
                         Container(
                           height: 140,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Card(
                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                 child: Container(
                                   height: 65,
                                   width: 65,
                                   child: Icon(Icons.gamepad_rounded),
                                 ),
                               ),
                               SizedBox(height: 10,),
                               Text("Khelo Aur\nJeeto", textAlign: TextAlign.center,),

                             ],
                           ),
                         ),
                         Positioned(
                             top: 5,
                             left: 12,
                             right: 12,
                             child: Card(
                               color: Colors.yellow.shade800,
                               child: Container(
                                   height: 20,
                                   width: 40,
                                   child: Text("New", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                             )),
                       ],
                     ),

                     ///Raast
                     Stack(
                       children: [
                         Container(
                           height: 140,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Card(
                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                 child: Container(
                                   height: 65,
                                   width: 65,
                                   child: Icon(Icons.house_rounded),
                                 ),
                               ),
                               SizedBox(height: 10,),
                               Text("Raast\n", textAlign: TextAlign.center,),

                             ],
                           ),
                         ),
                         Positioned(
                             top: 5,
                             left: 12,
                             right: 12,
                             child: Card(
                               color: Colors.yellow.shade800,
                               child: Container(
                                   height: 20,
                                   width: 40,
                                   child: Text("New", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                             )),
                       ],
                     ),
                   ],
                 ),
                 ///Invite Section
                 Align(
                     alignment: Alignment.topLeft,
                     child: Text("Invite & Earn", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                 SizedBox(height: 10,),
                 Card(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                   child: Container(
                     height: 180,
                     width: MediaQuery.of(context).size.width,
                     child: Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Total Earnings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                   SizedBox(height: 15,),
                                   Text("Rs. 0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                                 ],
                               ),
                               Container(
                                 height: 70,
                                 width: 70,
                                 child: Image.asset("assets/img/Coins.png"),
                               ),
                             ],
                           ),
                         ),
                         SizedBox(height: 10,),
                         Container(
                           width: 280,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               LinearProgressIndicator(
                                 backgroundColor: Colors.grey.shade300,
                                 value: 0.2,
                                 valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow.shade800),
                                 minHeight: 9,
                               ),
                               SizedBox(height: 10,),
                               Text("Start Inviting your friends to earn", style: TextStyle(color: Colors.grey),)
                             ],
                           ),
                         ),

                       ],
                     ),
                   ),
                 ),
                 ///Invite Section Closed

                 SizedBox(height: 20,),
                 Align(
                     alignment: Alignment.topLeft,
                     child: Text("Latest Updates", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                 SizedBox(height: 10,),
                 ///Latest Updates
                 ClipRRect(
                     borderRadius: BorderRadius.circular(15),
                     child: Image.asset("assets/img/Offers.png", fit: BoxFit.cover,)),
                 ///Latest Updates Closed


               ],
              ),
            )
            ///Main Column Closed
          ],
        ),
        ///Body Column Closed
      ),
    );
  }
}
