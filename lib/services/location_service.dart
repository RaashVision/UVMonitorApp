import 'package:UVLightApp/models/coordinate.dart';
import 'package:location/location.dart';
class LocationService{


 Coordinate _currentLocation;

  var location = Location();

  Future<Coordinate> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = Coordinate(
        latitude: userLocation.latitude,
        longtitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }
    catch(f){

      int ds = 0;

    }

    return _currentLocation;
  }





}