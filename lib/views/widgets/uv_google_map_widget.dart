import 'dart:async';

import 'package:UVLightApp/models/coordinate.dart';
import 'package:UVLightApp/viewmodels/uv_googlemap_viewmodel.dart';
import 'package:UVLightApp/views/core/base_view.dart';
import 'package:UVLightApp/views/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {

  
  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {

  // 1
Completer<GoogleMapController> _controller = Completer();
// 2
static final CameraPosition _myLocation =CameraPosition(target: LatLng(0, 0),);
Coordinate newloc = new Coordinate();
final Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
          return  BaseView<UVGoogleMapViewModel>(
        onModelReady: (model)=> model.getDefaultData(),
         builder:(context, model, child) =>  Scaffold(
        // 1
          body: Stack(
            children: <Widget>[
              GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled : true,
                //cameraTargetBounds: 
                onLongPress: (val){

                   // setState(() {
                    _markers.clear();
                    final marker = Marker(
                        markerId: MarkerId("curr_loc"),
                        position: LatLng(val.latitude, val.longitude),
                        infoWindow: InfoWindow(title: 'Your Location'),
                    );
                    _markers["Tap Location"] = marker;

                    model.publishCoordinate(new Coordinate(latitude :val.latitude,longtitude: val.longitude));
                //  });

                },
                // 2
                initialCameraPosition: _myLocation,
                // 3
                mapType: MapType.normal,
                markers: _markers.values.toSet(),
                // 4
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onCameraMove :(val){
                 
                  newloc.latitude = val.target.latitude;
                  newloc.longtitude = val.target.longitude;
                },
                onCameraIdle: (){

                    setState(() {
                    _markers.clear();
                    final marker = Marker(
                        markerId: MarkerId("curr_loc"),
                        position: LatLng(newloc.latitude, newloc.longtitude),
                        infoWindow: InfoWindow(title: 'Your Location'),
                    );
                    _markers["Tap Location"] = marker;

                    
                 });
                 model.publishCoordinate(newloc);
                },
               
                
                
              ),
           
           
           
          //  Align(
          //    alignment: Alignment.bottomLeft,
          //               child: Padding(
          //                 padding: const EdgeInsets.all(20.0),
          //                 child: FloatingActionButton(
          //                   backgroundColor: PrimaryColor.withOpacity(0.7),
          //                   child: Icon(Icons.my_location),
          //                   onPressed: () async{

          //     var curr =  await model.locationService.getLocation();

          //      setState(() {
          //             _markers.clear();
          //             final marker = Marker(
          //                   markerId: MarkerId("curr_loc"),
          //                   position: LatLng(curr.latitude, curr.longtitude),
          //                   infoWindow: InfoWindow(title: 'Your Location'),
          //             );
          //             _markers["Current Location"] = marker;


                      
          //           });

          //    }),
          //               ),
          //  )
           
            ],
          ),
        ));
  }
}