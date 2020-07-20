import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertUtils {
  static Alert getErrorAlert(BuildContext context, String errorCode) {
    String title;
    String desc;

    switch (errorCode) {
      case "ERROR_INVALID_EMAIL":
        title = 'Invalid email';
        desc = 'Check your email and try again';
        break;
      case "ERROR_WRONG_PASSWORD":
        title = 'Incorrect password';
        desc = 'Check your password and try again';
        break;
      case "ERROR_USER_NOT_FOUND":
        title = 'User not found';
        desc = 'Maybe you haven\'t previously registered an account?';
        break;
      case "ERROR_WEAK_PASSWORD":
        title = 'Weak password';
        desc = 'Try using a stronger password with atleast 6 characters';
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        title = 'Email already in use';
        desc = 'Try logging in instead or create a new account';
        break;
      default:
        title = 'Error logging in';
        break;
    }

    return Alert(context: context, title: title, desc: desc);
  }
}