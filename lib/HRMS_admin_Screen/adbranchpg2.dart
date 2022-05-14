import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:revoo/Controllers/authcontroller.dart';

import 'package:revoo/HRMS_admin_Screen/adbranchpg4.dart';

import '../constants/constants.dart';
import '../constants/map.dart';
import '../home/homepage.dart';


class AddBranches extends StatefulWidget {


  const AddBranches({Key? key,}) : super(key: key);

  @override
  _DBcrudState createState() => _DBcrudState();
}

class _DBcrudState extends State<AddBranches> {

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
   String location1  = '';

  var latitude;
  var longitude;

  bool loading = false ;

  var userAddressFeature = "";
  var userAddress = "";
  var locationAvailable = "";
  late String addressfromFirestore;
  bool gorLocation = false;

  var selectedType = 0;

  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  var userLatitude = "";
  var userLongitude = "";
  late GeoPoint userGeoPoint;

  @override
  Widget build(BuildContext context) {

    var firestore =  FirebaseFirestore.instance;

    Future<List> getLocation() async {
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          Get.snackbar(
              "Error", "Please Turn on Location to Show Restaurant Near You");
          return [43.69289033334936, -105.21582876032612];
        }
      }

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          Get.snackbar(
              "Error", "Please Turn on Location to Show Restaurant Near You");

          return [43.69289033334936, -105.21582876032612];
        }
      }

      _locationData = await location.getLocation();

      setState(() {
        latitude = _locationData.latitude;
        longitude = _locationData.longitude;
      });

      print('getting location = $_locationData');
      return [_locationData.latitude, _locationData.longitude];
    }

//     Future<List<coder.Address>> getAddress(double lat, double lon) async {
//       // // From a query
//       // final query = "1600 Amphiteatre Parkway, Mountain View";
//       // var addresses = await Geocoder.local.findAddressesFromQuery(query);
//       // var first = addresses.first;
//       // print("${first.featureName} : ${first.coordinates}");
//
// // From coordinates
//       final coordinates = coder.Coordinates(lat, lon);
//
//
//       var addresses =
//       await Geocoder.local.findAddressesFromCoordinates(coordinates);
//       var first = addresses.first;
//       var code = first.postalCode ?? first.countryCode;
//       print(" : ${first.countryCode}");
//
//       // var pref = await SharedPreferences.getInstance();
//       // pref.setString("address", first.addressLine);
//       // pref.setString("code", code);
//
//       // var curSymbol = getCurrency(first.countryCode == 'IN'
//       //     ? 'INR'
//       //     : first.countryCode == 'KW'
//       //     ? 'KWT'
//       //     : first.countryCode == 'QA'
//       //     ? "QAT"
//       //     : "USD");
//
//       // pref.setString('gsymbol', curSymbol);
//       // print('currency symbol $curSymbol');
//
//       return addresses;
//     }


    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'Create Branch',
                style: TextStyle(color: kblue, fontSize: 30),
              ),
              Divider(
                height: 10,
                thickness: 4,
                color: Kdblue,
                endIndent: 90,
                indent: 90,
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Kdblue),
        ),
        body: Container(
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/dpbrCRUD.png')),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 25, bottom: 25),
                            hintText: 'Branch Name',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '*optional',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          )),
                      TextFormField(
                        controller: address,

                        decoration: InputDecoration(
                            filled: true,
                            fillColor: bgGrey,
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 25, bottom: 25),
                            hintText: 'Address',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    loading ? kprogressbar :  InkWell(
                        onTap: () async {
                          setState(() {
                            loading = true;
                          });
                          await getLocation();
                          Get.to(MapScreen(
                              loc: LatLng(latitude, longitude),

                              userRef: ''),
                            fullscreenDialog: true

                          )?.then((value) {
                                print('result = $value');
                                setState(() {
                                 latitude = value[0]['lat'];
                                  longitude = value[0]['lon'];
                                  location1 = value[0]['address'];
                                });
                          });
                          setState(() {
                            loading = false;
                          });
                        },
                        child: TextFormField(

                    enabled: false,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: bgGrey,
                              contentPadding:
                              EdgeInsets.only(left: 20, top: 25, bottom: 25),
                              hintText: latitude == null ? 'Location' : location1   ,
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),

                      SizedBox(
                        height: 12,
                      ),

                    ],
                  ),
                  Text(
                    'By clicking continue, you agree to the',
                    style: TextStyle(color: kblue, fontSize: 12),
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        text: ' Terms & Continue ',
                        style: TextStyle(
                          color: kyellow,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: 'and',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: ' Privacy Policy ',
                            style: TextStyle(
                              color: kyellow,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'of Revoo',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              side: BorderSide(width: 3.0, color: kblue),
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 11),
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          child: Center(
                              child: Text(
                            '< Back',
                            style: TextStyle(color: kblue, fontSize: 15),
                          ))),
                      SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () async {
                          var uid =FirebaseAuth.instance.currentUser!.uid;

                          var userdata = await firestore.collection('Employee').doc(uid).get();

                        await firestore.collection('Branch').add(
                           {
                             'branch_name':name.text,
                             'address':address.text,
                             'location' : [latitude,longitude],
                             'locality' : location1,
                             'cid' : userdata.get('cid')
                           }
                         ).then((value) async {
                          await firestore.collection('Branch').doc(value.id).update({
                            'bid' :value.id
                          });
                        });
                     var docSnap =  await firestore.collection('Branch').doc('etsPUmBE29lqbbhR4G2C').get();
                     print(docSnap.data());
                        Get.to(HomePageMain(userDoc: userdata,));
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
                          child: Center(
                              child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
