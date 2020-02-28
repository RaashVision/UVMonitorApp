import 'package:UVLightApp/core/base_model_widget.dart';
import 'package:UVLightApp/core/dynamic_ui_for_state.dart';
import 'package:UVLightApp/viewmodels/uv_home_viewmodel.dart';
import 'package:UVLightApp/viewmodels/uv_login_viewmodel.dart';
import 'package:UVLightApp/views/pages/cr_home_view/cr_home_shimmer.dart';
import 'package:UVLightApp/views/widgets/background.dart';
import 'package:UVLightApp/views/widgets/uv_circular_widget.dart';
import 'package:UVLightApp/views/widgets/uv_google_map_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UVLoginViewMobilePortrait extends BaseModelWidget<UVLoginViewModel>  {
 
  List<bool> isSelected = [false, false, false];

  BuildContext maincontext;


  @override
  Widget build(BuildContext context, UVLoginViewModel model) {

    maincontext = context;
     return DynamicUIBasedOnState(state:model.state, onMAinUI: fullView(model :model));
  }


  Widget fullView({UVLoginViewModel model}){

      return Scaffold(
        //appBar: AppBar(title: Text("UVLight App"),centerTitle: true,),
        body: //SafeArea(child: 
        Stack(
         // crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            Background(),
            Align(
              alignment: Alignment.center,
              child: logoAndBtnLis())
            
          ],
        )
        //),
      );


  }


  Widget  logoAndBtn(){

    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          FlutterLogo(),
          Text('Thiyraash')

        ],
      );
    
  }

    Widget  logoAndBtnLis(){

    return ListView(children: <Widget>[

       FlutterLogo(size: 50,),
          Text('Thiyraash')


    ]);
    
  }


}