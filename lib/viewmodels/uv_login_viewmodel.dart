import 'package:UVLightApp/services/authentication_service.dart';

import '../locator.dart';
import 'core/base_viewmodel.dart';

class UVLoginViewModel extends BaseViewModel{

  String errormessage; 
  AuthenticationService authenticationService = locator<AuthenticationService>();


  void getDefaultData() async{


  }

  void signinUsingGoogle() async{
    try{

      
   var ds = await authenticationService.signInWithGoogle();

   int dsds = 0;


    }
    catch(e){
      int ds = 0;

    }



  }

}