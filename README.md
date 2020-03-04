#  UVMonitorApp TodoApp

This is the  UVMonitorApp built in Flutter. This app is used to monitor the Ultra violet light value for certain area. I used Provider as State Management. Use Google Map and use opensource UV light api (https://www.openuv.io/) for the data. Only tested with Android. IOS not tested and setup yet

## Feature
- Sign in and out using Google Account
- Get current location in Google map and gets its UV index value
- Tap on google map to get the particular UV index value
- Check Profile information by tap on profile picture

## Screenshots

![screenshot_20200229-201652](https://user-images.githubusercontent.com/14199227/75607554-3d696b00-5b33-11ea-871f-84e91a9703e1.jpg)

![screenshot_20200304-231032(1)](https://user-images.githubusercontent.com/14199227/75893951-79236e00-5e6e-11ea-8763-3e91284b32cb.jpg)

![screenshot_20200304-231040(1)](https://user-images.githubusercontent.com/14199227/75894000-8a6c7a80-5e6e-11ea-9b6f-b7a17b66690f.jpg)


## GIF

![ezgif com-video-to-gif(1)](https://user-images.githubusercontent.com/14199227/75894026-96583c80-5e6e-11ea-9e9e-abc868a24fb6.gif)


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
  - Sign in with Facebook
