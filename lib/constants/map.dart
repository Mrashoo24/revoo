import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class MapScreen extends StatefulWidget {

  final LatLng? loc;
  final String? userRef;

  const MapScreen({Key? key, this.loc, this.userRef}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  late GoogleMapController _controller ;

  late CameraPosition _kGooglePlex;

  Set<Marker> _markers={};

  late LatLng latlng ;
  var addressArea = "";
  var addressFull = "";

  @override
  void initState() {
    super.initState();

    setState(() {

      latlng = LatLng(widget.loc!.latitude, widget.loc!.longitude);

      _kGooglePlex = CameraPosition(
        target: latlng,
        zoom: 20
        
      );

    });
    // getAddress(latlng).then((value) {
    //
    //   setState(() {
    //     addressArea = value.first.featureName;
    //     addressFull = value.first.addressLine;
    //   });
    //
    // });

  }

//   Future<Placemark>getAddress(LatLng locationdata) async {
//     // // From a query
//     // final query = "1600 Amphiteatre Parkway, Mountain View";
//     // var addresses = await Geocoder.local.findAddressesFromQuery(query);
//     // var first = addresses.first;
//     // print("${first.featureName} : ${first.coordinates}");
//
// // From coordinates
//     final coordinates =  await placemarkFromCoordinates(locationdata.latitude, locationdata.longitude);
//     print('coordinates = ${coordinates.first}');
//     var addresses = await coordinates[0];
//     // var first = addresses.first;
//     // print("${first.featureName} : ${first.addressLine}");
//     return addresses;
//
//   }

  @override
  Widget build(BuildContext context) {
    print("newLatLong $latlng");
    print("addressArea $addressFull");
    // getAddress(latlng).then((value) {
    //   addressArea = value.first.featureName;
    //   addressFull = value.first.addressLine;
    // });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:Text("Set Location")),
        body: Stack(
          children: [GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
              _controller.animateCamera(

                  CameraUpdate.newCameraPosition(_kGooglePlex));
            },
            markers: {
              Marker(
                  markerId: MarkerId("a"),
                  draggable: true,
                  position: latlng,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  onDragEnd: (currentlatlng) async {
                    // final coordinates =  coder.Coordinates(currentlatlng.latitude, currentlatlng.longitude);
                    // var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
                   // Placemark address = await getAddress(currentlatlng);
                    setState(()  {

                      latlng = currentlatlng;
                      addressArea = '';
                      addressFull = '';

                    });

                  }),
            },

          ),
          Positioned(
            bottom: 20,
            right: 15,
            left: 15,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.mapMarkerAlt,color: Colors.green,),

                        Text(
                          addressArea,
                          style: GoogleFonts.arvo(
                              fontWeight: FontWeight.bold,fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                      ],
                    ),
                    Container(
                      child: Text(
                        addressFull,
                        style: GoogleFonts.arvo(fontSize: 10),
                        overflow: TextOverflow.ellipsis,

                      ),
                    ),
                    ElevatedButton(onPressed: () async {


                      // Placemark address = await getAddress(LatLng(latlng.latitude, latlng.longitude));
                          Get.back(
                          result: [{
                            'lat': latlng.latitude,
                            'lon':latlng.longitude,
                            'address': ''
                          }]
                          );


                    }, child: Text("Set Location"))
                  ],
                ),
              ),
            ),
          )

          ]
        ),
      ),
    );
  }



  }


