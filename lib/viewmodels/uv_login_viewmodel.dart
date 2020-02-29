import 'package:UVLightApp/enums/viewstate.dart';
import 'package:UVLightApp/services/authentication_service.dart';
import 'package:UVLightApp/services/dialog_service.dart';
import 'package:UVLightApp/services/navigation_service.dart';
import 'package:UVLightApp/constants/route_paths.dart' as routes;
import 'package:UVLightApp/services/permission_service.dart';
import 'package:permission_handler/permission_handler.dart';
import '../locator.dart';
import 'core/base_viewmodel.dart';

class UVLoginViewModel extends BaseViewModel{

  AuthenticationService authenticationService = locator<AuthenticationService>();
  DialogService dialogService = locator<DialogService>();
   NavigationService _navigationService = locator<NavigationService>();
  PermissionService permissionService  =locator<PermissionService>();

//Login function
  void signinBasedOnSelectedAccount(bool isGoogle) async{

    try{

 
      var permissionLocation = await permissionService.permissionForLocation();

     //If no location given
      if(!permissionLocation)
          return;

        //If click google sign in btn
            if(isGoogle){

              setState(viewState:ViewState.Busy);

              var result = await authenticationService.signInWithGoogle();

              //If authorization succedd
              if(result.isSuccess)
                _navigationService.navigateTo(routes.HomeRoute);

              //If authorization failed
              else{
                //If didnot select anything
                  if(result.errormessage == "noselection"){
                    setState(viewState:ViewState.Idle);
                    return;
                  }  
                  var dialogResult = await dialogService.showDialogMessage(
                    title: 'Error',
                    description: result.errormessage,
                  );
              }

            }
              //If click FB sign in
            else{

              var dialogResult = await dialogService.showDialogMessage(
                    title: 'Facebook Sign In',
                    description: "Feature coming soon",
                  );

              // setState(viewState:ViewState.Idle);
            }
              
          setState(viewState:ViewState.Idle);


    }
    catch(e){

     

    }


  }

}