
import 'package:UVLightApp/managers/dialog_manager.dart';
import 'package:UVLightApp/managers/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:UVLightApp/managers/lifecycle_manager.dart';
import 'package:UVLightApp/views/shared/app_colors.dart';
import 'package:flutter/services.dart';
import 'locator.dart';
import 'services/navigation_service.dart';
import 'package:UVLightApp/constants/route_paths.dart' as routes;
import 'package:UVLightApp/router.dart' as router;


void main(){
  setupLocator();
     WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new MyApp());
    });
}

class MyApp extends StatelessWidget {

  final GlobalKey _key = new GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

     return StreamBuilder<ThemeData>(
             stream: locator<ThemeManager>().themeController.stream,
             initialData: ThemeData(
                primarySwatch: PrimaryColor,),
             builder: (context, themeSnapshot){
                 return LifeCycleManager(
                  child: MaterialApp(     
                    title: 'UVLightApp',
                    navigatorKey: locator<NavigationService>().navigatorKey,
                    onGenerateRoute: router.generateRoute,
                    initialRoute: routes.StartUpRoute,
                    builder: (context, widget) => Navigator(
                      onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => DialogManager(
                            key: _key,
                            child: widget,
                          )),
                    ),
                    theme: themeSnapshot.data
                  ),
                );
             }
          );

  }
}
