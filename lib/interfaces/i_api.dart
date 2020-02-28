
import 'package:UVLightApp/models/coordinate.dart';
import 'package:UVLightApp/models/result.dart';

abstract class IApi{

  Future<ResultAndStatus> getOpenUVData(Coordinate coordinate);

}
