import 'dart:convert';

import 'package:CrResposiveApp/api_urls.dart';
import 'package:CrResposiveApp/enums/viewstate.dart';
import 'package:CrResposiveApp/interfaces/i_api.dart';
import 'package:CrResposiveApp/locator.dart';
import 'package:CrResposiveApp/models/coordinate.dart';
import 'package:CrResposiveApp/models/result.dart';
import 'package:CrResposiveApp/models/typicode_photo.dart';
import 'package:CrResposiveApp/utils/network_error_utils.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as kokoi;
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
    dio.options.headers = {"x-access-token":"dc5ac45060ec40c3c6222747cf919769"};

  }



  @override
  Future<ResultAndStatus> getOpenUVData(Coordinate coordinate) async{
   try{

      String errormessage = null;
      response = await dio.get(OpenUVAPIUrls.openuvmainurl+OpenUVAPIUrls.uvlightvalueurl,queryParameters: 
      {"lat": coordinate.latitude,"lng":coordinate.longtitude,"dt":coordinate.dateTime});

      if(response.statusCode == 200){
          if(response.data != null){
          
          //Decode the json
            //var responceJson = jsonDecode(response.data);

          //Deseriliaze to object
            var asList = (response.data as List)
                  .map((p) => TypiCodePhoto.fromJson(p))
                  .toList();


            return ResultAndStatus(ViewState.Idle,errormessage,asList);


          }          
      }  


    }
    //If response is not success
    on DioError catch(e) {

      return _errorHandlerUtils.properErrorMessageDioResponce(response);

    }
  }



  


}