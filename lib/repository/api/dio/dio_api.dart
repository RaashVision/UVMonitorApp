import 'dart:convert';

import 'package:UVLightApp/api_urls.dart';
import 'package:UVLightApp/enums/viewstate.dart';
import 'package:UVLightApp/interfaces/i_api.dart';
import 'package:UVLightApp/locator.dart';
import 'package:UVLightApp/models/coordinate.dart';
import 'package:UVLightApp/models/result.dart';
import 'package:UVLightApp/models/typicode_photo.dart';
import 'package:UVLightApp/models/uv_result_model.dart';
import 'package:UVLightApp/utils/network_error_utils.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as kokoi;
import 'package:intl/intl.dart';
class DioAPI implements IApi{


  Response response;
  Dio dio ;
  NetworkErrorHandlerUtils _errorHandlerUtils = locator<NetworkErrorHandlerUtils>();
  //Constructor
  DioAPI(Dio _dio){

    dio = _dio??new Dio();
    //dio.options.connectTimeout =60*1000; 
    dio.options.receiveTimeout =60*1000; 
    dio.options.sendTimeout = 60*1000;
    dio.options.headers = {"x-access-token":"cbd950fea8e59ca589d3971f305ec4a8"};

  }



  @override
  Future<ResultAndStatus> getOpenUVData(Coordinate coordinate) async{
   try{

      String errormessage = null;
      response = await dio.get(OpenUVAPIUrls.openuvmainurl+OpenUVAPIUrls.uvlightvalueurl,queryParameters: 
      {"lat": coordinate.latitude,"lng":coordinate.longtitude , "dt":"2020-02-28T14:31:18.440Z"});

      if(response.statusCode == 200){
          if(response.data != null){
          
          //Decode the json
    //        var responceJson = jsonDecode(response.data);

          //Deseriliaze to object
            var asList = OpenUVApiResult.fromJson(response.data);


            return ResultAndStatus(ViewState.Idle,errormessage,asList);


          }          
      }  


    }
    //If response is not success
    on DioError catch(e) {

      return _errorHandlerUtils.properErrorMessageDioResponce(e.response);

    }
  }



  


}