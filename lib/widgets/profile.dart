import 'package:flutter/material.dart';
import 'package:foodie_bunny/api/auth.dart';
import 'dart:ui';

import 'package:foodie_bunny/api/firebase_api.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(
            // height: 180,
            //width: 300,
            decoration: BoxDecoration(
                // border: Border.all(
                //     width: 0.5,
                //     color: Theme.of(context).buttonColor),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: Colors.grey.withOpacity(0.21),
                // Theme.of(context).scaffoldBackgroundColor.withOpacity(0.45),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: const Offset(-1.5, -1.5),
                    color: Colors.black.withOpacity(0.08),
                    spreadRadius: 1.8,
                    blurRadius: 4,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 26.0, right: 26.0), //14
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                // mainAxisAlignment:
                //     MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0, top: 2),
                    child: FirebaseApi.getUserphoto() == null
                        ? Icon(
                            // iconSize: 30,
                            // splashRadius: 24,
                            // constraints:
                            //     BoxConstraints(minWidth: 24, minHeight: 24),
                            // padding: EdgeInsets.all(2),
                            // onPressed: () {
                            //   // showDialog(
                            //   //     context: context,
                            //   //     builder: (context) => Profile());
                            // },

                            Icons.account_circle_rounded,
                            size: 36,

                            color: Colors.orange,
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.orange.withOpacity(0.65),
                            radius: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                FirebaseApi.getUserphoto(),
                                height: 54.5,
                                width: 54.5,
                              ),
                            )),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    FirebaseApi.getUsername() == null
                        ? "User"
                        : FirebaseApi.getUsername(),
                    style: TextStyle(
                        fontFamily: 'QuickSand',
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    FirebaseApi.getUseremail() == null
                        ? FirebaseApi.getUsernumber()
                        : FirebaseApi.getUseremail(),
                    // "Ratings: " +
                    //     (result.rating
                    //             ?.toString() ??
                    //         "Not Rated"),
                    style: TextStyle(
                        fontFamily: 'QuickSand',
                        fontSize: 14,
                        color: Colors.orange,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            // side: BorderSide(
                            //     color:
                            //         Colors.red)
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange)),
                      onPressed: () {
                        Navigator.of(context).pop();
                        FirebaseApi.logout();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          " Log out ",
                          style: TextStyle(
                              fontFamily: 'QuickSand',
                              fontSize: 16.5,
                              color: Colors.grey[850]),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
