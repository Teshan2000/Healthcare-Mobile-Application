import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_management_system/components/signUpForm.dart';
import 'package:healthcare_management_system/utils/config.dart';
import 'package:healthcare_management_system/utils/text.dart';
import 'package:healthcare_management_system/screens/login_page.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    AppText.enText['welcome_text']!,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 350,
                    height: 100,
                    child: Image.asset("Assets/home_banner.png"),
                  ),
                ),
                //const SizedBox(height: 1),
                Center(
                  child: SizedBox(
                    width: 230,
                    height: 280,
                    child: Image.asset("Assets/register.png"),
                  ),
                ),
                Config.spaceSmall,
                Center(
                  child: Text(
                    AppText.enText['register_text']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Config.spaceSmall,
                SignUpForm(),
                Config.spaceSmall,
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Login now",
                          style: const TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
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
      ),
    );
  }
}
