import 'package:UVLightApp/enums/viewstate.dart';
import 'package:UVLightApp/interfaces/i_repository.dart';
import 'package:UVLightApp/locator.dart';
import 'package:UVLightApp/managers/stream_manager.dart';
import 'package:UVLightApp/managers/theme_manager.dart';
import 'package:UVLightApp/models/coordinate.dart';
import 'package:UVLightApp/models/uv_range_model.dart';
import 'package:UVLightApp/models/uv_result_model.dart';
import 'package:UVLightApp/services/authentication_service.dart';
import 'package:UVLightApp/services/dialog_service.dart';
import 'package:UVLightApp/services/navigation_service.dart';
import 'package:UVLightApp/services/permission_service.dart';
import 'package:UVLightApp/services/uv_range_service.dart';
import 'package:UVLightApp/viewmodels/core/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class UVHomeViewModel extends BaseViewModel{
  
  NavigationService navigationService = locator<NavigationService>();
  DialogService dialogService = locator<DialogService>();
  AuthenticationService authenticationService = locator<AuthenticationService>();
  PermissionService permissionService  =locator<PermissionService>();
  bool location_permision = false;
  //Constructor
  
//This function calle at starting of page
  void getDefaultData() async{

      //Ask for permissiom
     location_permision = await permissionService.permissionForLocation();
    setState(viewState:ViewState.Idle);

  }

//This for logout
  void logoutfromApp() async{

    var dialogResult = await dialogService.showDialog(
            title: 'Logout',
            description: "Are you sure you want to logout?",
            buttonNegativeTitle: "No",
            buttonTitle: "Yes"
          );
          if (dialogResult.confirmed) {
           authenticationService.signOutWithGoogle();
           navigationService.goBack();
          } else {
            print('User cancelled the dialog');
          }
  }





}
