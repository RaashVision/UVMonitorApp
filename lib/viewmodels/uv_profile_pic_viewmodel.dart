
import 'package:UVLightApp/enums/viewstate.dart';
import 'package:UVLightApp/locator.dart';
import 'package:UVLightApp/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'core/base_viewmodel.dart';

class UVProfilePicViewModel extends BaseViewModel{


  AuthenticationService authenticationService = locator<AuthenticationService>();
  FirebaseUser user ; 

//On start
  void getDefaultData() async{

    var currentuser = await authenticationService.currentUserLoggedInInfo();

    if(currentuser != null){

      user = currentuser;

    }

  setState(viewState :ViewState.Idle);


  }

}