import 'package:flutter/material.dart';
import 'package:foodie_bunny/providers/authentication.dart';
import 'package:foodie_bunny/screens/auth/get_phone.dart';

import 'package:provider/provider.dart';
import 'package:slider_button/slider_button.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Card(
                color: Colors.orange,
                elevation: 8,
                //color: Colors.orange.withOpacity(0.50),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(60))), //50
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: CircleAvatar(
                      backgroundColor: Colors.orange, //.withOpacity(0.65),
                      radius: 130,
                      child: ClipRRect(
                        // borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/images/lion_food.png',
                          height: 260,
                          width: 260,
                        ),
                      )),
                ),
                // Container(
                //   padding: const EdgeInsets.all(0.0),
                //   height: 320, //320 both
                //   width: 320,
                //   child: Padding(
                //     padding: const EdgeInsets.all(0.0),
                //     child: Image.asset(
                //       'assets/images/lion.png',
                //       height: 170,
                //       width: 170,
                //       //fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 18.0),
            //   child: Text('Welcome!',
            //       style: Theme.of(context).accentTextTheme.headline1),
            // ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, bottom: 8),
                  child: Text('Hello!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'QuickSand',
                        color: Colors.orange,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, bottom: 32),
                  child: Text('Find Your Food Destination',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'QuickSand',
                        color: Colors.orange,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26.0),
                    //side: BorderSide(width: 2, color: Colors.white),
                  ),
                  onTap: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.login();
                  },
                  child: Card(
                    elevation: 8,
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.0),
                      //side: BorderSide(width: 2, color: Colors.white),
                    ),
                    child: SliderButton(
                      radius: 36,
                      buttonSize: 51,

                      height: 52,
                      backgroundColor: Colors.orange,
                      vibrationFlag: true,
                      //shimmer: false,
                      action: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.login();
                        //Navigator.of(context).pop();
                      },

                      label: Text(
                        "Sign in with Google",
                        style: TextStyle(
                            fontFamily: 'QuickSand',
                            color: Colors.grey[850], //Color(0xff4a4a4a),
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      // icon: Container( child: AssetImage(
                      //           'assets/images/google.png',
                      //         ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: CircleAvatar(
                            backgroundColor:
                                Colors.white, //Colors.orange.withOpacity(0.65),
                            radius: 23,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/images/google.png',
                                height: 35,
                                width: 35,
                              ),
                            )),
                      ),

                      // Text(
                      //   "x",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.w400,
                      //     fontSize: 44,
                      //   ),
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26.0),
                    //side: BorderSide(width: 2, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhoneAuthGetPhone()));
                  },
                  child: Card(
                    elevation: 8,
                    color: Colors.orange.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.0),
                      //side: BorderSide(width: 2, color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.75),
                      child: SliderButton(
                        baseColor: Colors.white, //.withOpacity(0.50),
                        highlightedColor: Colors.black,
                        radius: 36,
                        buttonSize: 49, //51
                        height: 50, //52
                        backgroundColor: Colors.grey[850],
                        vibrationFlag: true,
                        //shimmer: false,
                        action: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhoneAuthGetPhone()));
                          //Navigator.of(context).pop();
                        },

                        // buttonColor: Colors.white,
                        label: Text(
                          "Sign in with number",
                          style: TextStyle(
                              fontFamily: 'QuickSand',
                              color: Colors.white,
                              //color: Colors.grey[850], //Color(0xff4a4a4a),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        // icon: Text(
                        //   '#',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 44,
                        //   ),
                        // )
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.0), //3
                          child: CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors
                                  .white, //Colors.orange.withOpacity(0.65),
                              child: Icon(Icons.phone,
                                  color: Colors.orange[900] //Colors.grey[850],
                                  //size: 26,
                                  )
                              // Text(
                              //   '#',
                              //   style: TextStyle(
                              //     color: Colors.grey[850],
                              //     fontWeight: FontWeight.w400,
                              //     fontSize: 30,
                              //   ),
                              // ),
                              ),
                        ),
                        // child: Padding(
                        //   padding: const EdgeInsets.only(left: 3.0),
                        //   child: CircleAvatar(
                        //       backgroundColor:
                        //           Colors.white, //Colors.orange.withOpacity(0.65),
                        //       radius: 24,
                        //       child: ClipRRect(
                        //         borderRadius: BorderRadius.circular(30),
                        //         child: Image.asset(
                        //           'assets/images/google.png',
                        //           height: 36,
                        //           width: 36,
                        //         ),
                        //       )),
                        // ),

                        // Text(
                        //   "x",
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 44,
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                )

                // Card(
                //   elevation: 4,
                //   color: Colors.orange,
                //   //color: Theme.of(context).primaryColor,
                //   // onPressed: () {
                //   //   final provider = Provider.of<GoogleSignInProvider>(context,
                //   //       listen: false);
                //   //   provider.login();
                //   // },
                //   child: InkWell(
                //     customBorder: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(24.0),
                //       //side: BorderSide(width: 2, color: Colors.white),
                //     ),
                //     onTap: () {
                //       final provider = Provider.of<GoogleSignInProvider>(
                //           context,
                //           listen: false);
                //       provider.login();
                //     },
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 12.0, vertical: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           Container(
                //             height: 30.0,
                //             width: 30.0,
                //             decoration: BoxDecoration(
                //               color: Colors.white,
                //               image: DecorationImage(
                //                   image: AssetImage(
                //                     'assets/images/google.png',
                //                   ),
                //                   fit: BoxFit.cover),
                //               borderRadius: BorderRadius.circular(30.0),
                //             ),
                //           ),
                //           // CircleAvatar(

                //           //   radius: 20,
                //           //   backgroundColor: Colors.transparent,
                //           //   backgroundImage: AssetImage(
                //           //     'assets/images/google.png',
                //           //   ),
                //           //   // child: ClipRRect(
                //           //   //   borderRadius: BorderRadius.circular(30),
                //           //   //   child: Image.asset(
                //           //   //     'assets/images/google.png',
                //           //   //     height: 80,
                //           //   //     width: 80,
                //           //   //     //fit: BoxFit.cover,
                //           //   //   ),
                //           //   // ),
                //           // ),
                //           // Padding(
                //           //   padding: const EdgeInsets.symmetric(
                //           //     horizontal: 4.0,
                //           //   ),
                //           //   child: Icon(Icons.login_outlined),
                //           // ),
                //           Padding(
                //             padding: const EdgeInsets.only(right: 8.0, left: 8),
                //             child: Text(
                //               'Sign in with Google',
                //               style: TextStyle(
                //                   fontSize: 16,
                //                   color: Colors.grey[850],
                //                   fontFamily: 'QuickSand',
                //                   fontWeight: FontWeight.w600),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                //   // label: Padding(
                //   //   padding: const EdgeInsets.only(right: 4.0),
                //   //   child: Text(
                //   //     'Sign in with Google',
                //   //     style: TextStyle(fontSize: 16),
                //   //   ),
                //   // ),
                //   // icon: Padding(
                //   //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
                //   //   child: Icon(Icons.login_outlined),
                //   // ),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(30.0),
                //     //side: BorderSide(width: 2, color: Colors.white),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
