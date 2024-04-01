import 'package:lumia/config/size_config.dart';
import 'package:lumia/provider/base_view.dart';
import 'package:lumia/src/screens/favourites_screen/favourites_screen.dart';
import 'package:lumia/view/home_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:lumia/src/screens/menu_page/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<HomeScreenViewModel>(
        onModelReady: (model) => {
              model.generateRandomNumber(),
            },
        builder: (context, model, child) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: getProportionateScreenHeight(60),
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black),
                title: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(
                      4,
                    ),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lumia',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(5),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(100),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xffdadada),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(45, 45)),
                        ),
                        child: IconButton(
                          splashRadius: 25,
                          icon: const Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () {
                            // Navigator.of(context).pushNamed(EditProfile.routeName);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Favourites(
                                    model: model,
                                  ),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              drawer: SizedBox(
                  width: getProportionateScreenWidth(270), child: const Menu()),
              body: TabBarView(
                children: <Widget>[
                  Body(
                    model: model,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
