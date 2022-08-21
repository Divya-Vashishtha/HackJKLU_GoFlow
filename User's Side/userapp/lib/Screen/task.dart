import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: FaIcon(Icons.person),
          title: const Text(
            'Add a task',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          actions: [
            Icon(
              Icons.more_vert,
              size: 35,
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(15),
                // height: 150,
                child: Center(
                    child: TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ))),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [Text("Task Heading")],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: (TextField(
                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  autocorrect: true,
                  cursorColor: Colors.purple[900],
                  // textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.account_circle),

                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

                    hintText: "Enter Task Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [Text("Task Heading")],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: (TextField(
                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  autocorrect: true,
                  cursorColor: Colors.purple[900],
                  // textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.account_circle),

                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

                    hintText: "Enter Task Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [Text("Task Heading")],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: (TextField(
                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  autocorrect: true,
                  cursorColor: Colors.purple[900],
                  // textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.account_circle),

                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

                    hintText: "Enter Task Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [Text("Task Heading")],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: (TextField(
                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  autocorrect: true,
                  cursorColor: Colors.purple[900],
                  // textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.account_circle),

                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

                    hintText: "Enter Task Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [Text("Task Heading")],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: (TextField(
                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  autocorrect: true,
                  cursorColor: Colors.purple[900],
                  // textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.account_circle),

                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

                    hintText: "Enter Task Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))),
            ),
          
          ],
        ));
  }
}
