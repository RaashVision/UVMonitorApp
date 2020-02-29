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

      bool pms = true;

      //ASk location permission
      var haspermision = await permissionService.hasPermission(PermissionGroup.locationAlways);

      if(!haspermision){

           pms = await permissionService.requestPermission(PermissionGroup.locationAlways);


      }
//If permision not given
     if(!pms){

       var dialogResult = await dialogService.showDialog(
            title: 'Permission Issue',
            description: "This application required to access location in order to work.Please go to the app Setting and give permision",
            buttonTitle: "Request",
            buttonNegativeTitle: "No"
          );
          if (dialogResult.confirmed) {

             var pms = await permissionService.openAppSetting();

            //Still deny
             if(!pms){

               await _navigationService.navigateTo(routes.LoginRoute);

               var dws = 0;

             }
             else{

               var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

                if (hasLoggedInUser) {
                 await  _navigationService.navigateTo(routes.HomeRoute);
                 _navigationService.navigateTo(routes.LoginRoute);
                } else {
                  await _navigationService.navigateTo(routes.LoginRoute);
                }

             }

          } else {
            print('User cancelled the dialog');
          }
     }
     else{

        var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

                if (hasLoggedInUser) {
                 await  _navigationService.navigateTo(routes.HomeRoute);
                 _navigationService.navigateTo(routes.LoginRoute);
                } else {
                  await _navigationService.navigateTo(routes.LoginRoute);
                }
        




     }

     

   
  }

















}