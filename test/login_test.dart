import 'package:alerzo_demo/utils/string_resources.dart';
import 'package:alerzo_demo/utils/validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //Test empty email address
  test("Test empty email address", () {
    var result = validateEmail("");
    expect(result, StringResources.EMAIL_IS_EMPTY);
  });
  //Test invalid email address
  test("Test invalid email address", () {
    var result = validateEmail("dsffj");
    expect(result, StringResources.ENTER_VALID_EMAIL_REQUIRED);
  });
  //Test valid email address
  test("Test valid email address", () {
    var result = validateEmail("lambe@gamil.com");
    expect(result, null);
  });

  //Test empty password
  test("Test empty password value", () {
    var result = validatePassword("");
    expect(result, StringResources.PASSWORD_REQUIRED);
  });
  //Test password without upper case
  test("Test password with only lower case", () {
    var result = validatePassword("chiomachuwkuma1.");
    expect(result, StringResources.UPPER_CASE_REQUIRED);
  });
  //Test password without lower case
  test("Test password with only upper case", () {
    var result = validatePassword("CCOLADR5.");
    expect(result, StringResources.LOWER_CASE_REQUIRED);
  });
  //Test password without number
  test("Test password without number", () {
    var result = validatePassword("CowLoFG.");
    expect(result, StringResources.NUMBER_REQUIRED);
  });
  //Test password without special character
  test("Test password without special character", () {
    var result = validatePassword("CowLoFG1");
    expect(result, StringResources.SPECIAL_CHARACTER_REQUIRED);
  });
  // //Test password with less than 8 character
  // test("Test password with less than 8 character", () {
  //   var result = validatePassword("Coww1.");
  //   expect(result, StringResources.MINIMUM_PASSWORD);
  // });
//Test invalid password
  test("Test invalid  password ", () {
    var result = validatePassword("OLSw.1");
    expect(result, StringResources.ENTER_VALID_PASSWORD_REQUIRED);
  });

  //Test valid password
  test("Test valid  password ", () {
    var result = validatePassword("Olawale2018.");
    expect(result, null);
  });

  group('Login with valid email and password', () {
    //Test valid email address
    test("Test valid email address", () {
      var result = validateEmail("lambe@gamil.com");
      expect(result, null);
    });

    //Test empty password

    //Test valid password
    test("Test valid  password ", () {
      var result = validatePassword("Olawale2018.");
      expect(result, null);
    });
  });
}
