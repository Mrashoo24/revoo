import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:revoo/constants/constants.dart';

/// navigator code
// Scaffold(body: InkWell(onTap:() async {
//
// var listoflocations = [
//   LatLng(19.159960815503407, 73.03034971938565),
//   LatLng(19.18737221230442, 73.0214419582776),
//   LatLng(19.213420174923357, 73.01278121665315)
//
// ];
//
// var totalDistance = 0.0;
// var polypoints = [];
//
// for (int i = 0; i < listoflocations.length; i++) {
// if (i < listoflocations.length - 1) { // skip the last index
//
//
// final directions = await DirectionsRepository()
//     .getDirections(origin: listoflocations[i], destination: listoflocations[i+1]);
//
// var gotDistance = double.parse( directions.totalDistance.substring(0,3));
//
// print('direction = ${gotDistance}');
// totalDistance+=gotDistance;
//
// polypoints.addAll(directions.polylinePoints);
// }
// }
// print('gottoal = $totalDistance');
//
// Get.to(MapScreen(allLocations:listoflocations,totaldistance: totalDistance.toString(),polypoints: polypoints,));
//
//
//
//
// },child: Center(child: Container(child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text('First Page'),
// )))))

class TripsMapScreen extends StatefulWidget {
  final List<LatLng>? allLocations;
  final String? totaldistance1,showdistance;
  final List? polypoints1;
  final List? timelist;
  final String? time;

  const TripsMapScreen(
      {Key? key, this.allLocations, this.totaldistance1, this.polypoints1, this.showdistance, required this.time, this.timelist})
      : super(key: key);

  @override
  _TripsMapScreenState createState() => _TripsMapScreenState();
  
}

class _TripsMapScreenState extends State<TripsMapScreen> {
  var _initialCameraPosition;
 // String totaldistance1;
 // List polypoints1;

  late GoogleMapController _googleMapController;

  late Set<Marker> markers;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _initialCameraPosition = CameraPosition(
      target: LatLng(widget.allLocations!.last.latitude,
          widget.allLocations!.last.longitude),
      zoom: 11.5,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Google Maps'),
        backgroundColor: Kdblue,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: widget.allLocations!.asMap()
                .map((index,e)
            {


           DateTime time =   (widget.timelist![index]['time'] as Timestamp).toDate();

                    return  MapEntry(index,Marker(
                        markerId: MarkerId(time.toLocal().toString()),
                        infoWindow: InfoWindow(title: time.toLocal().toString()),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueBlue),
                        position: e,
                      ));
                    }).values
                .toSet(),
            // polylines: widget.polypoints1 == null ? {} :{
            //   Polyline(
            //     polylineId: const PolylineId('overview_polyline'),
            //     color: Colors.red,
            //     width: 5,
            //     points: widget.polypoints1!
            //         .map((e) => LatLng(e.latitude, e.longitude))
            //         .toList(),
            //   ),
            // },
          ),
          widget.totaldistance1 == null ? SizedBox() : Positioned(
            top: 20.0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  )
                ],
              ),
              child:  Text(
                '${widget.totaldistance1}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.all(40.0),
          //     child: ElevatedButton(
          //         onPressed: () async {
          //           var totalDistance = 0.0;
          //           var polypoints = [];
          //
          //          await widget.allLocations.asMap().forEach((i, loc) async {
          //            if (i < widget.allLocations.length - 1) {
          //              // skip the last index
          //
          //              final directions = await DirectionsRepository()
          //                  .getDirections(
          //                  origin: widget.allLocations[i],
          //                  destination: widget.allLocations[i + 1]);
          //
          //              var gotDistance =
          //              double.parse(directions.totalDistance.replaceAll( RegExp(r'[a-zA-Z.]'), ''));
          //
          //              print('direction = ${gotDistance}');
          //              totalDistance += gotDistance;
          //
          //              polypoints.addAll(directions.polylinePoints);
          //            }
          //           });
          //
          //           // for (int i = 0; i < widget.allLocations.length; i++) {
          //           //   if (i < widget.allLocations.length - 1) {
          //           //     // skip the last index
          //           //
          //           //     final directions = await DirectionsRepository()
          //           //         .getDirections(
          //           //             origin: widget.allLocations[i],
          //           //             destination: widget.allLocations[i + 1]);
          //           //
          //           //     var gotDistance =
          //           //         double.parse(directions.totalDistance.replaceAll('m', '').replaceAll('km', ''));
          //           //
          //           //     print('direction = ${gotDistance}');
          //           //     totalDistance += gotDistance;
          //           //
          //           //     polypoints.addAll(directions.polylinePoints);
          //           //   }
          //           // }
          //
          //           setState(() {
          //             polypoints1 = polypoints;
          //             totaldistance1 = totalDistance.toString();
          //           });
          //
          //           print('gottoal = $totalDistance');
          //         },
          //         child: Text('Calculate TRAVEL')),
          //   ),
          // )



        ],
      ),
    );
  }
}
