import 'package:UVLightApp/views/pages/uv_login_view/uv_login_view.dart';
import 'package:UVLightApp/views/core/startup_view.dart';
import 'package:UVLightApp/views/pages/uv_home_view/uv_home_view.dart';
import 'package:flutter/material.dart';
import 'package:UVLightApp/constants/route_paths.dart' as routes;

//This is namvigation route of the app.
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    case routes.StartUpRoute:
      //var userName = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => StartUpView());

       case routes.LoginRoute:
      //var userName = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => UVLoginView());
  
    case routes.HomeRoute:
      //var userName = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => UVHomeView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}