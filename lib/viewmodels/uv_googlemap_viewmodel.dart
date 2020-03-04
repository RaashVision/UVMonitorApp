
import 'package:UVLightApp/enums/viewstate.dart';
import 'package:UVLightApp/locator.dart';
import 'package:UVLightApp/managers/stream_manager.dart';
import 'package:UVLightApp/models/coordinate.dart';
import 'package:UVLightApp/services/location_service.dart';

import 'core/base_viewmodel.dart';

class UVGoogleMapViewModel extends BaseViewModel{

  LocationService locationService = locator<LocationService>();
  StreamManager iStream = locator<StreamManager>();


  List<Coordinate> getListOfPredefined(){

    return 
    [

      new Coordinate(name : "London",latitude: 51.5074,longtitude: 0.1278),
      new Coordinate(name : "INDIA",latitude: 51.5074,longtitude: 0.1278),
       new Coordinate(name : "MALAYSIA",latitude: 51.5074,longtitude: 0.1278),
      new Coordinate(name : "USA",latitude: 51.5074,longtitude: 0.1278),
       new Coordinate(name : "SINGAPORE",latitude: 51.5074,longtitude: 0.1278),


    ];



    



  }


//Publish to subcriber about current coordianate
  Future publishCoordinate(Coordinate _coor){

    _coor.dateTime = DateTime.now().toUtc();

    iStream.getCoordinateFromGoogleMap().add(_coor);

    setState(viewState:ViewState.Idle);
  }

}
