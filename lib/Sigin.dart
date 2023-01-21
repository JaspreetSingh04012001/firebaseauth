import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  var email, password, passcheck;
  Widget confirmpassword = Container();
  void showALLERT(message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: Text("Match Already Exists"),
            content: Text("$message"),
            actions: [
              TextButton(
                child: Text("ok"),
                onPressed: () {
                  //  p("popp.mp3");
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepOrange,
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Text("Firebase Authentication",
                        style: GoogleFonts.pacifico(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 20))),
              ),
              Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  // side: BorderSide(width: 1)
                ),
                color: Colors.white,
                child: SizedBox(
                  //   height: 500,
                  //   width: MediaQuery.,
                  height: MediaQuery.of(context).size.height - 108,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("Sign In",
                          style: GoogleFonts.pacifico(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 20)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: Text("Enter Your Email",
                                  style: GoogleFonts.pacifico(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrangeAccent,
                                      fontSize: 10))),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        //padding: const EdgeInsets.all(5),
                        height: 58,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),

                        child: SizedBox.expand(
                          child: TextField(
                              cursorColor: Colors.indigo,
                              //   keyboardType: TextInputType.multiline,
                              // expands: true,
                              //   minLines: null,
                              //   maxLines: null,
                              //autofocus: true,
                              textAlign: TextAlign.justify,
                              //   controller: fieldText2,
                              //   enabled: rememberMe,
                              style: const TextStyle(
                                  //  color: Colors.indigo.shade900,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              onChanged: (p) async {
                                email = p.toString();
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                //fillColor: Colors.indigo[900],hoverColor:Colors.indigo[900] ,iconColor: Colors.indigo[900],
                                isDense: true,
                                hintStyle:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                                hintText: 'Email',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                //fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrangeAccent,
                                      width: 2.0),
                                  //  borderRadius: BorderRadius.vertical(top: 20,bottom: Radius.zero)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    //   borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                    ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: Text("Enter Your Password",
                                  style: GoogleFonts.pacifico(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrangeAccent,
                                      fontSize: 10))),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        //padding: const EdgeInsets.all(5),
                        height: 58,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),

                        child: SizedBox.expand(
                          child: TextField(
                              cursorColor: Colors.deepOrange,
                              textAlign: TextAlign.start,
                              //   controller: fieldText2,
                              //   enabled: rememberMe,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              onChanged: (p) async {
                                password = p.toString();
                              },
                              //   cursorColor: Colors.indigo[900],
                              // keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                //fillColor: Colors.indigo[900],hoverColor:Colors.indigo[900] ,iconColor: Colors.indigo[900],
                                isDense: true,
                                hintStyle:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                                hintText: 'Password',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                //fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrangeAccent,
                                      width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    //  borderSide: BorderSide(color: Colors.red, width: 5.0),
                                    ),
                              )),
                        ),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.deepOrange),
                          ),
                          onPressed: () async {
                            if (email != null && password != null) {
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
                              } on FirebaseAuthException catch (e) {
                                showALLERT('${e.message}');
                              } catch (e) {
                                //print(e);
                                showALLERT(e);
                              }
                            }
                            if (FirebaseAuth.instance.currentUser != null) {
                              Navigator.of(context).pop();
                            }
                            if (email == null ||
                                password == null ||
                                email == "" ||
                                password == "") {
                              showALLERT("Email or Password Must not be empty");
                            }

                            // else{
                            //   showALLERT("I dont know Whats happening");
                            // }
                          },
                          child: Container(
                            width: 100,
                            child: Center(
                                child: Text(
                              "Sign In",
                              style: GoogleFonts.pacifico(fontSize: 10),
                            )),
                          )),
                      ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.pink),
                          ),
                          // style: const ButtonStyle(
                          //   backgroundColor:
                          //    //   MaterialStatePropertyAll(Colors.indigo[900]),
                          // ),
                          onPressed: () async {
                            signInWithGoogle().then((value) {
                              // print(value);
                              Navigator.of(context).pop();
                            });

                            // _handleSignIn();
                            //  await FirebaseAuth.instance.sign;
                            // print(" $email $password");
                          },
                          child: Container(
                            width: 100,
                            child: Center(
                                child: Text(
                              "Google Login",
                              style: GoogleFonts.pacifico(fontSize: 10),
                            )),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
