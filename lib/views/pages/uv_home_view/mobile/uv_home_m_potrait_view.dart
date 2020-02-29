import 'package:UVLightApp/core/base_model_widget.dart';
import 'package:UVLightApp/core/dynamic_ui_for_state.dart';
import 'package:UVLightApp/settings.dart';
import 'package:UVLightApp/viewmodels/uv_home_viewmodel.dart';
import 'package:UVLightApp/views/widgets/uv_circular_widget.dart';
import 'package:UVLightApp/views/widgets/uv_google_map_widget.dart';
import 'package:UVLightApp/views/widgets/uv_profile_pic_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UVHomeViewMobilePortrait extends BaseModelWidget<UVHomeViewModel>  {
 
  List<bool> isSelected = [false, false, false];

  BuildContext maincontext;


  @override
  Widget build(BuildContext context, UVHomeViewModel model) {

    maincontext = context;
     return DynamicUIBasedOnState(state:model.state, onMAinUI: fullView(model :model));
  }


  Widget fullView({UVHomeViewModel model}){

      return Scaffold(
        appBar: AppBar(title: Text(Settings.appBarTiitle),centerTitle: true,automaticallyImplyLeading: false,leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: UVProfilePicWidget(),
        ), actions: <Widget>[

            IconButton(icon: Icon(Icons.exit_to_app, color: Colors.white,),onPressed: (){

              model.logoutfromApp();


              
            },)

        ],),
        body: SafeArea(child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

              Expanded(
                    child: Center(
                      child: UVCircularWidget(levelname: model.rangeModel.levelName,valueofUv: model.rangeModel.uv_value,percent: model.rangeModel.percent,)
                              ),
              flex: 5,),

              Expanded(

                child: GoogleMapWidget()

              ,flex: 5,)




          ],
        )),
      );


  }


}