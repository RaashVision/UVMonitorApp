import 'package:UVLightApp/viewmodels/uv_profile_pic_viewmodel.dart';
import 'package:UVLightApp/views/core/base_view.dart';
import 'package:UVLightApp/views/responsive/orientation_layout.dart';
import 'package:UVLightApp/views/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';

class UVProfilePicWidget extends StatelessWidget {

  final String imgurl;

  UVProfilePicWidget({this.imgurl='googleicon.png'});



  @override
  Widget build(BuildContext context) {
     return BaseView<UVProfilePicViewModel>(
        onModelReady: (model)=> model.getDefaultData(),
         builder: (context, model, child) => 
      
          CircleAvatar(
         // radius: 5,
          child: Material(
        elevation: 1.0,
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child:  InkWell(
            child: Image.network(model.user?.photoUrl??"http://getdrawings.com/free-icon/man-in-circle-icon-53.png"),
            splashColor: Colors.transparent,
            highlightColor: Colors.black.withOpacity(0.30),
            onTap: () {

              //clickCallback();
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


                              Center(
                                child: CircleAvatar(
                              radius: 50,
                                  child: Material(
                                  elevation: 1.0,
                                  shape: CircleBorder(),
                                  clipBehavior: Clip.hardEdge,
                                  color: Colors.transparent,
                                  child:  InkWell(
                                      child: Image.network(model.user?.photoUrl??"http://getdrawings.com/free-icon/man-in-circle-icon-53.png"),
                                  ))),
                              ),
          




                             
                          new ListTile(
                            title:Row(
                              children: <Widget>[
                                Text("Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                  child: new Text(model.user?.displayName??"User",style :TextStyle(fontSize: 18)),
                                ),
                              ],
                            ),
                            onTap: () => {},          
                          ),
                          new ListTile(
                            title:Row(
                              children: <Widget>[
                                Text("Email", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                  child: new Text(model.user?.email??"ds",style :TextStyle(fontSize: 18)),
                                ),
                              ],
                            ),
                            onTap: () => {},          
                          ),
                          new ListTile(
                            title:Row(
                              children: <Widget>[
                                Text("Phone Number", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                  child: new Text(model.user?.phoneNumber??"-",style :TextStyle(fontSize: 18)),
                                ),
                              ],
                            ),
                            onTap: () => {},          
                          ),
                          
     
                            ],
                          ),
                          ),
                        );
                    }
                  );
            },
          ),
              ),
            ),
        

    );
  }
}