#  UVMonitorApp TodoApp

This is the  UVMonitorApp app built in Flutter. Use Provider as State Management. Have use Google Map and use opensource UV light api (https://www.openuv.io/) for the data. Only tested with Android. IOS not tested yet

## Feature
- Sign in and out using Google Account
- Get current location in Google map and gets its UV index value
- Tap on google map to get the particular UV index value
- Check Profile information by tap on profile picture

## Screenshots

![screenshot_20200229-201652](https://user-images.githubusercontent.com/14199227/75607554-3d696b00-5b33-11ea-871f-84e91a9703e1.jpg)
![screenshot_20200229-202338](https://user-images.githubusercontent.com/14199227/75607563-540fc200-5b33-11ea-9234-b304f8f6a31f.jpg)
![screenshot_20200229-202344](https://user-images.githubusercontent.com/14199227/75607558-44907900-5b33-11ea-9acc-ce2474d3bf63.jpg)



## GIF

![20200229-202211](https://user-images.githubusercontent.com/14199227/75607569-62f67480-5b33-11ea-8290-aac06d48547c.gif)

Design Architecture
- MVVM (Model-View-Viewmodel)

State Management
- Provider

Library used
  - google_maps_flutter - https://pub.dev/packages/google_maps_flutter
  - location  - https://pub.dev/packages/location
  - percent_indicator  - https://pub.dev/packages/percent_indicator
  - firebase_auth  - https://pub.dev/packages/firebase_auth
  - google_sign_in - https://pub.dev/packages/google_sign_in
  - Provider -https://pub.dev/documentation/provider/latest/
  - FlushBar - https://pub.dev/packages/flushbar
  - rflutter_alert - https://pub.dev/packages/rflutter_alert
  
Api used
  - https://www.openuv.io/

TODO
  - Error handling
  - No internet connection handling
  - Resposive UI 
