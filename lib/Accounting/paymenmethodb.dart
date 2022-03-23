import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Padding(
                padding:   EdgeInsets.only(top: 40,left: 20),
                child: Text("Payment Methods",style: TextStyle(fontSize: 30,color: kblue),),
              ),
              Padding(
                padding:   EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cash",style: TextStyle(fontSize: 25,color: kblue),),
                        Text("POS #132",style: TextStyle(fontSize: 25,color: kyellow),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    Divider(thickness: 2,color: Colors.grey,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cash",style: TextStyle(fontSize: 25,color: kblue),),
                        Text("POS #132",style: TextStyle(fontSize: 25,color: kyellow),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 2,color: Colors.grey,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cash",style: TextStyle(fontSize: 25,color: kblue),),
                        Text("POS #132",style: TextStyle(fontSize: 25,color: kyellow),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 2,color: Colors.grey,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Third Party Transfer",style: TextStyle(fontSize: 25,color: kblue),),
                        Image.asset("asset/reversarrow.png")

                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 2,color: Colors.grey,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.asset('asset/addpition.png'),
                        SizedBox(width: 15,),
                        Text("Add Payment",style: TextStyle(color: kblue,fontSize:25 ),)

                      ],
                    )
                  ],
                ),

              ),
            ],
          ),


        ),
      ),

    );
  }
}
