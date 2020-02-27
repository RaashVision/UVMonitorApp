
import 'package:CrResposiveApp/models/coordinate.dart';
import 'package:CrResposiveApp/models/result.dart';

abstract class IApi{

  Future<ResultAndStatus> getOpenUVData(Coordinate coordinate);

}
