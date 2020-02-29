
import 'package:UVLightApp/viewmodels/uv_login_viewmodel.dart';
import 'package:UVLightApp/viewmodels/core/startup_viewmodel.dart';
import 'package:UVLightApp/managers/theme_manager.dart';
import 'package:UVLightApp/repository/api/dio/dio_api.dart';
import 'package:UVLightApp/services/authentication_service.dart';
import 'package:UVLightApp/services/dialog_service.dart';
import 'package:UVLightApp/services/location_service.dart';
import 'package:UVLightApp/services/navigation_service.dart';
import 'package:UVLightApp/services/permission_service.dart';
import 'package:UVLightApp/services/uv_range_service.dart';
import 'package:UVLightApp/utils/converter_utils.dart';
import 'package:UVLightApp/utils/network_error_utils.dart';
import 'package:UVLightApp/viewmodels/uv_circular_viewmodel.dart';
import 'package:UVLightApp/viewmodels/uv_googlemap_viewmodel.dart';
import 'package:UVLightApp/viewmodels/uv_home_viewmodel.dart';
import 'package:UVLightApp/viewmodels/uv_profile_pic_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:UVLightApp/repository/repository.dart';
import 'interfaces/i_api.dart';
import 'interfaces/i_repository.dart';
import 'managers/stream_manager.dart';

GetIt locator = GetIt.I;

void setupLocator() {
//This file is for dependecies injection

locator.registerLazySingleton(()=>ConverterHelperUtils());
locator.registerLazySingleton(() => NavigationService());
locator.registerLazySingleton(()=>StreamManager());
locator.registerLazySingleton(() => DialogService());
locator.registerLazySingleton(()=> PermissionService());
locator.registerLazySingleton<IApi>(()=>DioAPI(null));
locator.registerLazySingleton(()=>NetworkErrorHandlerUtils());
 locator.registerLazySingleton<IRepository>(()=> new Repository());
 locator.registerFactory(()=>UVHomeViewModel());
 locator.registerFactory(()=>UVCircularViewModel());
 locator.registerLazySingleton(()=>LocationService());
 locator.registerFactory(()=>UVGoogleMapViewModel());
 locator.registerLazySingleton(()=>UVRangeService());
 locator.registerLazySingleton(()=>ThemeManager());
 locator.registerLazySingleton(()=>AuthenticationService());
 locator.registerFactory(()=>StartUpViewModel());
 locator.registerFactory(()=>UVLoginViewModel());
  locator.registerFactory(()=>UVProfilePicViewModel());
}

