
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:revoo/constants/constants.dart';

class AddComponents extends StatefulWidget {

  final String? name ;
  final String? quantity;
  final String? price ;
  final String? type;
  final String? id;
  final List<Map<String,String>>? selecteditems;
  const AddComponents({Key? key, this.name, this.quantity, this.price, required this.selecteditems, this.type, this.id}) : super(key: key);

  @override
  _AddComponentsState createState() => _AddComponentsState();
}

class _AddComponentsState extends State<AddComponents> {
  String initialValue = '';
  
  bool stock = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //List<Animal> _selectedAnimals = [];
  List<Map<String,String>>? selectedItems = [];
  bool loading = false;
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Padding(
              padding:   EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Add Product",style: TextStyle(fontSize: 30,color: kblue),),

                  TextField(

                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,

                        hintStyle: TextStyle(color: Colors.grey[800]),

                        fillColor: Colors.white70),
                  ),
                  SizedBox(height: 20),

                  TextField(

                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,

                        hintStyle: TextStyle(color: Colors.grey[800]),

                        fillColor: Colors.white70),
                  ),
                  SizedBox(height: 20),

                  TextField(

                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,

                        hintStyle: TextStyle(color: Colors.grey[800]),

                        fillColor: Colors.white70),
                  ),
                  SizedBox(height: 10),

                  InkWell(

                    onTap: (){
                      _showMultiSelect(context);
                    },
                    child: Container(
                      color: kblue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Select Components',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(kblue)
                          ),
                          onPressed: (){
                            Get.back();
                          }, child: Text('Cancel')),
                      SizedBox(width: 10),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(kblue)
                          ),
                          onPressed: (){
                            Get.back();
                          }, child: Text('Cancel')),
                    ],
                  ),

                ],
              ),
            )
        ),
      ),

    );
  }

  void _showMultiSelect(BuildContext context) async {

    QuerySnapshot<Map<String, dynamic>> inventDocs = await  FirebaseFirestore.instance.collection('Inventory').get();



    List<Map<String,String>> allInventory = [];

    inventDocs.docs.forEach((element) {

      Map<String, dynamic> newList = element.data();
      Map<String, String> newList1 = {
        'id': newList['comid'],
        'name': newList['name'],
        'unit': newList['unit'],
        'quantity': '0',
      };





    });

    print('valueofitems = $allInventory');

    print('list ${widget.selecteditems}');


  }
}
