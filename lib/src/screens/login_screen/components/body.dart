import 'package:lumia/config/size_config.dart';
import 'package:lumia/service/preferences_service.dart';
import 'package:lumia/src/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../auth_service.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/login.png',
              height: getProportionateScreenHeight(300),
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Sign into \nmange your device & accessory',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            controller: usernameController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(70.0),
                ),
                hintText: 'Email',
                suffixIcon: const Icon(
                  Icons.email,
                  color: Colors.black,
                )),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(70.0),
                ),
                hintText: 'Password',
                suffixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black,
                )),
            obscureText: true,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: GestureDetector(
            onTap: () async {
              final message = await AuthService().login(
                email: usernameController.text,
                password: passwordController.text,
              );
              if (message!.contains('Success')) {
                final preferencesService = PreferencesService();
                await preferencesService.saveLoginStatus(true);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF464646),
                borderRadius: BorderRadius.circular(70.0),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
