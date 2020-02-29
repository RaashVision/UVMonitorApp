import 'dart:async';

import 'package:UVLightApp/models/alert_request.dart';
import 'package:UVLightApp/models/alert_response.dart';

class DialogService {
  Function(AlertRequest) _showDialogListener;
  Function(AlertRequest) _showDialogMessageListener;
  Completer<AlertResponse> _dialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
    _showDialogMessageListener = showDialogListener;
  }

  Future<AlertResponse> showDialog({String title, String description, String buttonTitle = 'Yes', String buttonNegativeTitle='No'})
          {
          _dialogCompleter = Completer<AlertResponse>();
          _showDialogListener(AlertRequest(
            title: title,
            description: description,
            buttonTitle: buttonTitle,
            buttonNegativeTitle: buttonNegativeTitle
          ));
          return _dialogCompleter.future;
      }

        Future<AlertResponse> showDialogMessage({String title, String description, String buttonTitle = 'Ok', String buttonNegativeTitle='No'})
          {
          _dialogCompleter = Completer<AlertResponse>();
          _showDialogMessageListener(AlertRequest(
            title: title,
            description: description,
            buttonTitle: buttonTitle,
           buttonNegativeTitle: buttonNegativeTitle
          ));
          return _dialogCompleter.future;
      }

  void dialogComplete(AlertResponse response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}
