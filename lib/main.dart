import 'dart:async';

import 'package:firebaseauth/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'HomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Firebase.initializeApp(// options :DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:  ThemeData(

          textTheme:
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.indigo[900],

          ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(primary: Colors.indigo[900])
    ),

    textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
    primary: Colors.indigo[900]

    )
    ),

    elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(Colors.indigo)
    )
    ),
    primaryColor: Colors.indigo
    ),
      home :App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder( future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          //  return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {

          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context , snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Loading();}

                if (snapshot.hasData) {
                 // Timer(Duration(seconds: 3), () { });
                  return const Home();
                }


                else{

                  return SignUp();}

              });
        }

        // Otherwise, show something whilst waiting for initialization to complete
       else {
          return Loading();;
        }
      },
    );

  }
}

class InternalLoading extends StatefulWidget {
  const InternalLoading({Key? key}) : super(key: key);

  @override
  State<InternalLoading> createState() => _InternalLoadingState();
}

class _InternalLoadingState extends State<InternalLoading> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.of(context).pop()

    );
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,


      child: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child:
          LiquidCircularProgressIndicator(
            // center:
            // Text("Loading.."),
            value:
            0.5, // Defaults to 0.5.
            valueColor:
            AlwaysStoppedAnimation(
                Colors
                    .pink), // Defaults to the current Theme's accentColor.
            backgroundColor: Colors
                .white, // Defaults to the current Theme's backgroundColor.
            borderColor:
            Colors.red,
            borderWidth: 1.0,
            direction: Axis
                .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
          ),
        ),
      ),
    );
  }
}


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,


      child: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child:
          LiquidCircularProgressIndicator(
            // center:
            // Text("Loading.."),
            value:
            0.5, // Defaults to 0.5.
            valueColor:
            AlwaysStoppedAnimation(
                Colors
                    .pink), // Defaults to the current Theme's accentColor.
            backgroundColor: Colors
                .white, // Defaults to the current Theme's backgroundColor.
            borderColor:
            Colors.red,
            borderWidth: 1.0,
            direction: Axis
                .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
          ),
        ),
      ),
    );
  }
}