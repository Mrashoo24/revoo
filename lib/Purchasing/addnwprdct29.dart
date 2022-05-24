
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/constants.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {


  int _counter = 0;
  increment(){
    setState(() {
      _counter++;

    });

  }

  decrement(){
    setState(() {
      _counter--;

    });
  }

  File? image;
  File? image1;
  Future pickImage() async{
    try {
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporory = File(image!.path);
      setState(() =>
      this.image = imageTemporory);

    } on PlatformException catch (e){
      print('Failed to pick image: $e');
    }
  }

  Future pickImage1() async{
    try {
      await ImagePicker().pickImage(source: ImageSource.camera,);
      if (image == null) return;
      final imageTemporory = File(image!.path);
      setState(() =>
      this.image = imageTemporory);

    } on PlatformException catch (e){
      print('Failed to pick image: $e');
    }
  }

  var productcategoryvalue = 'Product category0';

  var itemList = [

    DropdownMenuItem(child: Text('Product category0'),value:'Product category0' ,),
    DropdownMenuItem(child: Text('Product category1'),value:'Product category1' ,),
    DropdownMenuItem(child: Text('Product category2'),value:'Product category2' ,),
    DropdownMenuItem(child: Text('Product category3'),value:'Product category3' ,),
    DropdownMenuItem(child: Text('Product category4'),value:'Product category4' ,),
  ];
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,

          child: SingleChildScrollView(
            child: Padding(
              padding:   EdgeInsets.all(20.0),
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (){

                          },
                          child: Image.asset('asset/navicon.png',)),
                      Row(
                        children: [
                          SizedBox(width: 140),
                          Image.asset('asset/bellicon.png'),
                          SizedBox(width: 20),
                          Image.asset('asset/settingsicon.png'),
                          SizedBox(width: 20),
                          Image.asset('asset/usericon.png'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Add New Product',style: TextStyle(fontSize: 30,color: kblue),)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 145,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Kdblue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Text('Purchased :',style: TextStyle(color: Colors.white,fontSize: 15),),
                              SizedBox(width: 8,),
                              Container(
                                width: 45,
                                height: 22,
                                decoration: BoxDecoration(color: bgGrey),
                                child: Center(child: Text("24",style: TextStyle(color: kyellow,fontSize:15),)),
                              ),

                            ],
                          ),
                        ),

                      ),SizedBox(width: 20,),
                      Container(
                        width: 130,
                        height: 36,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(border: Border.all(
                            color: Kdblue,width: 2
                        )),
                        child: Padding(
                          padding:   EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              Text('Print Label',style: TextStyle(fontSize: 17,color: kblue),),
                              SizedBox(width: 9,),
                              Image.asset('asset/dropdwn.png'),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,


                          ),
                          child: InkWell(

                            onTap: (){
                              pickImage();
                            },
                            // onTap: ()async{
                            //   final result = await  FilePicker.platform.pickFiles(
                            //   allowMultiple: false,
                            //   type: Filrtype.custom,
                            //   allowedExtentions['png','jpg'],
                            //   );
                            //   },
                            child: Icon(
                              Icons.production_quantity_limits_outlined,
                              size: 50,
                              color:  Colors.grey,
                            ),
                          ),
                        ),
                          Padding(
                            padding: EdgeInsets.only(top: 65,left: 120),
                            child: InkWell(

                              onTap: (){
                                pickImage1();
                              },

                              child: Icon(Icons.camera_alt_rounded,size: 50,color: Colors.grey[500],),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text('Product name',style: TextStyle(fontSize: 16,color:kblue ),),
                          Divider(
                            height: 5,thickness: 15,
                          ),
                          Container(
                            height: 40,
                            width: 150,

                            child: TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: bgGrey,

                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  enabledBorder:OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  )

                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Upload a profile picture',style: TextStyle(color: kblue),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Column(
                      children: [

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Product type',style: TextStyle(fontSize: 18,color:kblue ),)),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 37,

                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),

                          child: TextFormField(
                            decoration: InputDecoration(

                                filled: true,
                                fillColor: bgGrey,

                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder:OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                )

                            ),
                          ),
                        ),


                        SizedBox(height: 30),



                        Container(
                          height: 110,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    Text('Price sale',style: TextStyle(fontSize: 18,color:kblue ),),
                                    Divider(
                                      height: 5,thickness: 1,color: kblue,
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      height: 40,

                                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),


                                      child: TextFormField(
                                        decoration: InputDecoration(

                                            filled: true,
                                            fillColor: bgGrey,

                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            )

                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              Flexible(
                                child: Column(
                                  children: [
                                    Text('Cost price',style: TextStyle(fontSize: 18,color:kblue ),),
                                    Divider(
                                      height: 5,thickness: 1,color: kblue,
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),


                                      child: TextFormField(
                                        decoration: InputDecoration(

                                            filled: true,
                                            fillColor: bgGrey,

                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            )

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1),
                        Align(
                            alignment: Alignment.centerLeft,
                            child

                            : Text('Tags',style: TextStyle(fontSize: 18,color:kblue ),)),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        Container(
                          height: 42,
                          width: 400,

                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: bgGrey,

                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                enabledBorder:OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                )

                            ),
                          ),
                        ),
                        SizedBox(height: 30),

                        Align(alignment: Alignment.centerLeft,
                            child: Text('Product category',style: TextStyle(fontSize: 18,color:kblue ),)),
                        SizedBox(height: 1),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),

                        Container(


                          height: 60,
                          width: Get.width,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,borderRadius: new BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          child: DropdownButton <String?>(
                            value:productcategoryvalue,
                            onChanged: (String? value){
                              setState(() {
                                productcategoryvalue = value!;
                              });
                            },
                            items: itemList,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              child: ElevatedButton(onPressed: (){

                              },

                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape:RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      side: BorderSide(width: 3.0, color: kblue ),
                                      primary: Colors.white,
                                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 11),
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  child: Center(child: Text('< Back',style: TextStyle(
                                      color: kblue,fontSize: 15
                                  ),))),
                            ),
                            SizedBox(width: 25,),
                            Container(
                              width: 110,
                              height: 41,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue.shade900,
                                    Colors.blue,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10),


                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text('Duplicate',style: TextStyle(
                                      color: Colors.white,fontSize: 15
                                  ),),
                                ),
                              ),

                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(

          height: 100,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(

                  child: Stack(
                    children: [
                      Align(

                        child: Container(
                          height: Get.height*0.08,
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                            color: Kdblue,

                          ),
                          child: Align(
                            alignment: Alignment.center,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ClipRect(child: Image.asset('asset/share.png')),
                                ClipRect(child: Image.asset('asset/homedash.png')),
                                Opacity(
                                    opacity: 0.01,
                                    child: ClipRect(child: Image.asset('asset/share.png'))
                                ),
                                ClipRect(child: Image.asset('asset/groupdash.png')),
                                ClipRect(child: Image.asset('asset/pathdash.png')),

                              ],
                            ),
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),

                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:  EdgeInsets.only(bottom: 20.0),
                  child: Image.asset('asset/bnbAdd.png'),
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
