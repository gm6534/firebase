import 'dart:math' as math;
import 'package:firebase/Models/listmodel.dart';
import 'package:firebase/Widgets/triangleChatWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  TextEditingController chatController = TextEditingController();

  List<ChatModel> chatModel = [];

  void addnewMessage(ChatModel addnew) {
    setState((){
      chatModel.add(addnew);
    });

  }
  List message = [
    "Hi",
    "Fine",
    "I am Typing",
  ];
  bool show = false;
  FocusNode focusNode = FocusNode();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          backgroundColor: Colors.redAccent,
          title: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                onTap: (){},
                child: Row(
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 5,),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/img/myPic.jpg"),
                    ),
                    SizedBox(width: 5,)
                  ],
                ),
              ),
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Chat"),
                  Text("last scene today at 7:00 pm", style: TextStyle(fontSize: 10),),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.videocam), tooltip: "Video Call",),
            IconButton(onPressed: (){}, icon: Icon(Icons.call), tooltip: "Audio Call",),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined), tooltip: "More Options",),
          ],
        ),
        body: Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img/wallpaper.jpg"), fit: BoxFit.cover)),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: chatModel.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // BubbleSpecialOne(
                            //   text: '${chatModel[index].chat}',
                            //   isSender: true,
                            //   color: Colors.redAccent,
                            //   textStyle: TextStyle(
                            //     fontSize: 20,
                            //     color: Colors.white,
                            //     fontStyle: FontStyle.italic,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),


                            // Sender Message.....
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    margin: const EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(19),
                                        bottomLeft: Radius.circular(19),
                                        bottomRight: Radius.circular(19),
                                      ),
                                    ),
                                    child: Text("${chatModel[index].chat}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                                CustomPaint(painter: Triangle(Colors.redAccent)),
                              ],
                            ),
// ReceiverMessage
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(math.pi),
                                  child: CustomPaint(
                                    painter: Triangle(Colors.grey.shade300),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    margin: const EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(19),
                                        bottomLeft: Radius.circular(19),
                                        bottomRight: Radius.circular(19),
                                      ),
                                    ),
                                    child: Text(message[index],
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                          ],
                        ),
                      );
                    }

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.78,
                          decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.redAccent, width: 1.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Scrollbar(
                            thumbVisibility: true,
                            trackVisibility: true,
                            child: TextFormField(
                              minLines: 1,
                              maxLines: 5,

                              keyboardType: TextInputType.multiline,
                              textAlign: TextAlign.start,
                              controller: chatController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 50,top: 6,bottom: 6),
                                hintText: "Type your message here",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: IconButton(onPressed: (){
                            if (!show) {
                              focusNode.unfocus();
                              focusNode.canRequestFocus = false;
                            }
                            setState(() {
                              show = !show;
                            });
                          },
                            icon: Icon(show
                                ? Icons.keyboard
                                : Icons.emoji_emotions_outlined,color: show?Colors.redAccent:Colors.orange),),),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: (){
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (builder)=> bottomsheet());
                            },
                            icon: Icon(Icons.attach_file, color: Colors.redAccent,)),)
                      ],
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.redAccent,
                      child: IconButton(
                          onPressed: (){
                            addnewMessage(ChatModel(
                              chat: chatController.text,
                            ));
                            chatController.clear();
                          },
                          icon: Icon(Icons.send, color: Colors.white,)),
                    ),                  ],
                ),
              ),
            ],
          ),
        ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.redAccent,
      //   onPressed: (){},
      //   child: IconButton(onPressed: (){}, icon: Icon(Icons.attach_file),),
      // ),

    );
  }
  Widget bottomsheet(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Container(
        height: 278,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.all(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCreation(Icons.insert_drive_file, Colors.indigo, "Document"),
                    SizedBox(width: 40,),
                    InkWell(
                    onTap: () async{
                      await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 20);
                    },
                    child: iconCreation(Icons.camera_alt, Colors.pink, "Camera")),
                    SizedBox(width: 40,),
                    InkWell(onTap:() async{

                      await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 20);

                    },
                        child: iconCreation(Icons.insert_photo, Colors.purple, "Gallery")),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCreation(Icons.headset, Colors.orange, "Audio"),
                    SizedBox(width: 40,),
                    iconCreation(Icons.location_pin, Colors.teal, "Location"),
                    SizedBox(width: 40,),
                    iconCreation(Icons.person, Colors.blue, "Contact"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget iconCreation(IconData icon, Color color, String text){
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
            size: 29,
          ),
        ),
        SizedBox(height: 5,),
        Text(text, style: TextStyle(
          fontSize: 12
        ),)
      ],
    );
  }

}
