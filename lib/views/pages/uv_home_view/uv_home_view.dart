import 'package:CrResposiveApp/viewmodels/uv_home_viewmodel.dart';
import 'package:CrResposiveApp/views/core/base_view.dart';
import 'package:CrResposiveApp/views/pages/uv_home_view/mobile/uv_home_m_potrait_view.dart';
import 'package:CrResposiveApp/views/responsive/orientation_layout.dart';
import 'package:CrResposiveApp/views/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';

import 'mobile/uv_home_m_landscape_view.dart';

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
            landscape: (context) => UVHomeViewMobileLandScape(),
          ),
          tablet: UVHomeViewMobileLandScape(),
        ),
      
    );
  }
}