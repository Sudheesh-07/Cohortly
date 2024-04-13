import 'package:cohortly/pages/home.dart';
import 'package:cohortly/pages/signin.dart';
import 'package:cohortly/service/databases.dart';
import 'package:cohortly/service/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter/src/widgets/scroll_physics.dart';


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

  final _formkey = GlobalKey<FormState>();

  //when user clicks sing up
  registration()async{
    if (password != null && password == confirm_pass) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String Id = randomAlphaNumeric(10);
        String user = mailcontroller.text.replaceAll("@gmail.com", '');
        String updateusername = user.replaceFirst(user[0], user[0].toUpperCase());
        String firstletter = user.substring(0,1).toUpperCase();
        Map<String, dynamic>userInfoMap={
          "Name": namecontroller.text,
          "Email": mailcontroller.text,
          "Username":updateusername.toUpperCase(),
          "Search Key": firstletter,
          "Photo": "https://i.pinimg.com/564x/c9/99/1f/c9991fb58e2a1c32198a1cab0b285ace.jpg",
          "ID": Id
        };
        await DatabaseMethods().adduserDetails(userInfoMap, Id);
        await SharedPrefernceHelper().saverUserId(Id);
        await SharedPrefernceHelper().saverUserDisplayname(namecontroller.text);
        await SharedPrefernceHelper().saveUserEmail(mailcontroller.text);
        await SharedPrefernceHelper().saverUserPic("https://i.pinimg.com/564x/c9/99/1f/c9991fb58e2a1c32198a1cab0b285ace.jpg");
        await SharedPrefernceHelper().saverUserName(mailcontroller.text.replaceAll("@gmail.com", ""));


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.0,),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        border: Border.all(width: 2.0,
                                            color: Colors.deepPurple.shade800)),
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
                                            labelText: "Name",
                                            border: InputBorder.none,
                                            prefixIcon: Icon(
                                              Icons.person_outlined,
                                              color: Color(0xFF7f30fe),))

                                    ),),
                                  SizedBox(height: 10.0,),
                                  SizedBox(height: 10.0,),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        border: Border.all(width: 2.0,
                                            color: Colors.deepPurple.shade800)),
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
                                            labelText: "Email",
                                            border: InputBorder.none,
                                            prefixIcon: Icon(
                                              Icons.mail_outline,
                                              color: Color(0xFF7f30fe),))
                                    ),),
                                  SizedBox(height: 20.0,),
                                  SizedBox(height: 10.0,),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        border: Border.all(width: 2.0,
                                            color: Colors.deepPurple.shade800)),
                                    child: TextFormField(
                                      controller: passwordcontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please Enter Password";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Password",
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.password,
                                            color: Color(0xFF7f30fe),
                                          )),
                                      obscureText: true,
                                    ),),

                                  SizedBox(height: 20.0,),
                                  SizedBox(height: 10.0,),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        border: Border.all(width: 2.0,
                                            color: Colors.deepPurple.shade800)),
                                    child: TextFormField(
                                      controller: confirmpasswordcontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please Enter Confirm Password";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Confirm Password",
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.password,
                                            color: Color(0xFF7f30fe),
                                          )),
                                      obscureText: true,
                                    ),),
                                  SizedBox(height: 50.0,),
                                  GestureDetector(
                                    onTap: (){
                                      if(_formkey.currentState!.validate()){
                                        setState(() {
                                          email = mailcontroller.text;
                                          name = namecontroller.text;
                                          password = passwordcontroller.text;
                                          confirm_pass= confirmpasswordcontroller.text;
                                        });
                                      }
                                      registration();
                                    },
                                    child: Center(
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
                                  ),
                                ],
                              ),
                            ),
                          ),),
                      ),
                    ),
                    SizedBox(height: 40.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16.0),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const SignIn()),);
                          },
                          child: Text(
                            " Sign In Now!",
                            style: TextStyle(color: Color(0xFF7f30fe),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
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
