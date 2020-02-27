import 'package:CrResposiveApp/locator.dart';
import 'package:CrResposiveApp/services/location_service.dart';

import 'core/base_viewmodel.dart';

class UVGoogleMapViewModel extends BaseViewModel{

  String errormessage; 

  LocationService locationService = locator<LocationService>();

  void getDefaultData() async{
  }

  void getCurrentLocation(){
    
  }

}
