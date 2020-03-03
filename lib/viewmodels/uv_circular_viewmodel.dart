import 'package:UVLightApp/enums/viewstate.dart';
import 'package:UVLightApp/interfaces/i_repository.dart';
import 'package:UVLightApp/managers/stream_manager.dart';
import 'package:UVLightApp/managers/theme_manager.dart';
import 'package:UVLightApp/models/coordinate.dart';
import 'package:UVLightApp/models/uv_range_model.dart';
import 'package:UVLightApp/models/uv_result_model.dart';
import 'package:UVLightApp/services/dialog_service.dart';
import 'package:UVLightApp/services/navigation_service.dart';
import 'package:UVLightApp/services/uv_range_service.dart';
import 'package:UVLightApp/viewmodels/core/base_viewmodel.dart';
import 'package:UVLightApp/views/shared/app_colors.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class UVCircularViewModel extends BaseViewModel{

  IRepository iRepository = locator<IRepository>();
  StreamManager iStream = locator<StreamManager>();
  OpenUVApiResult openuvresult = new OpenUVApiResult();
  UVRangeService uvRangeService = locator<UVRangeService>();
  UVRangeModel rangeModel = new UVRangeModel(uv_value: 0,levelName: "Low",percent: 0.0,uv_color: PrimaryColor);
  ThemeManager themeManager  = locator<ThemeManager>();
  Coordinate current_cor = new Coordinate(latitude: 0.0,longtitude: 0.0, dateTime: DateTime.now());
  DialogService dialogService = locator<DialogService>();

  //Constructor
  UVCircularViewModel(){
      //Received stream from GoogleMap widget publisher
     iStream.getCoordinateFromGoogleMap().stream.listen((value) async{
          await getUVvaluefortheCoordinate(value);
     });
  }

//This to get UV value from api
  Future getUVvaluefortheCoordinate(Coordinate _tapcorrdinate) async{

    try{
    //  setState(viewState:ViewState.Busy);

   // lastClickTime = _tapcorrdinate.dateTime.toString();

    current_cor = _tapcorrdinate;

      var generalResult = await iRepository.getOpenUVData(_tapcorrdinate);

      //Success request
      if(generalResult.stateStatus == ViewState.Idle){

        openuvresult = generalResult.resultdata as OpenUVApiResult;

        rangeModel = uvRangeService.uvPropertiesBasedOnUVRange(openuvresult?.result?.uv??0.0);

        themeManager.changeTheme(new ThemeData(primaryColor: rangeModel.uv_color,
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor:  rangeModel.uv_color.withOpacity(0.7)),buttonColor:rangeModel.uv_color  ));


        int dsw = 0;

         setState(viewState:ViewState.Idle);


      }
      //If not success
      else{


         var dialogResult = await dialogService.showDialogMessage(
            title: 'Error',
            description: generalResult.errormessage,
          );
          if (dialogResult.confirmed) {
            print('Ok');
          } else {
            print('User cancelled the dialog');
          }

      }

    
    }
    catch(E){

    }



  }

}