import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/enum/pos_text_formfield_validation_rule.dart';
import 'package:pos/helper/pos_text_formfield.dart';
import 'package:pos/helper/social_button.dart';
import 'package:pos/helper/style.dart';
import 'package:pos/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;

  GoogleSignIn googleSignIn = GoogleSignIn.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            children: [
              SizedBox(height: 56),
              Center(
                child: Text(
                  'Sign In',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: StyleColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 24),

              Row(
                children: [
                  // Facebook Button
                  Expanded(
                    child: SocialButton(
                      onPressed: () {
                        print('login with facebook');
                      },
                      label: 'Facebok',
                      icon: 'assets/images/facebook_icon.png',
                    ),
                  ),
                  SizedBox(width: 16),
                  // Google Button
                  Expanded(
                    child: SocialButton(
                      onPressed: () async {
                        final result = await googleSignIn.authenticate();
                        print(result);
                      },
                      label: 'Google',
                      icon: 'assets/images/google_icon.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: HexColor('#E0E5EC'), endIndent: 8),
                  ),
                  Text(
                    'Or',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Divider(color: HexColor('#E0E5EC'), indent: 8),
                  ),
                ],
              ),
              SizedBox(height: 24),
              PosTextFormfield(
                placeholder: 'Email',
                rule: PosTextFormfieldValidationRule.email,
                onChanged: (p0) {
                  setState(() {
                    
                  });
                },
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Email is required';
                  }
                  RegExp emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(p0)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              PosTextFormfield(
                placeholder: 'Password',
                isObsecure: isPassword,
                rule: PosTextFormfieldValidationRule.password,
                onChanged: (p0) {
                  setState(() {
                    
                  });
                },
                validator: (p0) {
                  RegExp passwordReg = RegExp(
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$',
                  );
                  if (p0 == null || p0.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  if (!passwordReg.hasMatch(p0)) {
                    return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    isPassword = !isPassword;
                    setState(() {});
                  },
                  icon: Icon(
                    isPassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold() ));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 32),
              TextButton(
                onPressed: _formKey.currentState?.validate() ?? false ? () {} : null,
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(30),
                  shadowColor: WidgetStatePropertyAll(
                    StyleColor.primary.withValues(alpha: 0.25),
                  ),
                  backgroundColor: WidgetStateColor.resolveWith(
                    (states) => states.contains(WidgetState.disabled)
                        ? Colors.grey
                        : StyleColor.primary,
                  ),

                  padding: WidgetStatePropertyAll(EdgeInsets.all(18)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                child: Text(
                  'Log In',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don’t have account?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' Sign Up',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: StyleColor.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // showDialog(
                            //   context: context,
                            //   barrierDismissible: true,
                            //   builder: (context) => AlertDialog(
                            //     contentPadding: EdgeInsets.all(20),
                            //     actionsPadding: EdgeInsets.all(20),
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //     ),
                            //     title: Text(
                            //       'Success',
                            //       textAlign: TextAlign.center,
                            //       style: GoogleFonts.poppins(
                            //         fontSize: 18,
                            //         color: Colors.black,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //     content: Column(
                            //       mainAxisSize: MainAxisSize.min,
                            //       children: [
                            //         Lottie.asset(
                            //           'assets/lotties/animate_success.json',
                            //           width: 200,
                            //         ),
                            //       ],
                            //     ),
                            //     actionsAlignment: MainAxisAlignment.center,
                            //     actions: [
                            //       TextButton(
                            //         onPressed: () {},
                            //         style: ButtonStyle(
                            //           padding: WidgetStatePropertyAll(
                            //             EdgeInsets.all(16),
                            //           ),
                            //           backgroundColor: WidgetStatePropertyAll(
                            //             StyleColor.primary,
                            //           ),
                            //         ),
                            //         child: Text(
                            //           'Continue',
                            //           style: GoogleFonts.poppins(
                            //             fontSize: 16,
                            //             fontWeight: FontWeight.w600,
                            //             color: Colors.white,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}
