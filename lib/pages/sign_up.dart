import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task641/pages/home_page.dart';

class SignUp extends StatefulWidget {
  static final String id = "signup_page";
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController =  TextEditingController();
  final passwordController =  TextEditingController();
  final nameController =  TextEditingController();
  final phoneController =  TextEditingController();
  void _doSignUp(){
    String name = nameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone =phoneController.text.toString().trim();
    var box = Hive.box('task_1');
    box.put("name", name);
    box.put("password", password);
    box.put("phone", phone);
    box.put("email", email);
    String user_name=box.get('name');
    String user_password = box.get('password');
    String user_phone = box.get('phone');
    String user_email = box.get('email');
    print(user_password);
    print(user_name);
    print(user_email);
    print(user_phone);
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0E2848),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Create",style: TextStyle(fontSize: 30,color: Colors.white),),
              SizedBox(
                height: 5,
              ),
              Text("Account",style: TextStyle(fontSize: 30,color: Colors.white),),

              SizedBox(
                height: 80,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 20 ),
                  cursorColor: Colors.lightGreenAccent,
                  controller: nameController,
                  decoration: InputDecoration(
                    hoverColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.person_outlined,
                      color: Colors.white,
                    ),
                    hintText: "User Name",
                    hintStyle: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 20 ),
                  cursorColor: Colors.lightGreenAccent,
                  controller: emailController,
                  decoration: InputDecoration(
                    hoverColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                    hintText: "E-Mail",
                    hintStyle: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 20 ),
                  cursorColor: Colors.lightGreenAccent,
                  controller: phoneController,
                  decoration: InputDecoration(
                    hoverColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: Colors.white,
                    ),
                    hintText: "Phone Number",
                    hintStyle: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 20 ),
                  cursorColor: Colors.lightGreenAccent,
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      color: Colors.white,
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ),
              ),

              SizedBox(
                height: 60,
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      colors: [
                        Colors.blue[800]!,
                        Colors.blue[700]!,
                        Colors.blue[400]!,
                        Colors.blue[300]!,
                      ],
                    )),
                  child: FlatButton(
                    onPressed: (){
                      _doSignUp();

                    },
                    child: Icon(
                      Icons.arrow_forward_sharp,
                      size: 45,
                      color: Colors.white,
                    ),
                  )
              ),
              SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account",style: TextStyle(color: Colors.grey,fontSize: 16),),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, HomePage.id);

                    },
                    child: Text("SIGN IN",style: TextStyle(color: Colors.blue,fontSize: 18),),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));

  }
}
