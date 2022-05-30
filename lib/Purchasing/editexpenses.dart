import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
class EditExpenses extends StatefulWidget {
  final String? amount;
  final String? product;
  final String? quantity;
  final String? indId;
  final String? date;
  const EditExpenses({Key? key, this.amount, this.product,this.indId,this.date,this.quantity}) : super(key: key);
  @override
  State<EditExpenses> createState() => _EditExpensesState();
}
class _EditExpensesState extends State<EditExpenses> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController amount = TextEditingController();
  TextEditingController  product = TextEditingController();
  TextEditingController quantity = TextEditingController();
  var firebase1 = FirebaseFirestore.instance.collection("expenses");
  //////////////////////////////////////////
  DateTime date = DateTime.now();
  @override
  void initState(){
    setState(() {
      amount = widget.amount == null ? TextEditingController() : TextEditingController(text: widget.amount);
      quantity = widget.quantity == null ? TextEditingController() : TextEditingController(text: widget.quantity);
      product = widget.product == null ? TextEditingController() : TextEditingController(text: widget.product);

    });
  }
  //////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text("Add Product"),content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: (val){
                    if(val!.length < 1){
                      return "plesae enter the product name";
                    }
                  },
                  controller: product,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                      filled: true,
                      fillColor: bgGrey,
                      hintText: "Expense Name",                                              //branch

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
                SizedBox(height: 25),
                TextFormField(
                  validator: (val){
                    if(val!.length < 1){
                      return "plesae enter the product name";
                    }
                  },
                  controller: quantity,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                      filled: true,
                      fillColor: bgGrey,
                      hintText: "Quantity",                                              //branch

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
                      ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  validator: (val){
                    if(val!.length < 1){
                      return "plesae enter the product amount";
                    }
                  },
                  controller: amount,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                      filled: true,
                      fillColor: bgGrey,
                      hintText: "Quantity",                                              //branch

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
                      ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () async{
                  DateTime? newDate = await showDatePicker(context: context,
                      initialDate: date,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  if(newDate == null) return;
                  setState(() {
                    date = newDate;
                  });
                },
                  child: Text("${date.day}/${date.month}/${date.year}"),),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: (){
                      var datte = "${date.day}/${date.month}/${date.year}";
                      if(_formKey.currentState!.validate()){
                        firebase1.doc(widget.indId).update({
                          "product":product.text,
                          "quantity":quantity.text,
                          "amount":amount.text,
                          "date":datte
                        });
                        Navigator.of(context).pop();
                      }
                    }, child: Text("update"),
                    ),
                    ElevatedButton(onPressed: (){Navigator.of(context).pop();},
                      child: Text("Cancel"),),
                  ],
                ),
              ],
            ),
        ),
      ],
    ),
    );
  }
}
