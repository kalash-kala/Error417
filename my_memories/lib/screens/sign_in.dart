//your sign in page

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_memories/screens/home.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text('My',
                    style: GoogleFonts.lato(
                      fontStyle: FontStyle.italic,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30.0, 160.0, 0.0, 0.0),
                  child: Text('Memories',
                    style: GoogleFonts.lato(
                      fontStyle: FontStyle.italic,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20, top: 130),
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value){
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Id',
                    labelStyle: TextStyle(
                      fontFamily: 'lato',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                TextField(
                  onChanged: (value){
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontFamily: 'lato',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                ElevatedButton(onPressed: (){
                  auth.signInWithEmailAndPassword(email: email, password: password);

                  auth.authStateChanges().listen((User?user) {
                    if(user==null){
                      print('Not inside');
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    }
                  });
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                }, child:
                  Text('Login',
                    style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
