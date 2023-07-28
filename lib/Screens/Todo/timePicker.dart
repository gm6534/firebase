import 'package:firebase/Models/listmodel.dart';
import 'package:firebase/Screens/Todo/todo.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  List<TodoModel>  todoModel= [];






  DateTime? _selectedDate;
  String? _selectedTime;
  Future<void> _show() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.redAccent,
            centerTitle: true,
            title: Text("Add Todo"),
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ))),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(hintText: "Type Your Title",
                      border: OutlineInputBorder(), labelText: "Title"),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: subtitleController,
                  decoration: const InputDecoration(hintText: "Type Your SubTitle",
                  border: OutlineInputBorder(), labelText: "SubTitle"
                  ),

                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: messageController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: "Type your Message",
                      labelText: "Message",
                      filled: true,
                      // fillColor: Color.fromARGB(255, 221, 212, 212),
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 12,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 12,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 12,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 12,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.cyan,
                          radius: 12,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.deepOrange,
                          radius: 12,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 12,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: _show,
                        child: const Text(
                          'Select Time',
                          style: TextStyle(fontSize: 14),
                        ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(color: Colors.red)),
                    //   padding: EdgeInsets.all(8),
                    //   child: Text(
                    //     _selectedTime != null ? _selectedTime! : 'No selected',
                    //     style: const TextStyle(fontSize: 16, color: Colors.red),
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: _presentDatePicker,
                      child: const Text('Select Date'),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    // ElevatedButton(
                    //     onPressed: _presentDatePicker,
                    //     child: const Text('Select Date'),
                    //   style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
                    // ),
                    // SizedBox(
                    //   width: 8,
                    // ),

                    // display the selected date
                    // Container(
                    //   padding: EdgeInsets.all(8),
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.teal),
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: Text(
                    //       _selectedDate != null
                    //           ? _selectedDate.toString()
                    //           : 'Noselected!',
                    //       style:
                    //       const TextStyle(fontSize: 16, color: Colors.red)),
                    // )
                  ],
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> TodoScreen(titleController, subtitleController, messageController)));
                      titleController.clear();
                      subtitleController.clear();
                      messageController.clear();
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
                    child: Text("Add Todo"))
              ],
            ),
          ),
        ));
  }
}