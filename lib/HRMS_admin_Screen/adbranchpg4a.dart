import 'package:flutter/material.dart';

import '../constants/constants.dart';




class DBcrud4a extends StatefulWidget {
  const DBcrud4a({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DBcrud4a> {

  // Initial Selected Value

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body : Container(
          width: 300,


          decoration: BoxDecoration(

              gradient: LinearGradient(
                colors: [
                  kblue,
                  Kdblue
                ],


              ),

              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45))


          ),child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    Text('Actions',style: TextStyle(color: Colors.white,fontSize: 35),),
                    SizedBox(width: 50),

                  ],
                ),
                trailing : Icon(Icons.more_vert,color: Colors.white),
              ),Divider(
                height: 10,
                thickness: 2,color:Colors.white,endIndent: 10, indent: 10,
              ),
              SizedBox(height: 10,width: 20,),
              ListTile(
                title: Row(
                  children: [
                    Image.asset('asset/actiona.png'),
                    SizedBox(width: 10),
                    Text('Duplicate',style: TextStyle(fontSize: 25,color: Colors.white),
                    )
                  ],
                ),

              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset('asset/actionb.png'),
                    SizedBox(width: 10),
                    Text('Rename',style: TextStyle(fontSize: 25,color: Colors.white),
                    )
                  ],
                ),

              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset('asset/actionc.png'),
                    SizedBox(width: 10),
                    Text('Download',style: TextStyle(fontSize: 25,color: Colors.white),
                    )
                  ],
                ),

              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset('asset/actiond.png'),
                    SizedBox(width: 10),
                    Text('Add Domain',style: TextStyle(fontSize: 25,color: Colors.white),
                    )
                  ],
                ),

              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset('asset/actione.png'),
                    SizedBox(width: 10),
                    Text('Tags',style: TextStyle(fontSize: 25,color: Colors.white),
                    )
                  ],
                ),

              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset('asset/actionf.png'),
                    SizedBox(width: 10),
                    Text('Delete',style: TextStyle(fontSize: 25,color: Colors.white),
                    )
                  ],
                ),

              ),Divider(
                height: 10,
                thickness: 2,color:Colors.white,endIndent: 10, indent: 10,
              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset('asset/actionh.png'),
                    SizedBox(width: 10),
                    Text('Invite Users',style: TextStyle(fontSize: 25,color: Colors.white),
                    )
                  ],
                ),

              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset('asset/actionh.png'),
                    SizedBox(width: 10),
                    Text('Remove Users',style: TextStyle(fontSize: 25,color: Colors.white),
                    )
                  ],
                ),

              ),Divider(
                height: 10,
                thickness: 2,color:Colors.white,endIndent: 10, indent: 10,
              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset('asset/actionf.png'),
                    SizedBox(width: 10),
                    Text('Contact Support',style: TextStyle(fontSize: 25,color: Colors.white),
                    ),
                  ],
                ),

              ),Container(
                width: 300,
                height: 80,
                decoration: BoxDecoration(

                    color: kyellow,

                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))

                ),
                child: ListTile(

                  title: Row(

                    children: [



                      Text('Duplicate',style: TextStyle(fontSize: 35,color: Kdblue),

                      ),SizedBox(width: 10),

                      Image.asset('asset/actionj.png',color: Kdblue,),

                    ],

                  ),

                ),
              ),




            ],
          ),
        ),
        ),

      ),
    );
  }
}