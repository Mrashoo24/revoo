import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:revoo/Controllers/myempcontroller.dart';

import '../Controllers/IpcatagoryController.dart';
import '../constants/constants.dart';
import '../model/IpcatagoryModel.dart';
import '../model/productmodel.dart';
import 'addproductselectcomponent.dart';

class Editproduct extends StatefulWidget {
 final String productname ,
producttype ,
sellprice,
costprice ,
productcategoryvalue ;
final List selectedItems ;

  const Editproduct({Key? key, required this.productname, required this.producttype, required this.sellprice, required this.costprice, required this.productcategoryvalue, required this.selectedItems, }) : super(key: key);

  @override
  _EditproductState createState() => _EditproductState();
}

class _EditproductState extends State<Editproduct> {

  int _counter = 1;
  increment(){
    setState(() {
      _counter++;

    });

  }

  decrement(){
    if(_counter == 1){

    }else{
      setState(() {
        _counter--;

      });
    }

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
      image = imageTemporory);

    } on PlatformException catch (e){
      print('Failed to pick image: $e');
    }
  }


  String initialValue = 'Product category';
  var productcategoryvalue = 'Product category0';
  List? selectedItems = [];

  var itemList = [
    // 'Product category',
    // 'product category1',
    // 'product category2',
    // 'product category3',
    // 'product category4',
    DropdownMenuItem(child: Text('Product category0'),value:'Product category0' ,),
    DropdownMenuItem(child: Text('Product category1'),value:'Product category1' ,),
    DropdownMenuItem(child: Text('Product category2'),value:'Product category2' ,),
    DropdownMenuItem(child: Text('Product category3'),value:'Product category3' ,),
    DropdownMenuItem(child: Text('Product category4'),value:'Product category4' ,),
  ];
  String initialValue1 = 'Product Component';
  var componentlist =[
    'Product Component',
    'product Component1',
    'product Component2',
    'product Component3',
    'product Component4',
  ];
  bool loading = false;
  TextEditingController productname = TextEditingController();
  TextEditingController producttype = TextEditingController();
  TextEditingController sellprice = TextEditingController();
  TextEditingController costprice = TextEditingController();

  @override
  void initState() {
    setState(() {
      productname = TextEditingController(text: widget.productname);
      producttype = TextEditingController(text: widget.producttype);
      sellprice = TextEditingController(text: widget.sellprice);
      costprice = TextEditingController(text: widget.costprice);
      productcategoryvalue = widget.productcategoryvalue;
      selectedItems = widget.selectedItems;
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var firestore = FirebaseFirestore.instance;


    print('gotimage = $image');

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,


          child: SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
                stream:firestore.collection('product').snapshots() ,
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return kprogressbar;
                  }

                  return Padding(
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

                        SizedBox(height: 20,),
                        // image == null ?   Container(
                        //      width: Get.width,
                        //
                        //      child: Row(
                        //        mainAxisSize: MainAxisSize.max,
                        //        children: [
                        //          Stack(
                        //            alignment: Alignment.bottomRight,
                        //            children:[
                        //              Container(
                        //                height: 100,
                        //                width: 100,
                        //                decoration: BoxDecoration(
                        //                  color: Colors.grey.shade300,
                        //
                        //
                        //                ),
                        //                child: InkWell(
                        //
                        //                  onTap: (){
                        //                    pickImage();
                        //                  },
                        //                  // onTap: ()async{
                        //                  //   final result = await  FilePicker.platform.pickFiles(
                        //                  //   allowMultiple: false,
                        //                  //   type: Filrtype.custom,
                        //                  //   allowedExtentions['png','jpg'],
                        //                  //   );
                        //                  //   },
                        //                  child: Icon(
                        //                    Icons.production_quantity_limits_outlined,
                        //                    size: 50,
                        //                    color:  Colors.grey,
                        //                  ),
                        //                ),
                        //              ),
                        //              InkWell(
                        //
                        //                onTap: (){
                        //                  pickImage1();
                        //                },
                        //
                        //                child: Icon(Icons.camera_alt_rounded,size: 20,color: Colors.grey[500],),
                        //              ),
                        //            ],
                        //          ),SizedBox(width: 10,),
                        //          Expanded(
                        //
                        //
                        //            child:
                        //            Column(
                        //              mainAxisAlignment: MainAxisAlignment.start,
                        //              crossAxisAlignment: CrossAxisAlignment.start,
                        //              children: [
                        //
                        //                Text('Product name',style: TextStyle(fontSize: 16,color:kblue ),),
                        //
                        //                Divider(
                        //                  height: 5,thickness: 2,
                        //                ),
                        //                TextFormField(
                        //                  controller: productname,
                        //                  decoration: InputDecoration(
                        //                    contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                        //                      filled: true,
                        //                      fillColor: bgGrey,
                        //
                        //                      hintText: 'Enter Name',
                        //                      border: OutlineInputBorder(
                        //                          borderSide: BorderSide(color: Colors.white)
                        //                      ),
                        //                      focusedBorder: OutlineInputBorder(
                        //                          borderSide: BorderSide(color: Colors.white)
                        //                      ),
                        //                      enabledBorder:OutlineInputBorder(
                        //                          borderSide: BorderSide(color: Colors.white)
                        //                      )
                        //
                        //                  ),
                        //                ),
                        //              ],
                        //            ),
                        //          ),
                        //        ],
                        //      ),
                        //    )
                        //    : Container(
                        //   width: Get.width,
                        //
                        //   child: Row(
                        //     mainAxisSize: MainAxisSize.max,
                        //     children: [
                        //       Stack(
                        //         alignment: Alignment.bottomRight,
                        //         children:[
                        //           Container(
                        //             height: 100,
                        //             width: 100,
                        //             decoration: BoxDecoration(
                        //               color: Colors.grey.shade300,
                        //
                        //
                        //             ),
                        //             child: InkWell(
                        //
                        //               onTap: (){
                        //                 pickImage();
                        //               },
                        //               // onTap: ()async{
                        //               //   final result = await  FilePicker.platform.pickFiles(
                        //               //   allowMultiple: false,
                        //               //   type: Filrtype.custom,
                        //               //   allowedExtentions['png','jpg'],
                        //               //   );
                        //               //   },
                        //               child: Image.file(
                        //                image!,
                        //                fit: BoxFit.fill,
                        //               ),
                        //             ),
                        //           ),
                        //           InkWell(
                        //
                        //             onTap: (){
                        //               pickImage1();
                        //             },
                        //
                        //             child: Icon(Icons.camera_alt_rounded,size: 20,color: Colors.grey[500],),
                        //           ),
                        //         ],
                        //       ),SizedBox(width: 10,),
                        //       Expanded(
                        //
                        //
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //
                        //             Text('Product name',style: TextStyle(fontSize: 16,color:kblue ),),
                        //
                        //             Divider(
                        //               height: 5,thickness: 2,
                        //             ),
                        //             TextFormField(
                        //               controller: productname,
                        //               decoration: InputDecoration(
                        //                   contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                        //                   filled: true,
                        //                   fillColor: bgGrey,
                        //
                        //                   hintText: 'Enter Name',
                        //                   border: OutlineInputBorder(
                        //                       borderSide: BorderSide(color: Colors.white)
                        //                   ),
                        //                   focusedBorder: OutlineInputBorder(
                        //                       borderSide: BorderSide(color: Colors.white)
                        //                   ),
                        //                   enabledBorder:OutlineInputBorder(
                        //                       borderSide: BorderSide(color: Colors.white)
                        //                   )
                        //
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // )
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('Product name',style: TextStyle(fontSize: 16,color:kblue ),),

                            Divider(
                              height: 5,thickness: 2,
                            ),
                            TextFormField(
                              controller: productname,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                                  filled: true,
                                  fillColor: bgGrey,

                                  hintText: 'Enter Name',
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
                          ],
                        ),

                        // Row(
                        //   children: [
                        //     Text('Upload a product picture',style: TextStyle(color: kblue),),
                        //   ],
                        // ),
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
                              TextFormField(
                                controller: producttype,
                                decoration: InputDecoration(

                                    filled: true,
                                    fillColor: bgGrey,
                                    hintText: 'Product Type',
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
                                          Text("Cost Price",style: TextStyle(fontSize: 18,color:kblue ),),
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
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 120,
                                    color: Colors.grey[300],
                                    child: Center(
                                      child: Text(
                                        'Add Quantity',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width:15),
                                  Container(
                                    height: 30, width: 100,
                                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(5),color: Colors.grey[300],),

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: increment,
                                          child: Icon(Icons.add,color: kblue,size: 20,),
                                        ),

                                        VerticalDivider(indent: 1,endIndent: 1,color: kblue,),
                                        InkWell(
                                          onTap :decrement ,

                                          child: Icon(Icons.remove,color: kblue,size: 20,),
                                        ),
                                        VerticalDivider(indent: 1,endIndent: 1,color: kblue,),

                                        Text("$_counter",style: TextStyle(fontSize: 14,color:  kblue),),

                                      ],
                                    ),

                                  ),
                                ],



                              ),
                              SizedBox(height: 20,),
                              // SizedBox(height: 1),
                              // Align(
                              //     alignment: Alignment.centerLeft,
                              //     child
                              //
                              //         : Text('Tags',style: TextStyle(fontSize: 18,color:kblue ),)),
                              // Divider(
                              //   height: 5,thickness: 1,color: kblue,
                              // ),
                              // Container(
                              //   height: 42,
                              //   width: 400,
                              //
                              //   child: TextFormField(
                              //     decoration: InputDecoration(
                              //         filled: true,
                              //         fillColor: bgGrey,
                              //
                              //         border: OutlineInputBorder(
                              //             borderSide: BorderSide(color: Colors.white)
                              //         ),
                              //         focusedBorder: OutlineInputBorder(
                              //             borderSide: BorderSide(color: Colors.white)
                              //         ),
                              //         enabledBorder:OutlineInputBorder(
                              //             borderSide: BorderSide(color: Colors.white)
                              //         )
                              //
                              //     ),
                              //   ),
                              // ),
                              Align(alignment: Alignment.centerLeft,
                                  child: Text('Product category',style: TextStyle(fontSize: 18,color:kblue ),)),
                              SizedBox(height: 1),
                              Divider(
                                height: 5,thickness: 1,color: kblue,
                              ),
                              SizedBox(height: 5,),
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
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //        DropdownButton <String?>(
                              //         value:productcategoryvalue,
                              //         onChanged: (String? value){
                              //           setState(() {
                              //             productcategoryvalue = value!;
                              //           });
                              //         },
                              //         items: itemList,
                              //       ),
                              //
                              //   ],
                              // ),
                              SizedBox(height: 20,),
                              Align(alignment: Alignment.centerLeft,
                                  child: Text('Product Components',style: TextStyle(fontSize: 18,color:kblue ),)),
                              SizedBox(height: 1),
                              Divider(
                                height: 5,thickness: 1,color: kblue,
                              ),

                              InkWell(
                                onTap: (){

                                  _showMultiSelect(context);

                                  // showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       return StatefulBuilder(
                                  //           builder: (context,
                                  //               setDialogState) {
                                  //             return AlertDialog(
                                  //               title:
                                  //               Text('Component List'),
                                  //               content: AddComponents(
                                  //                 name: ProductModel().name,
                                  //                 price: ProductModel().purchaseprice,
                                  //                 quantity: ProductModel().quantity,
                                  //                 type: 'edit',
                                  //                 id: ProductModel().id,
                                  //
                                  //                 // selecteditems: newlist,
                                  //               ),
                                  //             );
                                  //           },
                                  //           );
                                  //     }
                                  //     );
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
                              SizedBox(height: 20),


                              //N EW
                              SizedBox(height: 5,),
                              Container(
                                width: 200,
                                child: Row(
                                  children: selectedItems!.map((e) {
                                    return Text('${e['name']}, ');
                                  }).toList(),
                                ),
                              ),
                              SizedBox(height: 10,),
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

                                                    labelText: selectedItems![index]['quantity'],
                                                    labelStyle: TextStyle(color: Colors.grey[800],fontSize: 8),
                                                    hintStyle: TextStyle(color: Colors.grey[800],fontSize: 8),
                                                    hintText: selectedItems![index]['quantity'],
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
                              SizedBox(height: 10,),

                              loading ? Center(child: CircularProgressIndicator(color: kblue,),) :   Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(Kdblue)
                                      ),
                                      onPressed: () async {
                                        if(productname.text.isEmpty || costprice.text.isEmpty || _counter.toString().isEmpty|| selectedItems!.isEmpty){
                                          print('not good1');
                                          Get.snackbar('Error', 'Please Enter All Details');
                                        }else{
                                          print('all good');

                                          var myEmp = MyEmpController.instance;

                                          setState(() {
                                            loading = true;
                                          });
                                          FirebaseFirestore.instance.collection('Products').add(
                                              ProductModel().toJson(ProductModel(
                                                  productname: productname.text,
                                                  quantity: _counter.round().toString(),
                                                  components: jsonEncode(selectedItems),
                                                  costprice: costprice.text,
                                                  sellprice: sellprice.text,
                                                  producttype: producttype.text,
                                                  cid: myEmp.myepmlist.value.cid,
                                                  productcategory: productcategoryvalue,
                                                  date:DateFormat('yyyy/MM/dd').format(DateTime.now())

                                                //              "costprice":  costprice.text,
                                                //              "productname": productname.text,
                                                //              "sellprice": sellprice.text,
                                                //              "producttype":producttype.text,
                                                //              "productcategory": productcategoryvalue,
                                                //              "unit": _counter.toString(),
                                              ))).then((value) {
                                            FirebaseFirestore.instance.collection('Products').doc(value.id).update({'id':value.id});

                                            setState(() {
                                              loading = false;
                                            });
                                            Get.back();
                                          });
                                          // else{
                                          //
                                          //
                                          //   FirebaseFirestore.instance.collection('Inventory').doc(widget.id).update(ProductModel().toJson(ProductModel(
                                          //       name: productname.text,quantity: _counter.toString(),sold: '0',components:  jsonEncode(selectedItems),purchaseprice: '100',
                                          //       sellprice: sellprice.text,
                                          //       cid: compModel['cid']
                                          //   ))).then((value) {
                                          //     setState(() {
                                          //       loading = false;
                                          //     });
                                          //     Get.back();
                                          //   });
                                          // }



                                        }



                                      }, child: Text('Add')),

                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Kdblue),
                                      ),
                                      onPressed: (){
                                        Get.back();
                                      }, child: Text('Cancel')),

                                ],
                              ),


                              // Row(
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              //     ElevatedButton(
                              //         style: ButtonStyle(
                              //             backgroundColor: MaterialStateProperty.all(kblue)
                              //         ),
                              //         onPressed: (){
                              //           Get.back();
                              //         }, child: Text('Back')),
                              //     SizedBox(width: 25,),
                              //
                              //
                              //     ElevatedButton(
                              //         style: ButtonStyle(
                              //             backgroundColor: MaterialStateProperty.all(kblue)
                              //         ),
                              //         onPressed: ()async{
                              //           await firestore.collection('Product').add(
                              //            {
                              //              "costprice":  costprice.text,
                              //              "productname": productname.text,
                              //              "sellprice": sellprice.text,
                              //              "producttype":producttype.text,
                              //              "productcategory": productcategoryvalue,
                              //              "unit": _counter.toString(),
                              //
                              //            }
                              //           ).then((value)  async
                              //           {
                              //             await firestore.collection('Product').doc(value.id).update(
                              //                 {'cid': value.id
                              //                 });
                              //           }
                              //           );
                              //         }, child: Text('Add')),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
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

  void _showMultiSelect(BuildContext context) async {
    QuerySnapshot<Map<String, dynamic>> ProductDocs = await FirebaseFirestore
        .instance.collection('Component').get();


    List<MultiSelectItem<Map<String, String>>> allProduct = [];

    ProductDocs.docs.forEach((element) {
      Map<String, dynamic> newList = element.data();
      Map<String, String> newList1 = {

        // "costprice":  costprice.text,
        // "productname": productname.text,
        // "sellprice": sellprice.text,
        // "producttype":producttype.text,
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
          onConfirm: (List values) {
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
