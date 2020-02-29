import 'package:UVLightApp/core/base_model_widget.dart';
import 'package:UVLightApp/core/dynamic_ui_for_state.dart';
import 'package:UVLightApp/viewmodels/uv_home_viewmodel.dart';
import 'package:UVLightApp/viewmodels/uv_login_viewmodel.dart';
import 'package:UVLightApp/views/widgets/background.dart';
import 'package:UVLightApp/views/widgets/uv_circular_widget.dart';
import 'package:UVLightApp/views/widgets/uv_google_map_widget.dart';
import 'package:UVLightApp/views/widgets/uv_signin_btn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../settings.dart';

class UVLoginViewMobilePortrait extends BaseModelWidget<UVLoginViewModel>  {
 
  BuildContext maincontext;

  @override
  Widget build(BuildContext context, UVLoginViewModel model) {

    maincontext = context;
     return WillPopScope(
        onWillPop: () async => false,
       child: DynamicUIBasedOnState(state:model.state, onMAinUI: fullView(model :model)));
  }

//Overall UI
  Widget fullView({UVLoginViewModel model}){

      return Scaffold(
        body: //SafeArea(child: 
        Stack(
          children: <Widget>[

            Background(),

            Positioned(
              top: MediaQuery.of(maincontext).size.height/5,
              //bottom: 30,
              left: 1,
              right: 30,
              child: logoAndBtn(model))
          ],
        )
        //),
      );


  }

//This widget to show the login button
  Widget  logoAndBtn(UVLoginViewModel model){

    return Container(
      //color: Colors.red,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            //FlutterLogo(size: 180,),
            Image.asset("uvlogo.png",height:180,),
            SizedBox(height: 20),
            Text(Settings.appBarTiitle ,style: TextStyle(fontSize: 35, color: Colors.orange,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            SizedBox(height: 30),
            SignBtnWidget( topRight: 30.0, bottomRight:30.0,imgfilenname: "googleicon.png",btnname: 'Sign in with Google',isGoogle: model.signinBasedOnSelectedAccount ,isGooglebtn: true,),
            SignBtnWidget( topRight: 30.0, bottomRight:30.0,imgfilenname: "fblogo.png",btnname: 'Sign in with Facebook',isGoogle: model.signinBasedOnSelectedAccount ,isGooglebtn: false),
          ],
        ),
    );
    
  }

    


}