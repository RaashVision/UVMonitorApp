import 'dart:async';

import 'package:UVLightApp/models/coordinate.dart';
import 'package:UVLightApp/viewmodels/uv_googlemap_viewmodel.dart';
import 'package:UVLightApp/views/core/base_view.dart';
import 'package:UVLightApp/views/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {

  bool permisongiven;
  GoogleMapWidget({this.permisongiven});
  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {

bool isClicked = true;
Completer<GoogleMapController> _controller = Completer();

static final CameraPosition _myLocation =CameraPosition(target: LatLng(0, 0),);
Coordinate newloc = new Coordinate();
final Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
          return  BaseView<UVGoogleMapViewModel>(
     //   onModelReady: (model)=> model.getDefaultData(),
         builder:(context, model, child) =>  Scaffold(
          body: Stack(
            children: <Widget>[
              GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled : true,
                onLongPress: (val){


                   createMarker(val,model,'Your Location');

                },

                initialCameraPosition: _myLocation,
                mapType: MapType.normal,
                markers: _markers.values.toSet(),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onCameraMove :(val){
                 
                  newloc.latitude = val.target.latitude;
                  newloc.longtitude = val.target.longitude;
                },
                onCameraIdle: (){
                  createMarker(LatLng(newloc.latitude, newloc.longtitude),model,'Your Location');

                },         
              ),
           
           //Show custom mylocation widget if the default mylocation widget does not show
           widget.permisongiven ==false?
           Align(
             alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: FloatingActionButton(
                            backgroundColor: PrimaryColor.withOpacity(0.7),
                            child: Icon(Icons.my_location),
                            onPressed: () async{

              var curr =  await model.locationService.getLocation();

                createMarker(LatLng(curr.latitude, curr.longtitude),model,'Your Location');
                
             }),
                        ),
           ) :Container()
           
            ],
          ),
        ));
  }

//This to create market and publish
  void createMarker(LatLng latLng,UVGoogleMapViewModel model,String markerName){

//This to prevent muiltiple click problem
    if(isClicked){

      isClicked  =false;
     _markers.clear();
                    final marker = Marker(
                        markerId: MarkerId("curr_loc"),
                        position: latLng,
                        infoWindow: InfoWindow(title: markerName),
                    );
                    _markers["Tap Location"] = marker;

     model.publishCoordinate(new Coordinate(latitude: latLng.latitude,longtitude: latLng.longitude));
    isClicked = true;




    }

  

  } 
}