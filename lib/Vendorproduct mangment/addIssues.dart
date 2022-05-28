import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:collection/collection.dart';
import 'package:revoo/Vendorproduct%20mangment/model/goodissuemodel.dart';
import '../Controllers/myempcontroller.dart';
import '../Controllers/productController.dart';
import '../constants/constants.dart';

class AddGoodsIssue extends StatefulWidget {
  const AddGoodsIssue({Key? key}) : super(key: key);

  @override
  State<AddGoodsIssue> createState() => _AddGoodsIssueState();
}

class _AddGoodsIssueState extends State<AddGoodsIssue> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController productname = TextEditingController();
  TextEditingController producttype = TextEditingController();
  TextEditingController sellprice = TextEditingController();
  TextEditingController costprice = TextEditingController();

  var selectedProduct = '';

  @override
  Widget build(BuildContext context) {
    var firestore = FirebaseFirestore.instance;


    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,


          child: SingleChildScrollView(
              child: Padding(
                padding:   EdgeInsets.all(20.0),
                child:  Column(
                  children: [
                    SizedBox(height: 25),
                    Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Create Issue',style: TextStyle(fontSize: 30,color: kblue),)),
                      ],
                    ),

                    SizedBox(height: 20,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('Issue Title',style: TextStyle(fontSize: 16,color:kblue ),),

                        Divider(
                          height: 5,thickness: 2,
                        ),
                        TextFormField(
                          controller: productname,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                              filled: true,
                              fillColor: bgGrey,

                              hintText: 'Give a title',
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
                              child: Text('Description',style: TextStyle(fontSize: 18,color:kblue ),)),
                          Divider(
                            height: 5,thickness: 1,color: kblue,
                          ),
                          SizedBox(height: 4),
                          TextFormField(
                            controller: producttype,
                            decoration: InputDecoration(

                                filled: true,
                                fillColor: bgGrey,
                                hintText: 'Write description',
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

                          Align(alignment: Alignment.centerLeft,
                              child: Text('Select Product',style: TextStyle(fontSize: 18,color:kblue ),)),
                          SizedBox(height: 1),
                          Divider(
                            height: 5,thickness: 1,color: kblue,
                          ),
                          SizedBox(height: 5,),
                          GetX<ProductController>(
                              init: Get.put(ProductController()),
                              builder: (productsController) {

                                productsController.init('');

                                return  productsController.loading.value ?
                                kprogressbar
                                    : Container(
                                  height: 60,
                                  width: Get.width,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,borderRadius: new BorderRadius.circular(10.0),
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 3),
                                  child: DropdownSearch<String>(
                                    showSelectedItems: true,
                                    showSearchBox: true,
                                    items: productsController.productList
                                        .mapIndexed(
                                          (index, element) =>
                                          element.productname.toString(),
                                    )
                                        .toList(),
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Select Employee",
                                      hintText: "Employee",
                                    ),
                                    onChanged: (value) {
                                      print(value);

                                      var filteredDoc = productsController.productList.where((element) => element.productname == value).toList();

                                      setState(() {


                                        selectedProduct = filteredDoc.first.productname as String;
                                      });
                                    },
                                    selectedItem: productsController.productList.first.productname,
                                  ),
                                );
                              }
                          ),

                          // Container(
                          //   width: 200,
                          //   child: Row(
                          //     children: selectedItems!.map((e) {
                          //       return Text('${e['name']}, ');
                          //     }).toList(),
                          //   ),
                          // ),
                          SizedBox(height: 10,),

                          loading ? Center(child: CircularProgressIndicator(color: kblue,),) :   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Kdblue)
                                  ),
                                  onPressed: () async {
                                    if(productname.text.isEmpty ){
                                      print('not good1');
                                      Get.snackbar('Error', 'Please Enter All Details');
                                    }else{
                                      print('all good');

                                      var myEmp = MyEmpController.instance;

                                      setState(() {
                                        loading = true;
                                      });

                                      firestore.collection('Goodsissue').add(Goodsissuemodel(
                                          date: DateFormat('yyyy/MM/dd').format(DateTime.now()),
                                          issue: productname.text ?? '',
                                          description: producttype.text ?? '',
                                          product: selectedProduct ?? '',
                                          bid: myEmp.myepmlist.value.bid,
                                          cid: myEmp.myepmlist.value.cid,
                                          status: 'Initiated',
                                          user: '',
                                          id:''

                                      ).toJson(

                                      )).then((value) {
                                        firestore.collection('Goodsissue').doc(value.id).update({'id':value.id});
                                      });

                                      setState(() {
                                        loading = false;
                                      });
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


}
