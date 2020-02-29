import 'package:UVLightApp/viewmodels/uv_login_viewmodel.dart';
import 'package:UVLightApp/viewmodels/uv_home_viewmodel.dart';
import 'package:UVLightApp/views/core/base_view.dart';
import 'package:UVLightApp/views/responsive/orientation_layout.dart';
import 'package:UVLightApp/views/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';

import 'mobile/uv_login_m_potrait_view.dart';

class UVLoginView extends StatefulWidget {
  @override
  _UVLoginViewState createState() => _UVLoginViewState();
}

class _UVLoginViewState extends State<UVLoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<UVLoginViewModel>(
      //  onModelReady: (model)=> model.getDefaultData(),
         builder: (context, model, child) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => UVLoginViewMobilePortrait(),
         //   landscape: (context) => UVHomeViewMobileLandScape(),
          ),
        //  tablet: UVHomeViewMobileLandScape(),
        ),
      
    );
  }
}