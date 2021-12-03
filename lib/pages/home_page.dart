import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task641/pages/sign_up.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final passwordController =  TextEditingController();
  final nameController =  TextEditingController();
  void _doLogIn(){
    String name = nameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    var box = Hive.box('task_1');
    box.put("name", name);
    box.put("password", password);
    String user_name=box.get('name');
    String user_password = box.get('password');
    print(user_password);
    print(user_name);
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
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/images/image.jpeg"),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome Back!",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Sign in to continue",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
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

                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      color: Colors.white,
                    ),
                    hintText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.white
                    ),
                    hintStyle: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.grey[500], fontSize: 15),
              ),
              SizedBox(
                height: 50,
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
                    _doLogIn();

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
                  Text("Don't have an account?",style: TextStyle(color: Colors.grey,fontSize: 16),),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, SignUp.id);

                    },
                    child: Text("SIGN UP",style: TextStyle(color: Colors.blue,fontSize: 18),),
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
