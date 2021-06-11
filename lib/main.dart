import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie_bunny/providers/countries.dart';
import 'package:foodie_bunny/providers/phone_auth.dart';
import 'package:foodie_bunny/screens/auth_page.dart';
import 'package:provider/provider.dart';
// import 'package:foodie_bunny/screens/phone_auth_page.dart';
// import 'package:foodie_bunny/screens/verify_screen.dart';
//import 'package:foodie_bunny/screens/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CountryProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PhoneAuthDataProvider(),
          ),
        ],
        child: MaterialApp(
          title: "Foodie Sher",
          home: AuthPage(),
          theme: ThemeData(
            fontFamily: 'QuickSand',
            brightness: Brightness.dark,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.black //Color.fromRGBO(95, 62, 204, 1),
                ),
          ),
          debugShowCheckedModeBanner: false,
          // routes: {
          //   VerifyScreen.routeArgs: (ctx) => VerifyScreen(),
          //   HomePage.routeArgs: (ctx) => HomePage(),
          // },
        ));
  }
}
