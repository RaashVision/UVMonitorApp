import 'package:CrResposiveApp/enums/viewstate.dart';
import 'package:CrResposiveApp/interfaces/i_api.dart';
import 'package:CrResposiveApp/interfaces/i_repository.dart';
import 'package:CrResposiveApp/locator.dart';
import 'package:CrResposiveApp/managers/stream_manager.dart';
import 'package:CrResposiveApp/models/coordinate.dart';
import 'package:CrResposiveApp/models/es_todo_model.dart';
import 'package:CrResposiveApp/models/result.dart';

class Repository implements IRepository{

    IApi  iapi = locator<IApi>();

  @override
  Future<ResultAndStatus> getOpenUVData(Coordinate coordinate) async {
    return await iapi.getOpenUVData(coordinate);
  }






}

