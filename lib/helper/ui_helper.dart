
// Show loading screen
import 'package:qibla_finder/presentation/config/app_localization.dart';
import 'package:qibla_finder/shared/constant_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showLoading(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
          ),
        );
      });
}

// Show snackbar
void showInSnackBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey, String value) {
  scaffoldKey.currentState.showSnackBar(
    SnackBar(
      content: Text(value),
      backgroundColor: Theme.of(context).primaryColor,
      action: SnackBarAction(
        label: 'DISMISS',
        textColor: Colors.white,
        onPressed: () => SnackBarClosedReason.dismiss,
      ),
    ),
  );
}

// Show network problem dialog
Future<bool> showNoNetworkDialog(BuildContext context, String message) async {
  dynamic result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Container(
              height: 180,
              width: 290,
              padding: EdgeInsets.all(aPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppLocalizations.of(context).translate('offline_title'),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: aPadding),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(height: aPadding),
                  FlatButton(
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.pop(context, {'reload': true});
                    },
                    child: Text(
                      AppLocalizations.of(context).translate('offline_reload'),
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });

  return result['reload'];
}

void unfocus(BuildContext context) async {
  FocusScope.of(context).unfocus();
//  await SystemChrome.setEnabledSystemUIOverlays([]);
}