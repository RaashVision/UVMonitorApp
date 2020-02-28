
import 'package:UVLightApp/core/base_model_widget.dart';
import 'package:UVLightApp/core/dynamic_ui_for_state.dart';
import 'package:UVLightApp/viewmodels/cr_detail_viewmodel.dart';
import 'package:UVLightApp/viewmodels/cr_home_viewmodel.dart';
import 'package:UVLightApp/views/pages/cr_home_view/cr_home_shimmer.dart';
import 'package:flutter/material.dart';

class CrDetailViewMobileLandscape extends BaseModelWidget<CRDetailViewModel>  {
 
  List<bool> isSelected = [false, false, false];


  @override
  Widget build(BuildContext context, CRDetailViewModel model) {
     return DynamicUIBasedOnState(state:model.state, onMAinUI: fullView(model :model),onLoadingUI: CRHomeLoadingShimmer(numOfColuminGrid: 2,),onInitUI: CRHomeLoadingShimmer(numOfColuminGrid: 2,),);
  }


  Widget fullView({CRDetailViewModel model}){

    return Container(    
          padding: EdgeInsets.all(10),   
            child: Hero(
              tag: "ColorDetail",
                          child: Center(child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(child: Image.network(
                          model.data.url,fit:BoxFit.fill ,
                        ),
                        flex: 5,),
                    Flexible(child: Text(model.data.title, style: TextStyle(fontSize:15),overflow: TextOverflow.ellipsis,),flex: 5,),
              ]
          ),
          ),
            )
   
        );


  }
}
