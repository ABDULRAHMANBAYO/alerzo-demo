import 'package:alerzo_demo/model/create_account.dart';
import 'package:alerzo_demo/routes/routes.dart';
import 'package:alerzo_demo/styles/login.dart';
import 'package:alerzo_demo/utils/assets_colors.dart';
import 'package:alerzo_demo/utils/borders.dart';
import 'package:alerzo_demo/utils/string_resources.dart';
import 'package:alerzo_demo/utils/validation.dart';
import 'package:alerzo_demo/widget/app_image.dart';
import 'package:alerzo_demo/widget/bottom_text.dart';
import 'package:alerzo_demo/widget/button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  //Set paddding around textFormfield
  late EdgeInsetsGeometry formFieldPadding;
  // Initially password is obscure
  bool _obscureTextLogin = true;
  int _animationDuration = 600;
  late double height, width;
  late RegisterUser createAccount;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    emailFocusNode.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    formFieldPadding =
        EdgeInsets.only(top: height * 0.02, bottom: height * 0.01);
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimatedPadding(
          duration: Duration(milliseconds: _animationDuration),
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06, vertical: width * 0.15),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: screenImage(width)),
                _welcomeText(),
                _buildFirstName(),
                _buildLastName(),
                _buildEmailAddress(),
                _buildPassword(),
                AnimatedPadding(
                    duration: Duration(milliseconds: _animationDuration),
                    padding: formFieldPadding,
                    child: submitButton(
                        StringResources.SIGN_UP, submit, height, width)),
                AnimatedPadding(
                    duration: Duration(milliseconds: _animationDuration),
                    padding: EdgeInsets.only(top: height * 0.022),
                    child: bottomText(
                        StringResources.HAVE_AN_ACCOUNT,
                        StringResources.LOGIN,
                        bottomTextOneStyle(width),
                        bottomTextTwoStyle(width),
                        goToLogin))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _welcomeText() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedPadding(
              duration: Duration(milliseconds: _animationDuration),
              padding: EdgeInsets.only(top: height * 0.02),
              child: Text(StringResources.CREATE_AN_ACCOUNT,
                  style: loginTextStyle(width))),
          Text(StringResources.JOIN_US, style: welcomeTextStyle(width, height))
        ],
      );
  Widget _buildFirstName() => AnimatedPadding(
        duration: Duration(milliseconds: _animationDuration),
        padding: formFieldPadding,
        child: TextFormField(
            cursorColor: AssetColors.primaryColor,
            controller: _firstNameController,
            keyboardType: TextInputType.name,
            focusNode: firstNameFocusNode,
            onTap: _requestFirstNameFocus,
            decoration: InputDecoration(
                labelText: StringResources.FIRST_NAME,
                labelStyle: firstNameFocusNode.hasFocus
                    ? labelTextFieldTextStyle(width)
                    : textFieldPlaceholderTextStyle(width),
                hintText: StringResources.FIRST_NAME,
                hintStyle: textFieldPlaceholderTextStyle(width),
                isDense: true,
                contentPadding: EdgeInsets.all(height * 0.02),
                focusedBorder: focused,
                disabledBorder: disabled,
                enabledBorder: enabled,
                errorBorder: error,
                focusedErrorBorder: focusedError,
                errorStyle: errorTextStyle(width)),
            validator: validateName,
            textInputAction: TextInputAction.next),
      );
  Widget _buildLastName() => AnimatedPadding(
        duration: Duration(milliseconds: _animationDuration),
        padding: formFieldPadding,
        child: TextFormField(
            cursorColor: AssetColors.primaryColor,
            focusNode: lastNameFocusNode,
            onTap: _requestLastNameFocus,
            controller: _lastNameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                labelText: StringResources.LAST_NAME,
                labelStyle: lastNameFocusNode.hasFocus
                    ? labelTextFieldTextStyle(width)
                    : textFieldPlaceholderTextStyle(width),
                hintText: StringResources.LAST_NAME,
                hintStyle: textFieldPlaceholderTextStyle(width),
                isDense: true,
                contentPadding: EdgeInsets.all(height * 0.02),
                focusedBorder: focused,
                disabledBorder: disabled,
                enabledBorder: enabled,
                errorBorder: error,
                focusedErrorBorder: focusedError,
                errorStyle: errorTextStyle(width)),
            validator: validateName,
            textInputAction: TextInputAction.next),
      );
  Widget _buildEmailAddress() => AnimatedPadding(
      duration: Duration(milliseconds: _animationDuration),
      padding: formFieldPadding,
      child: TextFormField(
          cursorColor: AssetColors.primaryColor,
          controller: _emailAddressController,
          keyboardType: TextInputType.multiline,
          focusNode: emailFocusNode,
          onTap: _requestEmailFocus,
          decoration: InputDecoration(
              labelText: StringResources.EMAIL_ADDRESS,
              labelStyle: emailFocusNode.hasFocus
                  ? labelTextFieldTextStyle(width)
                  : textFieldPlaceholderTextStyle(width),
              hintText: StringResources.EMAIL_ADDRESS,
              hintStyle: textFieldPlaceholderTextStyle(width),
              isDense: true,
              contentPadding: EdgeInsets.all(height * 0.02),
              focusedBorder: focused,
              disabledBorder: disabled,
              enabledBorder: enabled,
              errorBorder: error,
              focusedErrorBorder: focusedError,
              errorStyle: errorTextStyle(width)),
          validator: validateEmail,
          textInputAction: TextInputAction.next));
  Widget _buildPassword() => AnimatedPadding(
      duration: Duration(milliseconds: _animationDuration),
      padding: formFieldPadding,
      child: TextFormField(
          cursorColor: AssetColors.primaryColor,
          focusNode: passwordFocusNode,
          onTap: _requestPasswordFocus,
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: _obscureTextLogin,
          decoration: InputDecoration(
              labelText: StringResources.PASSWORD,
              labelStyle: passwordFocusNode.hasFocus
                  ? labelTextFieldTextStyle(width)
                  : textFieldPlaceholderTextStyle(width),
              hintText: StringResources.PASSWORD,
              hintStyle: textFieldPlaceholderTextStyle(width),
              isDense: true,
              contentPadding: EdgeInsets.all(height * 0.02),
              focusedBorder: focused,
              disabledBorder: disabled,
              enabledBorder: enabled,
              errorBorder: error,
              focusedErrorBorder: focusedError,
              errorStyle: errorTextStyle(width),
              suffixIcon: SizedBox(
                  height: height * 0.0,
                  child: IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(
                          _obscureTextLogin
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AssetColors.titleTextColor.withOpacity(0.5),
                          size: height * 0.030),
                      onPressed: _toggleLogin)),
              suffixIconConstraints:
                  BoxConstraints(minHeight: 20, minWidth: 10)),
          validator: validatePassword));

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  submit() {
    //close keyboard
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      createAccount = RegisterUser(
          email: _emailAddressController.text,
          password: _passwordController.text,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text);
    }
  }

  goToLogin() {
    Navigator.pushNamed(context, Routes.initialRoute);
  }

  void _requestEmailFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  void _requestPasswordFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(passwordFocusNode);
    });
  }

  void _requestFirstNameFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(firstNameFocusNode);
    });
  }

  void _requestLastNameFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(lastNameFocusNode);
    });
  }
}
