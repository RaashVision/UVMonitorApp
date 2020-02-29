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

  String errormessage; 
  IRepository iRepository = locator<IRepository>();
  NavigationService navigationService = locator<NavigationService>();
  StreamManager iStream = locator<StreamManager>();
  OpenUVApiResult openuvresult = new OpenUVApiResult();
  UVRangeService uvRangeService = locator<UVRangeService>();
  UVRangeModel rangeModel = new UVRangeModel(uv_value: 0,levelName: "Low",percent: 0.0,);
  ThemeManager themeManager  = locator<ThemeManager>();
  DialogService dialogService = locator<DialogService>();
  AuthenticationService authenticationService = locator<AuthenticationService>();
   PermissionService permissionService  =locator<PermissionService>();
   bool location_permision = false;
  //Constructor
  

  void getDefaultData() async{



     location_permision = await permissionService.permissionForLocation();
     

      setState(viewState:ViewState.Idle);


  }


  void getUVvaluefortheCoordinate(Coordinate _tapcorrdinate) async{

    try{
    //  setState(viewState:ViewState.Busy);

      var generalResult = await iRepository.getOpenUVData(_tapcorrdinate);

      //Success request
      if(generalResult.stateStatus == ViewState.Idle){

        openuvresult = generalResult.resultdata as OpenUVApiResult;

        rangeModel = uvRangeService.uvPropertiesBasedOnUVRange(openuvresult?.result?.uv??0.0);

        themeManager.changeTheme(new ThemeData(primaryColor: rangeModel.uv_color));


        int dsw = 0;


      }
      //If not success
      else{

        setState(viewState:ViewState.Error,event: generalResult.errormessage);

      }


     setState(viewState:ViewState.Idle);
    }
    catch(E){

      int ds = 0;

       // setState(viewState:ViewState.Error,event: E.toString());

    }



  }



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
