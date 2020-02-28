import 'package:UVLightApp/viewmodels/cr_home_viewmodel.dart';
import 'package:UVLightApp/views/core/base_view.dart';
import 'package:UVLightApp/views/pages/cr_home_view/cr_home_mobile_portrait.dart';
import 'package:UVLightApp/views/responsive/orientation_layout.dart';
import 'package:UVLightApp/views/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';

import 'cr_home_mobile_landscape.dart';


class CrHomeView extends StatefulWidget {
  @override
  _CrHomeViewState createState() => _CrHomeViewState();
}

class _CrHomeViewState extends State<CrHomeView> {
 @override
  Widget build(BuildContext context) {
    return BaseView<CRHomeViewModel>(
        onModelReady: (model)=> model.getDefaultData(),
         builder: (context, model, child) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => CrHomeViewMobilePortrait(),
            landscape: (context) => CrHomeViewMobileLandscape(),
          ),
          tablet: CrHomeViewMobileLandscape(),
        ),
      
    );
  }
}


