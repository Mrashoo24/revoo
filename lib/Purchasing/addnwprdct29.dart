
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../Models/salesproductmodel.dart';
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
  List<Map<String,String>>? selectedItems = [];

  var itemList = [

    DropdownMenuItem(child: Text('Product category0'),value:'Product category0' ,),
    DropdownMenuItem(child: Text('Product category1'),value:'Product category1' ,),
    DropdownMenuItem(child: Text('Product category2'),value:'Product category2' ,),
    DropdownMenuItem(child: Text('Product category3'),value:'Product category3' ,),
    DropdownMenuItem(child: Text('Product category4'),value:'Product category4' ,),
  ];
  bool loading = false;
  TextEditingController productname = TextEditingController();
  TextEditingController producttype = TextEditingController();
  TextEditingController sellprice = TextEditingController();
  TextEditingController costprice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var firestore = FirebaseFirestore.instance.collection('Salesproducts');
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
                              controller: productname,
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
                          ///productname
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Upload a profile picture',style: TextStyle(color: kblue),),
                    ],
                  ),///uploadprofile
                  SizedBox(height: 20),
                  Container(
                    child: Column(
                      children: [

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Product Name',style: TextStyle(fontSize: 18,color:kblue ),)),
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

                        SizedBox(height: 10),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Product Type',style: TextStyle(fontSize: 18,color:kblue ),)),
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
                                    Text('Sell Price',style: TextStyle(fontSize: 18,color:kblue ),),
                                    Divider(
                                      height: 5,thickness: 1,color: kblue,
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(5)),
                                      child: TextFormField(
                                        controller: sellprice,
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
                                              borderRadius: BorderRadius.all(Radius.circular(10)),)),),
                                    ),
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
                                        controller: costprice,
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
                            : Text('Product Type',style: TextStyle(fontSize: 18,color:kblue ),)
                        ),
                        Divider(
                          height: 5,thickness: 1,color: kblue,
                        ),
                        Container(
                          height: 42,
                          width: Get.width,
                          child: TextFormField(
                            controller: producttype,
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
                        ///productype
                        InkWell(
                          onTap: (){
                            _showMultiSelect(context);
                          },
                          child: Container(
                            color: Kdblue,

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Select Components',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        ///select components
                        SizedBox(height: 5),
                        Container(
                          height: 100,
                          width: 400,
                          child: ListView.builder(
                              shrinkWrap: true,

                              itemCount: selectedItems!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                          width:100,
                                          child: Text(selectedItems![index]['name']!)),
                                      SizedBox(width: 10,),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          width: 30,
                                          child: Text(selectedItems![index]['unit']!,style: TextStyle(fontSize: 10),),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              filled: true,

                                              labelText: 'Quantity',
                                              labelStyle: TextStyle(color: Colors.grey[800],fontSize: 8),
                                              hintStyle: TextStyle(color: Colors.grey[800],fontSize: 8),
                                              hintText: 'Quantity',
                                              fillColor: Colors.white70),
                                          keyboardType: TextInputType.number,
                                          onChanged: (value1){
                                            print('previo = ${selectedItems![index]}');
                                            print('value = $value1');

                                            selectedItems![index].update('quantity', (value) => value1.toString());

                                            print('updated = ${selectedItems![index]}');

                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                          ),
                        ),

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
                        ///dropdown product category
                        SizedBox(height: 20),
                        SizedBox(width: 25,),


                        InkWell(
                          onTap: (){
                              FirebaseFirestore.instance.collection('Salesproducts').add(
                                  SalesProductModel().toJson(SalesProductModel(
                                    productname: productname.text,
                                    costprice: costprice.text,
                                      components: jsonEncode(selectedItems),
                                    sellprice: sellprice.text,
                                    productcategory: productcategoryvalue,
                                    producttype: producttype.text,

                                      cid: 'id',
                                    date: DateFormat('yyyy/MM/dd').format(DateTime.now())


                                  ))).then((value) {
                                FirebaseFirestore.instance.collection('Salesproducts').doc(value.id).update({'cid':value.id});

                                setState(() {
                                  loading = false;
                                });
                                Get.back();
                              });

                          },
                          child: Container(
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
                                child: Text('Add Products',style: TextStyle(
                                    color: Colors.white,fontSize: 15
                                ),),
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),


    );
  }
  void _showMultiSelect(BuildContext context) async {
    QuerySnapshot<Map<String, dynamic>> ProductDocs = await FirebaseFirestore
        .instance.collection('Sale_product_component').get();


    List<MultiSelectItem<Map<String, String>>> allProduct = [];

    ProductDocs.docs.forEach((element) {
      Map<String, dynamic> newList = element.data();
      Map<String, String> newList1 = {
        "name": newList['name'],
        'price': newList['price'],
        'quantity': newList['quantity'],
        'unit': newList['unit'],
      };
      allProduct.add(MultiSelectItem(newList1, element.get('name')));
    });
    print('valueofitems = $allProduct');
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(searchable: true,
          items: allProduct,

          initialValue: selectedItems!,
          onConfirm: (List<Map<String, String>>values) {
            setState(() {
              selectedItems = values;
            });
            print('confiremd : $values');
          },
        );
      },
    );
  }
}







