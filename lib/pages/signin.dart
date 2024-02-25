import 'package:cohortly/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class  SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email="", password="";
  TextEditingController useremailcontroller = new  TextEditingController();
  TextEditingController userpasswordcontroller = new  TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userLogin() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
    }
    on FirebaseAuthException catch(e){
      if(e.code=="no-user-found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text("No user found for that Email",style: TextStyle(fontSize: 18.0,color: Colors.black))));
      }
      else if(e.code=="wrong-password"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text("Wrong password",style: TextStyle(fontSize: 18.0,color: Colors.black))));
      }
    }
  }

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
                        "SignIn",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold), //textstyle
                      )),
                  Center(
                      child: Text(
                        "Login to your account",
                        style: TextStyle(
                            color: Color(0xFFbbb0ff),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500), //textstyle
                      )),
                  SizedBox(height: 20.0,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child : Container(
                        padding: EdgeInsets.symmetric(vertical:30.0, horizontal: 20.0),
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                          "Email",
                          style:TextStyle(
                              color:Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500 ),),
                        SizedBox(height: 10.0),
                        Container(

                          decoration: BoxDecoration(
                              border: Border.all(width: 1.0, color: Colors.black38),
                          borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: useremailcontroller,
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "Please Enter an Email";
                              }
                              return null;
                            },
                            decoration: InputDecoration(border: InputBorder.none,prefixIcon: Icon(Icons.mail_outline,color: Color(0xFF7f30fe),))

                        ),),
                          SizedBox(height: 20.0,),
                          Text(
                            "Password",
                            style:TextStyle(
                                color:Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500 ),),
                          SizedBox(height: 10.0,),
                          Container(
                      
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0, color: Colors.black38),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              controller: userpasswordcontroller,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "Please Enter a Password";
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
                          SizedBox(height:10.0,),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Forgot Password?",
                              style:TextStyle(
                                  color:Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 50.0,),
                          GestureDetector(
                            onTap: (){
                              if(_formkey.currentState!.validate()){
                                setState(() {
                                  email = useremailcontroller.text;
                                  password = userpasswordcontroller.text;
                                });
                              }
                              userLogin();
                            },
                            child: Center(
                              child: Container(
                                width: 130,
                                child: Material(
                                  elevation: 5.0,
                                    borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                                  
                                      padding: EdgeInsets.all(10),
                                      decoration:BoxDecoration(color: Color(0xFF6380fb),borderRadius: BorderRadius.circular(10)),
                                      child: Center(child: Text("SignIn",style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),)),),
                                  ),
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
                       style: TextStyle(color: Colors.black,fontSize: 16.0),
                 ),
                     Text(
                         " Sign Up Now!",
                         style: TextStyle(color: Color(0xFF7f30fe),fontSize: 16.0, fontWeight: FontWeight.w500),
                     )
                   ],
                 )
                ],
              )

            ) ],
              ),
            ),
        );


  }
}

