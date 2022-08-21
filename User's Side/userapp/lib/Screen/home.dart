import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/Screen/login.dart';
import 'package:todo/Screen/task.dart';
import 'package:todo/models/cart_model.dart';
import 'package:todo/models/usermodel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: FaIcon(Icons.person),
        title: const Text(
          'GO FLOW',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          Icon(
            Icons.more_vert,
            size: 35,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("${loggedInUser.fullName}"),
              accountEmail: Text("${loggedInUser.email}"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Friends'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Request'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Policies'),
              onTap: () => null,
            ),
            Divider(),
            ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 45,
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Task()))
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'image/logo.png',
                    ),
                    Text('Hey',
                        style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                    UserAccountsDrawerHeader(
                      accountName: Text("${loggedInUser.fullName}"),
                      accountEmail: Text("${loggedInUser.email}"),
                      // otherAccountsPictures: [
                      //   Image(image:Image.network())
                      // ],
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: NetworkImage(
                                "${loggedInUser.link}")
                                ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // Text('Front-end Developer',
                    //     style: TextStyle(
                    //         fontSize: 15.0,
                    //         fontWeight: FontWeight.w500,
                    //         color: Colors.grey[600])),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 15.0),
              Container(
                  child: Row(
                children: [
                  new GestureDetector(
                    onTap: () {
                      // MaterialPageRoute(builder: (context) => Cart()),
                      print("Container clicked");
                    },
                    child: Expanded(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                          // border: BorderRadius.circular(10),
                        ),
                        // margin: EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                        padding: EdgeInsets.all(20),
                        child: Row(children: [
                          Image.asset(
                            'image/qr.jpg',
                            // width: 10,
                            // height: 10,
                          ),
                          // Column(
                          //   children: [
                          //     // Image(image: Image.asset(' image/mark'),),
                          //     Text(
                          //       "Mark\nAttendance",
                          //       style: TextStyle(
                          //           fontSize: 12, fontWeight: FontWeight.bold),
                          //     ),
                          //     Text("Icons")
                          //   ],
                          // )
                        ]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  new GestureDetector(
                    onTap: () {
                      print("Container clicked");
                      //  Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Get()),
                      //   );
                    },
                    child: Expanded(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                          // border: BorderRadius.circular(10),
                        ),
                        // margin: EdgeInsets.symmetric(horizontal: , vertical: 0),
                        padding: EdgeInsets.all(20),
                        child: Row(children: [
                          Image.asset(
                            'image/b_w.png',
                            width: 20,
                            height: 20,
                          ),
                          // Image.network("Image"),
                          // Column(
                          //   children: [
                          //     Text(
                          //       "Check\n Attendance",
                          //       style: TextStyle(
                          //           fontSize: 12, fontWeight: FontWeight.bold),
                          //     ),
                          //     Text("Icon")
                          //   ],
                          // )
                        ]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  new GestureDetector(
                    onTap: () {
                      print("Container clicked");
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Get()),
                      //   );
                    },
                    child: Expanded(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                          // border: BorderRadius.circular(10),
                        ),
                        // margin: EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                        padding: EdgeInsets.all(20),
                        child: Row(children: [
                          // Image.network("Image"),
                          Image.asset(
                            'image/profile_icon.png',
                            width: 50,
                            height: 50,
                          ),
                          // Column(
                          //   children: [
                          //     Text(
                          //       "Request\nA Leave",
                          //       style: TextStyle(
                          //           fontSize: 12, fontWeight: FontWeight.bold),
                          //     ),
                          //     Text("Icon")
                          //   ],
                          // )
                        ]),
                      ),
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 15.0),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       _makeCategoryContainer('For you', 1),
              //       _makeCategoryContainer('Popular', 2),
              //       _makeCategoryContainer('title3', 3),
              //       _makeCategoryContainer('For you', 4),
              //       _makeCategoryContainer('Popular', 5),
              //       _makeCategoryContainer('title3', 6),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 50.0),
              Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 15.0),
              // Container(
              //   child: Column(
              //     children: [
              //       Row(children: [
              //         new GestureDetector(
              //           onTap: () {
              //             print("Container clicked");
              //           },
              //           child: new Container(
              //               padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
              //               height: 100,
              //               width: 100,
              //               decoration: BoxDecoration(
              //                 color: Colors.green[200],
              //               ),
              //               child: Row(children: [
              //                 Image.asset(
              //                   'image/logo.png',
              //                 ),
              //                 // Image.network("Image"),
              //                 // Column(
              //                 //   children: [
              //                 //     Text(
              //                 //       "Leave",
              //                 //       style: TextStyle(
              //                 //           fontSize: 12,
              //                 //           fontWeight: FontWeight.bold),
              //                 //     ),
              //                 //     Text("Icon")
              //                 //   ],
              //                 // )
              //               ])),
              //         ),
              //         const SizedBox(width: 15.0),
              //         new GestureDetector(
              //           onTap: () {
              //             print("Container clicked");
              //           },
              //           child: new Container(
              //               padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
              //               height: 100,
              //               width: 100,
              //               decoration: BoxDecoration(
              //                 color: Colors.green[200],
              //               ),
              //               child: Row(children: [
              //                 Image.asset('image/logo.png'),

              //                 // Image.network("Image"),
              //                 // Column(
              //                 //   children: [
              //                 //     Text(
              //                 //       "Attendance",
              //                 //       style: TextStyle(
              //                 //           fontSize: 10,
              //                 //           fontWeight: FontWeight.bold),
              //                 //     ),
              //                 //     Text("Icon")
              //                 //   ],
              //                 // )
              //               ])),
              //         ),
              //         const SizedBox(width: 15.0),
              //         new GestureDetector(
              //           onTap: () {
              //             print("Container clicked");
              //           },
              //           child: new Container(
              //               padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
              //               height: 100,
              //               width: 100,
              //               decoration: BoxDecoration(
              //                 color: Colors.green[200],
              //               ),
              //               child: Row(children: [
              //                 Image.asset('image/logo.png'),
              //                 // Image.network("Image"),
              //                 // Column(
              //                 //   children: [
              //                 //     Text(
              //                 //       "Salary",
              //                 //       style: TextStyle(
              //                 //           fontSize: 12,
              //                 //           fontWeight: FontWeight.bold),
              //                 //     ),
              //                 //     Text("Icon")
              //                 //   ],
              //                 // )
              //               ])),
              //         ),
              //       ]),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Your Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
}
