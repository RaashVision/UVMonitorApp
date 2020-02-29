import 'package:UVLightApp/services/authentication_service.dart';
import 'package:UVLightApp/services/dialog_service.dart';
import 'package:UVLightApp/services/navigation_service.dart';
import 'package:UVLightApp/constants/route_paths.dart' as routes;
import 'package:UVLightApp/services/permission_service.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../locator.dart';
import 'base_viewmodel.dart';

class StartUpViewModel extends BaseViewModel{

   final AuthenticationService _authenticationService =locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  PermissionService permissionService  =locator<PermissionService>();
  DialogService dialogService = locator<DialogService>();
  String errormessage; 


    void startUpLogic() async {


        var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

                if (hasLoggedInUser) {
                 await  _navigationService.navigateTo(routes.HomeRoute);
                 _navigationService.navigateTo(routes.LoginRoute);
                } else {
                  await _navigationService.navigateTo(routes.LoginRoute);
                }

    }
        


   
  }















