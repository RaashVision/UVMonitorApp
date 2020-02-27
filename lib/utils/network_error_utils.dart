
import 'package:CrResposiveApp/enums/viewstate.dart';
import 'package:CrResposiveApp/models/result.dart';
import 'package:dio/dio.dart';

class NetworkErrorHandlerUtils{


  ResultAndStatus properErrorMessageDioResponce(Response responce){

    var statuscode = responce.statusCode.toString();
    var errormessage = responce.toString();

    var errordata = responce.data['error'];

    return new ResultAndStatus(ViewState.Error, errormessage, null);

  }

   


}