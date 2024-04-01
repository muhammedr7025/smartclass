import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUs extends StatelessWidget {
  static String routeName = '/about-us';
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
              leading: const Text(
                'About',
                style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w600),
              ),
              trailing: SvgPicture.asset('assets/icons/svg/info.svg')
              // Icon(Icons.info, color: Colors.black, size: 32,),
              ),
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Center(
                child: Column(
              children: [
                Text(
                  'Lumia',
                  style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 48,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Smart Class App',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w300,
                      color: Color(0xff9B9B9B)),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  'Version: 1.0.1 (alpha)',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w300),
                ),
              ],
            )),
          ),
          const SizedBox(
            height: 39,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 33.7, right: 10),
            leading: SvgPicture.asset('assets/icons/svg/team.svg'),
            title: const Text(
              'Lumia Developers',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
                fontSize: 25,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 55.7, right: 10),
            subtitle: const Text(
              '1. Aryan',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Lexend',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 55.7, right: 10),
            subtitle: const Text(
              '2. Mohammed Ziyan',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Lexend',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 55.7, right: 10),
            subtitle: const Text(
              '3. Dev',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Lexend',
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
