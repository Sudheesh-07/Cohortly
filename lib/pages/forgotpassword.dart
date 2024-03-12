
import 'package:cohortly/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




// class _State extends State<> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = "";
  final _formkey = GlobalKey<FormState>();
  TextEditingController useremailcontroller = new TextEditingController();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Password reset email has been sent",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "No user with this email",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      } else if (e.code == "invalid-credential") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Incorrect email or user not found",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "${e.code} Please wait before trying again",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                height: MediaQuery.of(context).size.height / 4.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.teal.shade400, Colors.teal.withGreen(60)],
                         begin: Alignment.topLeft,
                         end: Alignment.bottomRight),
                         borderRadius: BorderRadius.vertical(
                         bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width,
                          105.0))))), //Container //BoxDecoration
            Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Column(
                  children: <Widget>[
                    Center(
                        child: Text(
                          "Recover Password",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold), //textstyle
                        )),
                    Center(
                        child: Text(
                          "Enter Your Registered Email",
                          style: TextStyle(
                              color: Colors.teal.shade100,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500), //textstyle
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20.0),
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Form(
                            key: _formkey,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.0),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      border: Border.all(width: 2.0,
                                          color: Colors.teal.shade900)),
                                  child: TextFormField(
                                      controller: useremailcontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please Enter an Email";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Email",
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.mail_outline,
                                            color: Colors.teal.shade800,
                                          ))),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if(_formkey.currentState!.validate()){
                                      setState(() {
                                        email = useremailcontroller.text;

                                      });
                                      resetPassword();
                                    }
                                  },
                                  child: Center(
                                    child: Container(
                                      width: 130,
                                      child: Material(
                                        elevation: 5.0,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.teal.shade700,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text(
                                                "Send Email",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                          },
                          child: Text(
                            " Sign Up Now!",
                            style: TextStyle(
                                color: Colors.teal.shade800,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )
            ],
                ))
            ],
        ),
    ),
    );
  }
}

