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
 
   String _emailError = null;
  var _secureText = true;
  bool isChecked=false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

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
          //image: AssetImage('images/wjpg'),
          image:NetworkImage('https://image.shutterstock.com/image-illustration/blur-lights-abstract-background-bokeh-260nw-1537938740.jpg'),
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
          height: 500,
          width: 500,          
          padding:EdgeInsets.fromLTRB(20, 50, 20, 50),
          child: ListView(
            children: [
              SizedBox(
                height: 130,
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                  // borderRadius: BorderRadius.circular(100),
                   child:ClipOval(child:  Image(image: AssetImage('assets/images/new_astr_logo.jpg'),),)
                  ),
                  ),
                ),
              


              TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                border: InputBorder.none, 
                errorText: _emailError,
                prefixIcon: Icon(Icons.mail,color: Colors.white),
                hintText: "Email ID",
                labelStyle: TextStyle(fontSize: 10, color: Colors.white),
                fillColor: Colors.black45,
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
                fillColor: Colors.black45,
                filled: true,
              ),
              obscureText: _secureText,
              // keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox( height: 20,),
             CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('Accept Terms and Condition'),
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
                  primary: Color.fromARGB(221, 6, 6, 6),
                  fixedSize: const Size(200, 20),
                ),
                onPressed:isChecked? () {
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
                                onPressed:  () {
                                  
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
                }:null,
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
