import 'package:CrResposiveApp/viewmodels/uv_circular_viewmodel.dart';
import 'package:CrResposiveApp/views/core/base_view.dart';
import 'package:CrResposiveApp/views/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UVCircularWidget extends StatelessWidget {

  final double radius;
  final double percent;
  final int valueofUv;
  final Widget centerWidget;

  UVCircularWidget({this.valueofUv,this.radius = 220.0,this.percent = 0.8,this.centerWidget = const Text(
                    "70.0%",
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),});
  @override
  Widget build(BuildContext context) {
    return  BaseView<UVCircularViewModel>(
        onModelReady: (model)=> model.getDefaultData(),
         builder: (context, model, child) =>Container(
        child: Stack(
          children: <Widget>[
            new CircularPercentIndicator(
                        radius: radius,
                        lineWidth: 13.0,
                        animation: true,
                        percent: percent,
                        center: centerWidget,
                        footer: Text("10.41PM 27/2/2020"),
                        
                        circularStrokeCap: CircularStrokeCap.butt,
                        progressColor: PrimaryColor,
                      ),
                      
          ],
        ),
        
      ),
    );
  }
}