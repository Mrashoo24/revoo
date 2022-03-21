import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class PosNext extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  height: 41,
                  width: Get.width,
                  color: kblue,
              
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset("asset/smalllogo.png",),
                      SizedBox(width: 10),
              
                Text("Cash in/out",style: TextStyle(color: Colors.white),),
                      
                Spacer(),
                      Image.asset("asset/backbutton.png"),
                   
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text("Close Session",style: TextStyle(fontSize: 20),),
                Container(
                  margin: EdgeInsets.only(left: 30,top: 20,right: 20),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: Get.width/2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Orders"),
                            Text("Payment"),
                            SizedBox(height: 50,),
                            Text("Cash In")
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text("2",style: TextStyle(color: kyellow),),
                          Text("Rs 520/-",style: TextStyle(color: kyellow),),
                          SizedBox(height: 50,),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: ktextcolor,
                              borderRadius: BorderRadius.circular(5)),
                            child: Row(children: [
                              Text("Rs 700/-",style: TextStyle(color: kyellow),),
                              SizedBox(width: 5,),
                              Image.asset("asset/dropdwn.png",height: 5,)
                            ],),
                          ),
                        ],
                      ),
                    
                    
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Divider(thickness: 1,),
                ),
                Container(
                 margin: EdgeInsets.only(left: 30,right: 50,top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(child: Text("Payment",style: TextStyle(fontSize: 18),)),
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Column(children: [
                        Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cash"),
                        Text("Rs 700",style: TextStyle(color: kyellow))
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bank"),
                        Text("Rs 0.00",style: TextStyle(color: kyellow))
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Customer\nAccount"),
                        Text("Rs 0.00",style: TextStyle(color: kyellow))
                      ],
                    )
                      ]),
                    )
                  ],
                )),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Divider(thickness: 1,),
                ),
        
                Container(
                  margin: EdgeInsets.only(left: 30,right: 30,top: 15),
                  child: Row(
                  children: [
                    Text("Counted",style: TextStyle(fontSize: 18),),
                    Spacer(),
                    Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: ktextcolor,
                              borderRadius: BorderRadius.circular(5)),
                            child: Text("Rs 520/-",style: TextStyle(color: kyellow),),
                          ),
                          SizedBox(width: 5,),
                          Image.asset("asset/calendar.png",height: 20,)
                  ],
                )),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ktextcolor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.only(top: 20,left: 30,right: 30),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      focusColor: ktextcolor,
                      hintText: "Note/Money Details"
                    ),
                    maxLines: 5,
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                        decoration: BoxDecoration(border: Border.all(color: kblue,width: 2),borderRadius: BorderRadius.circular(10)),
                        child: Text("Close"),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                        decoration: BoxDecoration(border: Border.all(color: kblue,width: 2),borderRadius: BorderRadius.circular(10)),
                        child: Text("Keep Open",),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [ktextcolor,kblue],
                          begin: Alignment.centerRight,
                          end: Alignment.topCenter
                          ),
                          borderRadius: BorderRadius.circular(10)),
                        child: Text("Continue",style: TextStyle(color: ktextcolor)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}