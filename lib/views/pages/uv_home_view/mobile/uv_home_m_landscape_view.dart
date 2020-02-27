import 'package:CrResposiveApp/core/base_model_widget.dart';
import 'package:CrResposiveApp/core/dynamic_ui_for_state.dart';
import 'package:CrResposiveApp/viewmodels/uv_home_viewmodel.dart';
import 'package:CrResposiveApp/views/pages/cr_home_view/cr_home_shimmer.dart';
import 'package:flutter/material.dart';

class UVHomeViewMobileLandScape extends BaseModelWidget<UVHomeViewModel>  {
 
  List<bool> isSelected = [false, false, false];

  BuildContext maincontext;


  @override
  Widget build(BuildContext context, UVHomeViewModel model) {

    maincontext = context;
     return DynamicUIBasedOnState(state:model.state, onMAinUI: fullView(model :model),onLoadingUI: CRHomeLoadingShimmer(numOfColuminGrid: 2,),onInitUI: CRHomeLoadingShimmer(numOfColuminGrid: 2,),);
  }


  Widget fullView({UVHomeViewModel model}){


  }


}