import 'package:CrResposiveApp/interfaces/i_repository.dart';
import 'package:CrResposiveApp/locator.dart';
import 'package:CrResposiveApp/services/navigation_service.dart';
import 'package:CrResposiveApp/viewmodels/core/base_viewmodel.dart';

class UVHomeViewModel extends BaseViewModel{

  String errormessage; 
  IRepository iRepository = locator<IRepository>();
  NavigationService navigationService = locator<NavigationService>();


  void getDefaultData() async{
  }

}
