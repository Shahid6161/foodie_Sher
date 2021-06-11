import 'package:flutter/material.dart';
import 'package:foodie_bunny/api/firebase_api.dart';
import 'dart:ui';
import 'package:foodie_bunny/widgets/foodie_bunny_map.dart';
import 'package:foodie_bunny/widgets/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
 // static const routeArgs = '/home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FoodieBunnyMap(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
            top: 7, bottom: 0, right: 14, left: 14), //top = 14 before todo

        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Card(
              //elevation: 2,
              //margin: const EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              color: Colors.grey.withOpacity(0.21),
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                    ),
                    Text(
                      'Foodie Sher',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'QuickSand',
                          fontSize: 20,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                    FirebaseApi.getUserphoto() != null
                        ? InkWell(
                            customBorder: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40))),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Profile());
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 0.0, top: 0),
                              child: CircleAvatar(
                                  backgroundColor:
                                      Colors.orange.withOpacity(0.65),
                                  radius: 18,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                      FirebaseApi.getUserphoto(),
                                      height: 30,
                                      width: 30,
                                    ),
                                  )),
                            ),
                          )
                        : IconButton(
                            iconSize: 30,
                            splashRadius: 24,
                            constraints:
                                BoxConstraints(minWidth: 24, minHeight: 24),
                            padding: EdgeInsets.all(2),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Profile());
                            },
                            icon: Icon(
                              Icons.account_circle_rounded,
                              // size: 30,
                            ),
                            color: Colors.orange,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
