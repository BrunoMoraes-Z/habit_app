import 'package:flutter/material.dart';
import 'package:habbit_app/app_styles.dart';
import 'package:habbit_app/size_config.dart';
import 'package:habbit_app/validators.dart';
import 'package:habbit_app/widgets/buttons/large_icon_button.dart';
import 'package:habbit_app/widgets/fields/my_check_box.dart';
import 'package:habbit_app/widgets/fields/my_password_field.dart';
import 'package:habbit_app/widgets/fields/my_text_form_field.dart';
import 'package:habbit_app/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpKey = GlobalKey<FormState>();

  void onSubmit() {
    _signUpKey.currentState!.validate();
  }

  List<FocusNode> _signUpFocusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    _signUpFocusNodes.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double height = SizeConfig.blockSizeV!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  child:
                      Image.asset('assets/images/auth/signup_illustration.png'),
                ),
                SizedBox(height: height * 1.5),
                Text(
                  'Create Your Account',
                  style: kTitle2,
                ),
                SizedBox(height: height * 1.5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: _signUpKey,
                    child: Column(
                      children: [
                        MyTextFormField(
                          fillColor: Colors.white,
                          hint: 'Name',
                          icon: Icons.person,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.name,
                          focusNode: _signUpFocusNodes[0],
                          validator: nameValidator,
                        ),
                        MyTextFormField(
                          fillColor: Colors.white,
                          hint: 'Email',
                          icon: Icons.email,
                          inputAction: TextInputAction.next,
                          inputType: TextInputType.emailAddress,
                          focusNode: _signUpFocusNodes[1],
                          validator: emailValidator,
                        ),
                        MyPasswordField(
                          fillColor: Colors.white,
                          focusNode: _signUpFocusNodes[2],
                          validator: passwordValidator,
                        ),
                        MyCheckBox(
                          text: 'Keep me signed in',
                        ),
                        MyCheckBox(
                          text: 'Email me about special pricing and more',
                        ),
                        MyTextButton(
                          text: 'Create Account',
                          onClick: onSubmit,
                          backgroundColor: kPrimaryColor,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 3,
                          color: kSecondaryColor.withOpacity(0.4),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Or sign in with',
                          style: kBodyText3,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          height: 3,
                          color: kSecondaryColor.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: LargeIconButton(
                        text: 'Google',
                        iconImage: 'assets/images/auth/google_icon.png',
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: LargeIconButton(
                        text: 'Facebook',
                        iconImage: 'assets/images/auth/facebook_icon.png',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Alredy have an account ?',
                      style: kBodyText3,
                    ),
                    SizedBox(width: 8),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        splashColor: kSecondaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Sign in',
                            style: kBodyText3.copyWith(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: height * 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
