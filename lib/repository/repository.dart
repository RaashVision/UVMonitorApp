import 'package:UVLightApp/enums/viewstate.dart';
import 'package:UVLightApp/interfaces/i_api.dart';
import 'package:UVLightApp/interfaces/i_repository.dart';
import 'package:UVLightApp/locator.dart';
import 'package:UVLightApp/managers/stream_manager.dart';
import 'package:UVLightApp/models/coordinate.dart';
import 'package:UVLightApp/models/es_todo_model.dart';
import 'package:UVLightApp/models/result.dart';

class Repository implements IRepository{

    IApi  iapi = locator<IApi>();

  @override
  Future<ResultAndStatus> getOpenUVData(Coordinate coordinate) async {
    return await iapi.getOpenUVData(coordinate);
  }






}

