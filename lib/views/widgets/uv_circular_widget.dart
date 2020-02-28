import 'package:UVLightApp/viewmodels/uv_circular_viewmodel.dart';
import 'package:UVLightApp/views/core/base_view.dart';
import 'package:UVLightApp/views/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UVCircularWidget extends StatelessWidget {

  final double radius;
  final double percent;
  final String levelname;
  final double valueofUv;
  final Widget centerWidget;

  UVCircularWidget({this.levelname="Low",this.valueofUv=0.0,this.radius = 220.0,this.percent = 0.8,this.centerWidget = const Text(
                    "70.0%",
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),});
  @override
  Widget build(BuildContext context) {
    return  BaseView<UVCircularViewModel>(
        onModelReady: (model)=> model.getDefaultData(),
         builder: (context, model, child) =>
            Stack(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisSize: MainAxisSize.max,
              children: <Widget>[

              
                Center(
                  child: new CircularPercentIndicator(
                                // header: Padding(
                                //   padding: const EdgeInsets.all(5.0),
                                //   child: Text(model.lastClickTime,style: TextStyle(fontSize: 20),),
                                // ),
                                radius: radius,
                                lineWidth: 13.0,
                                animation: true,
                                percent: model.rangeModel.percent,
                                center:  Column(
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
                

              

             
                  Align(
                    alignment: Alignment.bottomCenter,
                                      child: Row(
                     
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
                           Expanded(child: Text(model.current_cor.latitude.toStringAsFixed(3),style: TextStyle(fontSize: 15 ))),
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
                           Expanded(child: Text(" " +model.current_cor.longtitude.toStringAsFixed(3),style: TextStyle(fontSize: 15 )),flex: 3,),
                         ],
                       ),),flex:5),
                     ],
                 ),
                  )
                 //)
              ],
            ),
                      
          
        
        
      
    );
  }
}