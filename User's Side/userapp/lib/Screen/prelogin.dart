import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/Screen/login.dart';

class Prelogin extends StatefulWidget {
  const Prelogin({Key? key}) : super(key: key);

  @override
  State<Prelogin> createState() => _PreloginState();
}

class _PreloginState extends State<Prelogin> {
  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: Column(
          children: [
          // Center(
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Welcome to ToDo",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                )
              ],
            ),
          // ),
          SizedBox(height: 100),
          Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        // decoration: BoxDecoration(color: Colors.orange),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.book,
                                size: 45,
                                color: Colors.blue,
                              )
                            ]),
                      ),
                      Container(
                        height: 70,
                        width: 270,
                        // decoration: BoxDecoration(color: Colors.green),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create tasks fast and easily",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Input tasks, subtasks and repeating tasks",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        // decoration: BoxDecoration(color: Colors.orange),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                Icons.timelapse,
                                size: 45,
                                color: Colors.blue,
                              )
                            ]),
                      ),
                      Container(
                        height: 70,
                        width: 270,
                        // decoration: BoxDecoration(color: Colors.green),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Task Remainders",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Set reminders, and never miss important things",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        // decoration: BoxDecoration(color: Colors.orange),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.widgets,
                                size: 45,
                                color: Colors.blue,
                              )
                            ]),
                      ),
                      Container(
                        height: 70,
                        width: 270,
                        // decoration: BoxDecoration(color: Colors.green),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Presonized Widgets",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Create widgets and view your tasks more easily",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                   Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        // decoration: BoxDecoration(color: Colors.orange),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              Icons.color_lens,
                              size: 45,
                             color: Colors.blue,
                           )
                          ]
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 270,
                        // decoration: BoxDecoration(color: Colors.green),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Custom Themes",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            Text("choose the theme you like and start your day",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 160,),
                  Column(
                    children: [
                      ButtonTheme(
                        minWidth: 200,
                        child: RaisedButton(  
                          child: Text("Continue", style: TextStyle(fontSize: 20),),  
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Login())
                            );
                          },
                          color: Colors.blue,  
                          textColor: Colors.white,  
                          padding: EdgeInsets.all(8.0),  
                          splashColor: Colors.white, 
                          
                        ),
                      )  
                    ],
                  )
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
