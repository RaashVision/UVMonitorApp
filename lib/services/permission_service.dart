import 'dart:io';
import 'package:UVLightApp/services/dialog_service.dart';
import 'package:permission_handler/permission_handler.dart';

import '../locator.dart';

class PermissionService{

    final PermissionHandler _permissionHandler = PermissionHandler();

    DialogService dialogService = locator<DialogService>();

//Request for the permission
   Future<bool> requestPermission(PermissionGroup permission) async {
   var result = await _permissionHandler.requestPermissions([permission]);

      //IOS have some different behaviour then android so handle different
        if(Platform.isIOS){
          if (result[permission] == PermissionStatus.granted) {
            return true;
          }
          if (result[permission] == PermissionStatus.denied) {

            DialogService _dialogService = locator<DialogService>();

            var dialogResult = await _dialogService.showDialog(
              title: 'Permission required',
              description: 'Please give all the permission need',
              buttonTitle: "Open App Settings"
            );
            if (dialogResult.confirmed) {
              await _permissionHandler.openAppSettings();

            } else {
            }
            return false;
          }

        }
      //Android have different way to handle
        if(Platform.isAndroid) {
          if (result[permission] == PermissionStatus.granted) {
            return true;
          }
          else if (result[permission]== PermissionStatus.unknown){
            return true;
          }
        }
        return false;
      }

//Check particular have permission or not
 Future<bool> hasPermission(PermissionGroup permission) async {
   var permissionStatus =
   await _permissionHandler.checkPermissionStatus(permission);
   return permissionStatus == PermissionStatus.granted;
 }


 Future<bool> openAppSetting() async{

   return await _permissionHandler.openAppSettings();
 }





 Future<bool> permissionForLocation() async{

   bool status_request = true;

   //var haspermisionWhenInUse = await hasPermission(PermissionGroup.locationWhenInUse);
   var haspermision = await hasPermission(PermissionGroup.location);
   //var haspermisionAlways = await hasPermission(PermissionGroup.locationAlways);

      //If no permission
      if(!haspermision){

           status_request = await requestPermission(PermissionGroup.location);


      }


    //If permision deny
     if(!status_request){

        var dialogResult = await dialogService.showDialog(
            title: 'Permission Issue',
            description: "This application location permission to work properly",
            buttonTitle: "Request",
            buttonNegativeTitle: "No"
          );
          //If he select yes
          if (dialogResult.confirmed) {

            var opensettingstatus =await _permissionHandler.openAppSettings();

            //If user open the seeting page and come back to app, check permission again
            if(opensettingstatus){
                var haspermisionAgain = await hasPermission(PermissionGroup.locationWhenInUse);

                if(!haspermisionAgain){

                  return false;

                }

                return true;

            }

            return false;

          }

          return false;

     }

     return true;


 }



}