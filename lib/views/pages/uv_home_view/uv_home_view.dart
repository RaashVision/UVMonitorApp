import 'package:UVLightApp/viewmodels/uv_home_viewmodel.dart';
import 'package:UVLightApp/views/core/base_view.dart';
import 'package:UVLightApp/views/pages/uv_home_view/mobile/uv_home_m_potrait_view.dart';
import 'package:UVLightApp/views/responsive/orientation_layout.dart';
import 'package:UVLightApp/views/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';

class UVHomeView extends StatefulWidget {
  @override
  _UVHomeViewState createState() => _UVHomeViewState();
}

class _UVHomeViewState extends State<UVHomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<UVHomeViewModel>(
        onModelReady: (model)=> model.getDefaultData(),
         builder: (context, model, child) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => UVHomeViewMobilePortrait(),
            landscape: (context) => UVHomeViewMobilePortrait(),
          ),
          tablet: UVHomeViewMobilePortrait(),
        ),
      
    );
  }
}