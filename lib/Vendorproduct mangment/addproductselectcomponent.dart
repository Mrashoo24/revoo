import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../model/productmodel.dart';

class AddComponents extends StatefulWidget {


  final String? name ;
  final String? quantity;
  final String? price ;
  final String? type;
  final String? id;
  final List<Map<String,String>>? selecteditems;


  const AddComponents( {Key? key, this.name, this.quantity, this.price,   this.type, this.id, this.selecteditems}) : super(key: key);


  @override
  _AddComponentsState createState() => _AddComponentsState();
}

class _AddComponentsState extends State<AddComponents> {




  TextEditingController name = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();

  bool stock = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // List<Animal> _selectedAnimals = [];
  List<Map<String,String>>? selectedItems = [];
  bool loading = false;

  @override
  void initState() {
    // print('list = ${widget.selecteditems}');
    setState(() {
      name = widget.name == null ? TextEditingController() : TextEditingController(text:widget.name) ;
      quantity = widget.quantity == null ? TextEditingController() : TextEditingController(text:widget.quantity) ;
      price = widget.price == null ? TextEditingController() : TextEditingController(text:widget.price) ;
      selectedItems = widget.selecteditems ;
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [


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
                            width: 100,
                            child: Text(selectedItems![index]['name']!)),
                        SizedBox(width: 10,),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 30,
                            child: Text(selectedItems![index]['unit']!,
                              style: TextStyle(fontSize: 10),),
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
                                labelStyle: TextStyle(
                                    color: Colors.grey[800], fontSize: 8),
                                hintStyle: TextStyle(
                                    color: Colors.grey[800], fontSize: 8),
                                hintText: 'Quantity',
                                fillColor: Colors.white70),
                            keyboardType: TextInputType.number,
                            onChanged: (value1) {
                              print('previo = ${selectedItems![index]}');
                              print('value = $value1');

                              selectedItems![index].update(
                                  'quantity', (value) => value1.toString());

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

          loading
              ? Center(child: CircularProgressIndicator(color: kblue,),)
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kblue)
                  ),
                  onPressed: () async {
                    if (name.text.isEmpty || price.text.isEmpty ||
                        quantity.text.isEmpty || selectedItems!.isEmpty) {
                      print('not good1');
                    } else {
                      print('all good');
                      setState(() {
                        loading = true;
                      });

                      var pref = await SharedPreferences.getInstance();
                      print('hivename = ${pref.get('compModel')}');

                      String compModel1 = pref.getString('compModel')
                          .toString();

                      var compModel = jsonDecode(compModel1);
                      print('compModel = $compModel');


                      if (widget!.type == 'add') {
                        FirebaseFirestore.instance.collection('Products').add(
                            ProductModel().toJson(ProductModel(
                                productname: name.text,
                                quantity: quantity.value.text,
                                sold: '0',
                                components: jsonEncode(selectedItems),
                                purchaseprice: '100',
                                sellprice: price.text,
                                cid: compModel['cid']
                            ))).then((value) {
                          FirebaseFirestore.instance.collection('Products').doc(
                              value.id).update({'id': value.id});

                          setState(() {
                            loading = false;
                          });
                          Get.back();
                        });
                      } else {
                        FirebaseFirestore.instance.collection('Products').doc(
                            widget.id).update(
                            ProductModel().toJson(ProductModel(
                                productname: name.text,
                                quantity: quantity.value.text,
                                sold: '0',
                                components: jsonEncode(selectedItems),
                                purchaseprice: '100',
                                sellprice: price.text,
                                cid: compModel['cid']
                            ))).then((value) {
                          setState(() {
                            loading = false;
                          });
                          Get.back();
                        });
                      }
                    }
                  }, child: Text('Add')),

              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kblue)
                  ),
                  onPressed: () {
                    Get.back();
                  }, child: Text('Cancel')),

            ],
          )

          // Column(
          //   children: [
          //     Container(
          //       width: 50,
          //       height: 50,
          //       child: Icon(Icons.image),
          //     ),
          //     Text('Upload Photo')
          //   ],
          // ),

        ],
      ),
    );
  }




  void _showMultiSelect(BuildContext context) async {
    QuerySnapshot<Map<String, dynamic>> inventDocs = await FirebaseFirestore
        .instance.collection('Product').get();


      List<MultiSelectItem<Map<String, String>>> allProduct = [];

    inventDocs.docs.forEach((element) {
      Map<String, dynamic> newList = element.data();
      Map<String, String> newList1 = {
        'id': newList['comid'],
        'name': newList['name'],
        'unit': newList['unit'],
        'quantity': '0',
      };


      allProduct.add(MultiSelectItem(newList1, element.get('Product')));
    });

    print('valueofitems = $allProduct');

    print('list ${widget.selecteditems}');

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