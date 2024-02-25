import 'package:cohortly/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

 class _SignUpState extends State<SignUp> {
  //harish
  String email = "",
      password = "",
      name = "",
      confirm_pass = ""; //global
  TextEditingController mailcontroller = new TextEditingController();
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController confirmpasswordcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  //when user clicks sing up
  registration()async{
    if (password != null && password == confirm_pass) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          "Sucessfully Registered", style: TextStyle(fontSize: 20.0),)));
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak_password") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Weak Password", style: TextStyle(fontSize: 18.0),)));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text("Account Already Exists With This Email",
                style: TextStyle(fontSize: 18.0),)));
        }
      }
      //harish
    }
  }
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 4.0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF7f30fe), Color(0xFF6380fb)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight), //Linear Gradient
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(MediaQuery
                            .of(context)
                            .size
                            .width, 105.0))
                )), //Container //BoxDecoration
            Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Column(
                  children: <Widget>[
                    Center(
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold), //textstyle
                        )),
                    Center(
                        child: Text(
                          "Create a new account",
                          style: TextStyle(
                              color: Color(0xFFbbb0ff),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500), //textstyle
                        )),
                    SizedBox(height: 20.0,),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20.0),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 1.7,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500),),
                                SizedBox(height: 10.0,),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1.0,
                                          color: Colors.black38)),
                                  child: TextFormField(
                                      controller: namecontroller,
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty) {
                                          return "Please Enter Name";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.mail_outline,
                                            color: Color(0xFF7f30fe),))

                                  ),),
                                SizedBox(height: 20.0,),
                                Text(
                                  "Email",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500),),
                                SizedBox(height: 10.0,),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1.0,
                                          color: Colors.black38)),
                                  child: TextFormField(
                                      controller: mailcontroller,
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty) {
                                          return "Please Enter Email";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.person_outline,
                                            color: Color(0xFF7f30fe),))
                                  ),),
                                SizedBox(height: 20.0,),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500),),
                                SizedBox(height: 10.0,),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1.0,
                                          color: Colors.black38)),
                                  child: TextFormField(
                                    controller: passwordcontroller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter Password";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.password,
                                          color: Color(0xFF7f30fe),
                                        )),
                                    obscureText: true,
                                  ),),

                                SizedBox(height: 20.0,),
                                Text(
                                  "Confrim Password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500),),
                                SizedBox(height: 10.0,),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1.0,
                                          color: Colors.black38)),
                                  child: TextFormField(
                                    controller: confirmpasswordcontroller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter Confirm Password";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.password,
                                          color: Color(0xFF7f30fe),
                                        )),
                                    obscureText: true,
                                  ),),
                                SizedBox(height: 50.0,),
                                Center(
                                  child: Container(
                                    width: 130,
                                    child: Material(
                                      elevation: 5.0,
                                      borderRadius: BorderRadius.circular(
                                          10),
                                      child: Container(

                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF6380fb),
                                            borderRadius: BorderRadius
                                                .circular(10)),
                                        child: Center(child: Text("Sign Up",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight
                                                  .bold),)),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),),
                      ),
                    ),
                    SizedBox(height: 40.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16.0),
                        ),
                        Text(
                          " Sign Up Now!",
                          style: TextStyle(color: Color(0xFF7f30fe),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
