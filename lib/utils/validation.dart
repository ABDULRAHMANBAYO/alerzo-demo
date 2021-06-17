import 'string_resources.dart';

String? validateEmail(value) {
  var pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
  RegExp regex = new RegExp(pattern);
  if (value!.isEmpty) {
    return StringResources.EMAIL_IS_EMPTY;
  } else if (!regex.hasMatch(value)) {
    return StringResources.ENTER_VALID_EMAIL_REQUIRED;
  } else
    return null;
}

String? validatePassword(value) {
  var pattern =
      // r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>\~]).{8,}$';
  RegExp regex = new RegExp(pattern);
  print(value);
  if (value.isEmpty) {
    return StringResources.PASSWORD_REQUIRED;
  } else if (!value.contains(RegExp(r'[A-Z]'))) {
    return StringResources.UPPER_CASE_REQUIRED;
  } else if (!value.contains(RegExp(r'[a-z]'))) {
    return StringResources.LOWER_CASE_REQUIRED;
  } else if (!value.contains(RegExp(r'[0-9]'))) {
    return StringResources.NUMBER_REQUIRED;
  } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>\~]'))) {
    return StringResources.SPECIAL_CHARACTER_REQUIRED;
  }
  // else if (value.toString().length < 8) {
  //   return StringResources.MINIMUM_PASSWORD;
  // }
  else if (!regex.hasMatch(value)) {
    return StringResources.ENTER_VALID_PASSWORD_REQUIRED;
  }
}

String? validateName(fullName) {
  String patttern = r'^[a-z A-Z,.\-]+$';
  RegExp regExp = new RegExp(patttern);
  if (fullName!.length == 0) {
    return StringResources.ENTER_NAME;
  } else if (!regExp.hasMatch(fullName)) {
    return StringResources.ENTER_VALID_NAME;
  }
  return null;
}
