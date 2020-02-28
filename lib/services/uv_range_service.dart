import 'package:UVLightApp/models/uv_range_model.dart';
import 'package:flutter/material.dart';

class UVRangeService {


  UVRangeModel uvPropertiesBasedOnUVRange(double uv_range){

    var total = 18.0;

    if(uv_range >=0 && uv_range<3){

      return new UVRangeModel(levelName:"Low",shortlevelName: "Low" , uv_color:  Color.fromRGBO(85,139,47,1),uv_value: uv_range, percent: uv_range/total);

    }
    else if(uv_range >=3 && uv_range<6){

      return new UVRangeModel(levelName:"Moderate",shortlevelName: "Mod" , uv_color:  Color.fromRGBO(249,168,37,1),uv_value: uv_range,percent: uv_range/total);

    }
    else if(uv_range >=6 && uv_range<8){

        return new UVRangeModel(levelName:"High",shortlevelName: "High" , uv_color:  Color.fromRGBO(239,108,0,1),uv_value: uv_range,percent: uv_range/total);
    }
    else if(uv_range >=8 && uv_range<11){
      return new UVRangeModel(levelName:"Very High",shortlevelName: "VHigh" , uv_color:  Color.fromRGBO(183,28,28,1),uv_value: uv_range,percent: uv_range/total);
    }
    else{
       return new UVRangeModel(levelName:"Extreme",shortlevelName: "Extr" , uv_color:  Color.fromRGBO(106,27,	154,1),uv_value: uv_range,percent: uv_range/total);
    }
    
  }




}