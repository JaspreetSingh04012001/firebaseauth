import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map<dynamic, dynamic> userinfo;
  Widget photo = Container();
  Widget username = Container();
  Widget email = Container();
  // String get data => null;
  void getuserdata() async {
    User? user = await FirebaseAuth.instance.currentUser;
    userinfo = {
      'username': user?.displayName,
      'photo': user?.photoURL,
      'email': user?.email
    };

    // userinfo.forEach((key, value) {print ("$key $value"); });
    // userinfo.forEach((key, value) {
    //   return Text("sxsx");
    // });
    //  print(user?.providerData);
    // print(user?.providerData.whereType<UserInfo>().first);
    //   UserInfo? info =user?.providerData.whereType<UserInfo>().first;
    // print();
    if (userinfo['photo'] != null) {
      setState(() {
        photo = CircleAvatar(
          child: Image.network(userinfo['photo'].toString()),
        );
      });
    }
    if (userinfo['username'] != null) {
      setState(() {
        username = Text(
          "Welcome ${userinfo['username']}",
          style: TextStyle(color: Colors.indigo[900]),
        );
      });
    }
    if (userinfo['email'] != null) {
      setState(() {
        email = Text("${userinfo['email']}",
            style: TextStyle(color: Colors.indigo[900]));
      });
    }
  }

  @override
  void initState() {
    getuserdata();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                // side: BorderSide(width: 1)
              ),
              elevation: 3,
              shadowColor: Colors.red,
              child:
                  Container(height: 200, child: Image.asset("images/meme.gif")),
            ),
            photo,
            username,
            email,
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
