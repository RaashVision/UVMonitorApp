import 'package:UVLightApp/viewmodels/uv_circular_viewmodel.dart';
import 'package:UVLightApp/views/core/base_view.dart';
import 'package:UVLightApp/views/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UVCircularWidget extends StatelessWidget {

  final double radius;

  UVCircularWidget({this.radius = 240.0});
  @override
  Widget build(BuildContext context) {
    return  BaseView<UVCircularViewModel>(
        //onModelReady: (model)=> model.getDefaultData(),
         builder: (context, model, child) =>
            Stack(
              children: <Widget>[

                //This is datetime UI
                Align(alignment: Alignment.topCenter, child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,0),
                  child: Text(new DateFormat.yMd().add_jm().format(model.current_cor.dateTime),style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                )),

              //This is circular UI with bottomsheet
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,12),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){

                            //Show Bottomsheet UI
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                                    ),
                                context: context,
                                builder: (BuildContext bc){
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                      child: Container(
                                              
                                        child: new Wrap(
                                        children: <Widget>[
                                          
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('UV Range',style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                                          ),
                                          Image.asset('uvrange.PNG' , width: MediaQuery.of(context).size.width,)
                                        
            
                                        ],
                                      ),
                                      ),
                                    );
                                }
                              );

                      },
                      child: new CircularPercentIndicator(
                                    radius: radius,
                                    lineWidth: 13.0,
                                    animation: true,
                                    percent: model.rangeModel.percent,
                                    center: 
                                     Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text((model.rangeModel.levelName),style: TextStyle(fontSize: 25),),
                                          Text(model.rangeModel.uv_value?.toString()??"0",style: TextStyle(fontSize: 30),)
                                        ],
                                      ),
                                    
                                    //footer: Text(model.lastClickTime),
                                    
                                    circularStrokeCap: CircularStrokeCap.butt,
                                    progressColor: model.rangeModel.uv_color,
                                  ),
                    ),
                  ),
                ),

                 /* This widget to show Latitude and longtitude at home page */
                  Align(
                    alignment: Alignment.bottomCenter,
                     child: latlongUI(model.current_cor.latitude, model.current_cor.longtitude)
                  )
                 //)
              ],
            ),
                    
        
        
      
    );

  }







    /* This widget to show Latitude and longtitude at home page */
  Widget latlongUI(double lat, double long){

    return Row(
                     
                     mainAxisSize: MainAxisSize.max,
                     children: <Widget>[
                       Flexible(child: Container(color: Colors.grey , height: 50, child: Row(
                         mainAxisSize: MainAxisSize.max,
                         children: <Widget>[
                           Expanded(
                                                        child: Padding(
                               padding: const EdgeInsets.fromLTRB(15,0,0,0),
                               child: Text('Latitude :' ,style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold,)),
                             ),
                           ),
                         //  Expanded(child: Text(model.current_cor.latitude.toStringAsFixed(3),style: TextStyle(fontSize: 15 ))),
                            Expanded(child: Text(lat.toStringAsFixed(3),style: TextStyle(fontSize: 15 ))),
                         ],
                       ),),flex:5),
                      Flexible(child: Container(color: Colors.grey , height: 50, child: Row(
                         mainAxisSize: MainAxisSize.max,
                         children: <Widget>[
                           Flexible(
                                                        child: Padding(
                               padding: const EdgeInsets.fromLTRB(15,0,0,0),
                               child: Text('Longtitude :' ,style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold,)),
                             ),
                           flex: 7,),
                           //Expanded(child: Text(" " +model.current_cor.longtitude.toStringAsFixed(3),style: TextStyle(fontSize: 15 )),flex: 3,),
                           Expanded(child: Text(" " +long.toStringAsFixed(3),style: TextStyle(fontSize: 15 )),flex: 3,),
                         ],
                       ),),flex:5),
                     ],
                 );



  }
}