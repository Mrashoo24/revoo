import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:revoo/Controllers/myempcontroller.dart';
import 'package:revoo/constants/constants.dart';
import 'package:revoo/model/CustomerModel.dart';

import '../model/orderModel.dart';

class AddOrders extends StatefulWidget {


  const AddOrders({Key? key,}) : super(key: key);

  @override
  _AddOrdersState createState() => _AddOrdersState();
}

class _AddOrdersState extends State<AddOrders> {
  TextEditingController name = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController customername = TextEditingController();
  TextEditingController customernumber = TextEditingController();
  TextEditingController customeremail = TextEditingController();
  TextEditingController customerAddress = TextEditingController();

  var selectedCustomer = '';

  bool search = false;
  bool searchcustomer = false;

  bool stock = true;
  var defaultItems = [
    {'id':'1','name':'Glasses'},
    {'id':'2','name':'Petals'},

  ];
  bool loading = false;
  var currentDate = DateTime.now();

  String searchText = '';
  String searchCustomerText = '';
  //List<Animal> _selectedAnimals = [];
  List<Map<String,String>>? selectedItems = [];


  _selectstartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate, // Refer step 1
      firstDate: DateTime(2000), lastDate: DateTime.now(),

    );
    if (picked != null && picked != currentDate)
      setState(() {
        currentDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {

    return GetX<MyEmpController>(
init:Get.put(MyEmpController()),
      builder: (myEmpController) {

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Kdblue),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
              child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Product Name',
                                style: TextStyle(color: kblue),
                              )),
                          SizedBox(height: 3),
                          Divider(
                            height: 1,
                          ),
                          SizedBox(height: 3),
                          TextField(
                            controller: name,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: bgGrey,
                              contentPadding:
                              EdgeInsets.only(left: 20, top: 2, bottom: 3),
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                            ),
                            onChanged: (value){

                              setState(() {
                                value.isEmpty ? search = false : search = true;
                                searchText = value;

                              });

                            },
                          ),
                          Visibility(
                            visible: search,
                            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                                stream:
                                FirebaseFirestore.instance
                                    .collection('Products').where('cid',isEqualTo: myEmpController.myepmlist.value.cid)
                                    .snapshots()  ,
                              builder: (context, snapshot) {

                                if (!snapshot.hasData) {

                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );

                                }

                                var compDocs = snapshot.requireData.docs;

                                print('commodel ${compDocs.length}');

                                compDocs =   compDocs.where((element) {
                                  return element.get('productname').toString().toUpperCase().contains(searchText.toString().toUpperCase());
                                }).toList();

                                return  Container(
                                  height: compDocs.isEmpty ? 50 :300,
                                  child:
                                  compDocs.isEmpty ? Text('No Product Found') :ListView.builder(
                                 itemCount: compDocs.length,
                                    itemBuilder: (context, index) {


                                      print('commodel');

                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                        ),
                                        // height: 200,
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap:(){
                                        setState(() {
                                          name = TextEditingController(text: compDocs[index]['productname']);
                                          search = false;
                                        });
                                      },
                                              child: Card(child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(compDocs[index]['productname']),
                                                  ),
                                                ],
                                              )),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                  ),
                                );
                              }
                            ),
                          ),

                          SizedBox(height: 10,),
                          buildTexForm(quantity,'Product Quantity'),
                          SizedBox(height: 10,),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Customer Name',
                                style: TextStyle(color: kblue),
                              )),
                          SizedBox(height: 3),
                          Divider(
                            height: 1,
                          ),
                          SizedBox(height: 3),
                          ///NEW CUSTOEMR
                          TextField(
                            controller: customername,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: bgGrey,
                              contentPadding:
                              EdgeInsets.only(left: 20, top: 2, bottom: 3),
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                            ),
                            onChanged: (value){

                              setState(() {
                                selectedCustomer = '';
                                value.isEmpty ? searchcustomer = false : searchcustomer = true;
                                searchCustomerText = value;

                              });

                            },
                          ),
                          Visibility(
                            visible: searchcustomer,
                            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                                stream:
                                FirebaseFirestore.instance
                                    .collection('Customers').where('cid',isEqualTo: myEmpController.myepmlist.value.cid)
                                    .snapshots()  ,
                                builder: (context, snapshot) {

                                  if (!snapshot.hasData) {

                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );

                                  }

                                  var compDocs = snapshot.requireData.docs;

                                  print('commodel ${compDocs.length}');

                                  compDocs =   compDocs.where((element) {
                                    return element.get('name').toString().toUpperCase().contains(searchCustomerText.toString().toUpperCase());
                                  }).toList();

                                  return  Container(
                                    height: compDocs.isEmpty ? 50 :300,
                                    child:
                                    compDocs.isEmpty ? Text('No Customer Found') :ListView.builder(
                                        itemCount: compDocs.length,
                                        itemBuilder: (context, index) {


                                          print('commodel');

                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                            ),
                                            // height: 200,
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      customername = TextEditingController(text: compDocs[index]['name']);
                                                      customeremail = TextEditingController(text: compDocs[index]['email']);
                                                      customerAddress = TextEditingController(text: compDocs[index]['address']);
                                                      customernumber = TextEditingController(text: compDocs[index]['number']);
                                                      selectedCustomer = compDocs[index]['name'];
                                                      searchcustomer = false;
                                                    });
                                                  },
                                                  child: Card(child: Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(compDocs[index]['name']),
                                                      ),
                                                    ],
                                                  )),
                                                )
                                              ],
                                            ),
                                          );
                                        }
                                    ),
                                  );
                                }
                            ),
                          ),

                          ///NEW CUSTOMER
                          // SizedBox(height: 10,),
                          // buildTexForm(customername,'Customer Name'),
                          SizedBox(height: 10,),
                          buildTexForm(customernumber,'Customer Number'),
                          SizedBox(height: 10,),
                          buildTexForm(customeremail,'Customer Email'),
                          SizedBox(height: 10,),
                          buildTexForm(customerAddress,'Customer Address'),
                          SizedBox(height: 10,),
                          Column(
                            children: [
                              Text("Select Date"),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {

                                  _selectstartDate(context);

                                },
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                        currentDate.toLocal().toString().split(' ')[0]),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Kdblue)),
                                ),
                              )
                            ],
                          ),

                          loading ? Center(child: CircularProgressIndicator(color: Kdblue,),) :   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Kdblue)
                                  ),
                                  onPressed: () async {


                                    if(name.text.isEmpty  || quantity.text.isEmpty){

                                      print('not good1');

                                    }else{

                                      print('prodname = ${name.text}');

                                      var comDoc1 = await FirebaseFirestore.instance
                                          .collection('Products').where(
                                          'productname', isEqualTo: name.text).get();

                                      print('prodname = ${comDoc1.docs.length}');

                                      if(comDoc1.docs.isEmpty){
                                        Get.snackbar('ERROR', 'No Product Found');
                                      }else{

                                        print('all good');
                                        setState(() {
                                          loading = true;
                                        });


                                      var ranNumber =   Random().nextInt(121121) + 10;

                                      var orderNumber = customername.text.toString().substring(0,customername.text.length > 3  ? 2 : customername.text.length ) + ranNumber.toString();


                                          FirebaseFirestore.instance.collection('Orders').add(
                                              OrderModel().toJson(OrderModel(

                                                  product: name.text ?? '',quantity: quantity.value.text ?? ''
                                                  ,price: comDoc1.docs.first.get('sellprice'),
                                                  cid: myEmpController.myepmlist.value.cid ?? '',cnumber: customernumber.text ?? '',
                                                  customer: customername.text ?? '',
                                                  status: 'Pending',date: DateFormat('yyyy/MM/dd').format(DateTime.now()),
                                                address: customerAddress.text,
                                                orderNumber: orderNumber,
                                                cemail: customeremail.text



                                              ))).then((value) async {

                                            FirebaseFirestore.instance.collection('Orders').doc(value.id).update({'id':value.id});

                                            QuerySnapshot<Map<String, dynamic>> dataOfProducts = await  FirebaseFirestore.instance.collection('Products')
                                                .where('productname',isEqualTo:name.text ).get();




                                            List listOfProducts = dataOfProducts.docs.where((element) {
                                              print('cid = ${element.get('cid')} ${myEmpController.myepmlist.value.cid}');
                                              return element.get('cid') == myEmpController.myepmlist.value.cid;
                                            }).toList();

                                            print('dataproducts = ${dataOfProducts.docs.length}');

                                            var prodId =  listOfProducts[0].get('id');
                                            var prodQuantity =  listOfProducts[0].get('quantity');
                                            var newQuanitity = double.parse(prodQuantity) - double.parse(quantity.text);

                                            List<Map<String, String>>? newlist = [];

                                            List list1 =  jsonDecode(listOfProducts[0].get('components'));


                                            list1.forEach((element) {
                                              newlist.add(

                                                  {"quantity":element['quantity'],'name': element['name'],
                                                    'unit' :  element['unit']}

                                              );
                                            });


                                            await    FirebaseFirestore.instance.collection('Products').doc(prodId).update({
                                              'quantity' : newQuanitity.toString()
                                            });

                                            await     Future.forEach(newlist,(Map<String, String> element) async {
                                              var compid = element['name'];
                                              var consumeQuan = element['quantity'];

                                              var difQuantity = double.parse(consumeQuan!) * double.parse(quantity.text) ;

                                              var componentData =  await    FirebaseFirestore.instance.collection('Inventory').where('name' ,isEqualTo: compid).get();

                                              var oldQuanitty = componentData.docs[0].get('quantity');


                                              var newQuantity1 = double.parse(oldQuanitty!) - (double.parse(consumeQuan) * double.parse(quantity.text))  ;

                                              await      FirebaseFirestore.instance.collection('Inventory').doc(componentData.docs[0].id).update({

                                                'quantity' : newQuantity1.toString()

                                              });


                                            }
                                            );

                                         var customerDoc =   await FirebaseFirestore.instance.collection('Customers').where('name',isEqualTo: selectedCustomer)
                                            .where('cid',isEqualTo: myEmpController.myepmlist.value.cid).get();

                                           if(customerDoc.docs.isEmpty){
                                            await FirebaseFirestore.instance.collection('Customers').add(CustomerModel().toJson(
                                                 CustomerModel(
                                                   cid: myEmpController.myepmlist.value.cid,
                                                   bid: myEmpController.myepmlist.value.bid,
                                                   name: customername.text,
                                                   id: '',
                                                     number:customernumber.text,
                                                     address:customerAddress.text,
                                                     email:customeremail.text,
                                                     orders:'0'

                                                 )

                                             )).then((value) {
                                               FirebaseFirestore.instance.collection('Customers').doc(value.id).update({'id':value.id});
                                             });


                                           }else{
                                             var customerId   =customerDoc.docs.first.id;
                                          var newOrder =  double.parse(  customerDoc.docs.first.get('orders') ) + 1 ;

                                           await   FirebaseFirestore.instance.collection('Customers').doc(customerId).update({'orders':newOrder.round().toString()});


                                           }


                                            setState(() {
                                              loading = false;
                                            });
                                            Get.back();
                                          });

                                        // else{
                                        //
                                        //
                                        //   FirebaseFirestore.instance.collection('Inventory').doc(widget.id).update(OrderModel().toJson(OrderModel(
                                        //       product: name.text,quantity: quantity.value.text
                                        //       ,price: '100',
                                        //       cid: compModel['cid'],cnumber: customernumber.text,customer: customername.text,
                                        //       status: 'Pending',date: DateFormat('yyyy/MM/dd').format(DateTime.now())
                                        //
                                        //
                                        //   ))).then((value) {
                                        //     setState(() {
                                        //       loading = false;
                                        //     });
                                        //     Get.back();
                                        //   });
                                        // }



                                      }




                                    }



                                  }, child: Text('Add')),

                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Kdblue)
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
        );
      }
    );
  }

  TextField buildTextField(TextEditingController controller,hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          labelText: hint,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: hint,
          fillColor: Colors.white70),
    );
  }

  Column buildTexForm(controller,title) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(color: kblue),
            )),
        SizedBox(height: 3),
        Divider(
          height: 1,
        ),
        SizedBox(height: 3),
        Container(
          height: 32,
          child: Container(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: bgGrey,
                contentPadding:
                EdgeInsets.only(left: 20, top: 2, bottom: 3),
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius:
                    BorderRadius.all(Radius.circular(12))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius:
                    BorderRadius.all(Radius.circular(12))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius:
                    BorderRadius.all(Radius.circular(12))),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
