
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_management_system/models/authModel.dart';
import 'package:healthcare_management_system/providers/dioProvider.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../utils/config.dart';
import 'button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Username',
              labelText: 'Username',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.person_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obsecurePass,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.lock_outline),
                prefixIconColor: Config.primaryColor,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecurePass = !obsecurePass;
                      });
                    },
                    icon: obsecurePass
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.black38,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: Config.primaryColor,
                          ))),
          ),
          Config.spaceSmall,
          Consumer<AuthModel>(builder: (context, auth, child) {
            return Button(
              width: double.infinity,
              title: 'Sign Up',
              onPressed: () async {
                try {
                  final userRegistration = await DioProvider().registerUser(
                      _nameController.text,
                      _emailController.text,
                      _passController.text);

                  if (userRegistration != null && userRegistration.statusCode == 200) {
                    final token = await DioProvider()
                        .getToken(_emailController.text, _passController.text);

                    if (token != null && token.statusCode == 200) {
                      auth.loginSuccess();
                      MyApp.navigatorKey.currentState!.pushNamed('login');
                    }
                  } else {
                    print('Register not successful!');
                  }
                } on DioError catch (e) {
                  print('Dio error occurred: $e');
                }
              },
              disable: false,
            );
          }),
        ],
      ),
    );
  }
}


