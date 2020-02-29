import 'package:UVLightApp/core/base_model_widget.dart';
import 'package:UVLightApp/core/dynamic_ui_for_state.dart';
import 'package:UVLightApp/settings.dart';
import 'package:UVLightApp/viewmodels/uv_home_viewmodel.dart';
import 'package:UVLightApp/views/widgets/uv_circular_widget.dart';
import 'package:UVLightApp/views/widgets/uv_google_map_widget.dart';
import 'package:UVLightApp/views/widgets/uv_profile_pic_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UVHomeViewMobilePortrait extends BaseModelWidget<UVHomeViewModel>  {
 

  @override
  Widget build(BuildContext context, UVHomeViewModel model) {

     return  WillPopScope(
        onWillPop: () async => false,
        child: DynamicUIBasedOnState(state:model.state, onMAinUI: fullView(model :model)));
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
                      child: UVCircularWidget()
                              ),
              flex: 5,),

              Expanded(

                child: GoogleMapWidget(permisongiven: model.location_permision,)

              ,flex: 5,)




          ],
        )),
      );


  }


}