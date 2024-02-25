import 'package:flutter/material.dart';

    class Home extends StatefulWidget {
      const Home({super.key});

      @override
      State<Home> createState() => _HomeState();
    }

    class _HomeState extends State<Home> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: Color(0xFF553370),
          body: Container(

            child: Column(
              children: [
            Padding(
              padding: const EdgeInsets.only(left:20.0, right: 20.0,top: 50.0,bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cohortly",
                    style: TextStyle(
                        color: Color(0xffc199cd),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
               Container(
                   padding: EdgeInsets.all(8),
                   decoration: BoxDecoration(color: Color(0xFF3a2144),borderRadius: BorderRadius.circular(20)),
                   child: Icon(Icons.search,color: Color(0xffc199cd), ))
                 ],
                ),
            ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.15,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      ClipRRect(
                           borderRadius:BorderRadius.circular(60),
                          child: Image.asset("images/boy.jpg", height:70,width: 70,fit: BoxFit.cover,)),
                          SizedBox(width: 10.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sudheesh",style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        Text("Hello, What are you doing?",style: TextStyle(color: Colors.black45,fontSize: 15.0,fontWeight: FontWeight.w500),),
                        ],
                          ),
                        Text("4:30 PM",style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500),),
                    ],),
                      SizedBox(height: 30.0,)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius:BorderRadius.circular(60),
                              child: Image.asset(
                                "images/boy1.jpg",
                                height:60,
                                width: 60,
                                fit: BoxFit.cover,
                              )),
                          SizedBox(width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Arin",style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500),),
                                ],
                              ),
                              Text("Hi, What is going on?",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "4:30 PM",
                            style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500),),
                        ],),

                    ],
                  ),
                )
             ],
            ),
          ),
        );
      }
    }
