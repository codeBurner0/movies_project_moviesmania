// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
//@dart=2.9
//import 'package:final_assessment/Screens/Screen3.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_project_moviesmania/pages/main_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
 // double _deviceHeight=634.3362426757812;
  //double _deviceWidth=521.0619506835938; 
  //  _deviceHeight = MediaQuery.of(context).size.height;
  //   _deviceWidth = MediaQuery.of(context).size.width;
   String _emailError = null;
  var _secureText = true;
  bool isChecked=false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  
  // String _nameError = null;
  // String _emailError = null;
  // TextEditingController namecontroller = TextEditingController();
  // TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          
          children: [
            Container(
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage('images/new_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            ),
          )),
    ),
            
            _lpforeground(),
          ]))),
    );
    
  }
  
 

  
  Widget _lpforeground() {
    return Center(
        child: Container(
        //   decoration: BoxDecoration(
        //   borderRadius:BorderRadius.circular(16.0),
        //  // color: Colors.black12,
        //   ),
          height: 450,
          width: 500,          
          padding:EdgeInsets.fromLTRB(20, 50, 20, 50),
          child: Column(
            children: [
              TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                border: InputBorder.none, 
                errorText: _emailError,
                prefixIcon: Icon(Icons.mail,color: Colors.white),
                hintText: "Email ID",
                labelStyle: TextStyle(fontSize: 10, color: Colors.white),
                fillColor: Colors.black,
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox( height: 30,),
            TextField(
              controller: passwordcontroller,
              maxLength: 20,
              decoration: InputDecoration(
                border: InputBorder.none, 
                prefixIcon: Icon(Icons.lock,color: Colors.white,),
                hintText: "Password",
                labelStyle: TextStyle(fontSize: 10, color:Colors.white),
                fillColor: Colors.black,
                filled: true,
              ),
              obscureText: _secureText,
              // keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox( height: 30,),
             CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('Remember Me!'),
              activeColor: Colors.blue,
                      value: isChecked,
                      onChanged: (b) {
                        setState(() {
                          isChecked = b;
                        });
                      }),
                 Center(
          child: Container(
            
            child: SizedBox(
              width: 320,
              height: 50,
              child:  ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.black,
                  fixedSize: const Size(200, 20),
                ),
                onPressed: () {
                  final password = passwordcontroller.text;
                  final email = emailcontroller.text;
                  if (password.isEmpty || email.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Failed"),
                          content: const Text("Field cannot be empty"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"))
                          ],
                        );
                      },
                    );
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (conetext) {
                      return MainPage();
                    }));
                  }
                },
                child: const Text('Login'),
              ),
            ),
          ),)
            ],
          ),
        ),
      );
   
  }
  }
