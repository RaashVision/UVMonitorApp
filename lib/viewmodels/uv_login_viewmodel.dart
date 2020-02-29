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

  String errormessage; 
  AuthenticationService authenticationService = locator<AuthenticationService>();
  DialogService dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
   PermissionService permissionService  =locator<PermissionService>();
  void getDefaultData() async{


  }

  void signinUsingGoogle() async{
    try{



      

      

  //lOGIN TO GOOGLE
   var ds = await authenticationService.signInWithGoogle();

 
    }
      catch(e){
      

      }



  }

  void signinBasedOnSelectedAccount(bool isGoogle) async{

    try{

      bool pms = true;

      //ASk location permission
      var haspermision = await permissionService.hasPermission(PermissionGroup.location);

      if(!haspermision){

           pms = await permissionService.requestPermission(PermissionGroup.location);


      }


    //If permision not given
     if(!pms){

        var dialogResult = await dialogService.showDialog(
            title: 'Permission Issue',
            description: "This application required to access location in order to work",
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

               var hasLoggedInUser = await authenticationService.isUserLoggedIn();

                if (hasLoggedInUser) {
                 await  _navigationService.navigateTo(routes.HomeRoute);
                 _navigationService.navigateTo(routes.LoginRoute);
                } else {
                  await _navigationService.navigateTo(routes.LoginRoute);
                }

             }

          }
          else{

          }


     }

     
     

//If click google sign in btn
    if(isGoogle){

       setState(viewState:ViewState.Busy);

      var result = await authenticationService.signInWithGoogle();

      //If authorization succedd
      if(result.isSuccess){

        _navigationService.navigateTo(routes.HomeRoute);



      }
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