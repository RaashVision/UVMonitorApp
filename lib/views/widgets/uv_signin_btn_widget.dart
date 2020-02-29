import 'package:flutter/material.dart';

class SignBtnWidget extends StatelessWidget {
  
  final double topRight;
  final double bottomRight;
  final String imgfilenname;
  final String btnname;
  final bool isGooglebtn;
  void Function(bool) isGoogle;


  SignBtnWidget({this.topRight, this.bottomRight,this.imgfilenname,this.btnname,this.isGoogle,this.isGooglebtn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40, bottom: 30),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 60,
        child: Material(
          elevation: 10,
            clipBehavior: Clip.antiAlias,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(bottomRight),
                  topRight: Radius.circular(topRight)
                  )),
          child: FlatButton(
                     //elevation: 0.0,
          child: ListTile(
            leading: Image.asset(imgfilenname,height:45,),
            title: Text(btnname),
          ),
          //splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onPressed: (){

              isGoogle(isGooglebtn);
          },
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0))
        ),)
      ),
    );
  }
}
