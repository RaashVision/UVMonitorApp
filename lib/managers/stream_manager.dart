import 'dart:async';

import 'package:UVLightApp/models/coordinate.dart';
import 'package:UVLightApp/models/es_todo_model.dart';
import 'package:UVLightApp/models/uv_range_model.dart';

class StreamManager{

  StreamController<bool> _dbOnChange = new StreamController.broadcast();

  StreamController<bool> _updatedata = new StreamController.broadcast();

  StreamController<String> _receivemessge = new StreamController.broadcast();

  StreamController<Coordinate> _sendCoordinate = new StreamController.broadcast();

  StreamController<UVRangeModel> _currentUvRange = new StreamController.broadcast();

  StreamController refreshWhenDbHaveChange(){

    return _dbOnChange;
  }

   StreamController updatethedata(){

    return _updatedata;
  }

  StreamController receivedMessageFromMBroker(){

    return _receivemessge;
  }

  StreamController getCoordinateFromGoogleMap(){

    return _sendCoordinate;
  }

  StreamController getLatestUVRange(){

    return _currentUvRange;
  }



}