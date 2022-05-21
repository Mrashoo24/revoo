import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:revoo/Map/mapscreen2.dart';
import 'package:revoo/constants/constants.dart';
import 'package:collection/collection.dart';


class TripUsers extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> userDoc ;
  const TripUsers({Key? key,required this.userDoc}) : super(key: key);

  @override
  _TripUsersState createState() => _TripUsersState();
}

class _TripUsersState extends State<TripUsers> {

  String? dateSelected ;
  String search = '';
  bool loading = false;
  List newListOfCoarse = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Select Employee'),
          centerTitle: true,
          backgroundColor: Kdblue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {

                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime.now()
                          .subtract(const Duration(days: 120)),
                      maxTime: DateTime(2050, 6, 7),
                      onChanged: (date) {
                        print('date : ${DateFormat('yyyy/MM/dd').format(date)}');
                        setState(() {
                          dateSelected = DateFormat('yyyy/MM/dd').format(date);
                        });
                      },
                      onConfirm: (date) {
                        setState(() {
                          dateSelected = DateFormat('yyyy/MM/dd').format(date);
                        });
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.en,
                    );
                  },
                  child:
                  Container(
                    color: Kdblue,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(dateSelected == null
                          ? "From Date"
                          : dateSelected.toString(),
                          style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance.collection('Employee').where('cid',isEqualTo: widget.userDoc.get('cid')).get(),
                // future: _allApi.getAllUsers(widget.userModel.companyid),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return kprogressbar;
                  } else if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('Nothing to show here.'),
                    );
                  } else {
                    var users = search.isEmpty
                        ? snapshot.requireData.docs
                        : newListOfCoarse;

                    print('userlengh = ${users.length}');

                    return SingleChildScrollView(
                      child: Column(
                        children: [


                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Search",
                                prefixIcon: Icon(Icons.search),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please fill this value';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  search = value.removeAllWhitespace;
                                  newListOfCoarse = users
                                      .where((element) => element['name']
                                      .toLowerCase()
                                      .contains(search.removeAllWhitespace
                                      .toLowerCase()))
                                      .toList();
                                });
                              },
                            ),
                          ),

                        loading ? kprogressbar :  ListView.builder(

                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:   search.isEmpty
                                ? users.length
                                : newListOfCoarse.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(users[index]['name']),
                                leading: const Icon(Icons.person),
                                onTap: () async {

                                if ( dateSelected == null) {
                                  Get.snackbar('Please Select Date', '');
                                }else{

                                  print('username = ${users[index]['name']} ${users[index]['uid']}');

                                  setState(() {
                                    loading = true;
                                  });
                                  QuerySnapshot<Map<String, dynamic>> trips =   await FirebaseFirestore.instance.collection('Employee').doc(users[index]['uid'])
                                      .collection('Trips').where('date',isEqualTo: dateSelected).get();


                                  if(trips.docs.isEmpty){

                                    Get.snackbar('No Trips Found', '');
                                    setState(() {
                                      loading = false;
                                    });

                                  }else{

                                    List allLocations =    trips.docs[0].get('location');



                                    double distanceInMeters = 0;

                                    List<LatLng> filteredList = allLocations.map((e) {

                                      return LatLng(
                                          e['lat'], e['lon']);
                                    }).toList();

                                    allLocations.forEachIndexed((index, element) {

                                     if(allLocations.length == index + 1) {
                                       print('dome');
                                     }else{


                                       distanceInMeters +=
                                           Geolocator.distanceBetween(
                                               element['lat'], element['lon'],
                                               allLocations[index + 1]['lat'],
                                               allLocations[index + 1]['lon']);
                                       // print('$index foreach $distanceInMeters');

                                     }



                                    });


                                    print('foreachout $distanceInMeters');
                                    print('location Length = ${filteredList.length}');
                                    setState(() {
                                      loading = false;
                                    });


                                    distanceInMeters = distanceInMeters / 1000;




                                    Get.to(TripsMapScreen(allLocations: filteredList,time: 'time',totaldistance1: '${distanceInMeters.toPrecision(2)} KM',
                                      polypoints1: [],showdistance: '2',timelist: allLocations,
                                    ));


                                  }

                                }



                                },
                              );
                            },

                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
