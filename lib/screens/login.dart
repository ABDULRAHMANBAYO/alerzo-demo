import 'package:alerzo_demo/model/login.dart';
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
// import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //Set paddding around textFormfield
  late EdgeInsetsGeometry formFieldPadding;
  // Initially password is obscure
  bool _obscureTextLogin = true;
  int _animationDuration = 600;
  late double height, width;
  late Login login;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
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
              horizontal: width * 0.06, vertical: height * 0.1),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: screenImage()),
                _welcomeText(),
                _buildEmailAddress(),
                _buildPassword(),
                AnimatedPadding(
                    duration: Duration(milliseconds: _animationDuration),
                    padding: formFieldPadding,
                    child: submitButton(
                        StringResources.LOGIN, submit, height, width)),
                AnimatedPadding(
                    duration: Duration(milliseconds: _animationDuration),
                    padding: EdgeInsets.only(top: height * 0.022),
                    child: bottomText(
                        StringResources.DONT_HAVE_AN_ACCOUNT,
                        StringResources.SIGN_UP,
                        bottomTextOneStyle(width),
                        bottomTextTwoStyle(width),
                        goToSignUp))
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
              child: Text(StringResources.LET_SIGN_YOU_IN,
                  style: loginTextStyle(width))),
          Text(StringResources.WELCOME_BACK,
              style: welcomeTextStyle(width, height))
        ],
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
              floatingLabelBehavior: FloatingLabelBehavior.auto,
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
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            focusNode: passwordFocusNode,
            onTap: _requestPasswordFocus,
            // style: loginTextStyle(width),
            obscureText: _obscureTextLogin,
            decoration: InputDecoration(
                labelText: StringResources.PASSWORD,
                labelStyle: passwordFocusNode.hasFocus
                    ? labelTextFieldTextStyle(width)
                    : textFieldPlaceholderTextStyle(width),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
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
            validator: validatePassword),
      );

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  submit() {
    //close keyboard
    FocusScope.of(context).unfocus();
    //Validate form
    // if (_formKey.currentState!.validate()) {
    //   login = Login(
    //       email: _emailAddressController.text,
    //       password: _passwordController.text);
    // }
    goToHome();
  }

  goToSignUp() {
    Navigator.pushNamed(context, Routes.signUp);
  }

  goToHome() {
    Navigator.pushNamed(context, Routes.home);
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
}
