// import 'package:firebase/Screens/Todo/timePicker.dart';
// import 'package:flutter/material.dart';
//
// class TodoRemainder extends StatelessWidget {
//   const TodoRemainder({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.redAccent,
//         title: const Text(
//           "Todo",
//           style: TextStyle(
//               fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Center(
//         child: ListView.builder(
//             itemCount: 1,
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.all(6),
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                         color: Colors.yellow.shade600,
//                         borderRadius: BorderRadius.circular(4),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.grey,
//                             offset: Offset(0, 6),
//                             blurRadius: 12,
//                           )
//                         ]),
//                     child: Row(
//                       children: [
//                         // const CircleAvatar(
//                         //   backgroundColor: Colors.amber,
//                         //   radius: 32,
//                         // ),
//                         const SizedBox(
//                           width: 12,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               "Task Name",
//                               style: TextStyle(
//                                   fontSize: 24, fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "SubTitle",
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             ),
//                             Text("Description")
//                           ],
//                         ),
//                         const Spacer(),
//                         const Icon(Icons.edit),
//                         const SizedBox(
//                           width: 8,
//                         ),
//                         // Icon(Icons.alarm),
//                       ],
//                     ),
//                   ),
//                   ///2nd Container
//                   Container(
//                     margin: EdgeInsets.all(6),
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//               color: Colors.greenAccent,
//               borderRadius: BorderRadius.circular(4),
//               boxShadow: const [
//               BoxShadow(
//               color: Colors.grey,
//               offset: Offset(0, 6),
//               blurRadius: 12,
//               )
//               ]),
//               child: Row(
//               children: [
//               // const CircleAvatar(
//               //   backgroundColor: Colors.amber,
//               //   radius: 32,
//               // ),
//               const SizedBox(
//               width: 12,
//               ),
//               Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//               Text(
//               "Task Name",
//               style: TextStyle(
//               fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               Text(
//               "SubTitle",
//               style: TextStyle(
//               fontSize: 16,
//               ),
//               ),
//               Text("Description")
//               ],
//               ),
//               const Spacer(),
//               const Icon(Icons.edit),
//               const SizedBox(
//               width: 8,
//               ),
//               Icon(Icons.alarm),
//               ],
//               ),
//               ),
//                   ///3rd Container
//
//                   Container(
//                     margin: EdgeInsets.all(6),
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                         color: Colors.teal,
//                         borderRadius: BorderRadius.circular(4),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.grey,
//                             offset: Offset(0, 6),
//                             blurRadius: 12,
//                           )
//                         ]),
//                     child: Row(
//                       children: [
//                         // const CircleAvatar(
//                         //   backgroundColor: Colors.amber,
//                         //   radius: 32,
//                         // ),
//                         const SizedBox(
//                           width: 12,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               "Task Name",
//                               style: TextStyle(
//                                   fontSize: 24, fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "SubTitle",
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             ),
//                             Text("Description")
//                           ],
//                         ),
//                         const Spacer(),
//                         const Icon(Icons.edit),
//                         const SizedBox(
//                           width: 8,
//                         ),
//                         // Icon(Icons.alarm),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             }),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.red,
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => AddTask()));
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }