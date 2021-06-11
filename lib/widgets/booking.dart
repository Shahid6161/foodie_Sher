//import 'package:cookies_app/Ui/home.dart';
//import 'package:cookies_app/View_Model/cart_view_model.dart';
//import 'package:cookies_app/base/base_view.dart';
//import 'package:cookies_app/bottom_bar.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_yl95bSCVgr1ql2',
      'amount': 10000,
      'name': 'Shahid',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIos: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIos: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }

  @override
  Widget build(BuildContext context) {
    // return BaseView<CartViewModel>(
    //     onModelReady: (model) {},
    //     builder: (context, model, build) {
    return Dialog(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      //   title: Text('Cart',
      //       style: TextStyle(fontSize: 20.0, color: Color(0xFF545D68))),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.notifications_none, color: Color(0xFFF17532)),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(
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
                  top: 20.0, bottom: 20.0, left: 26.0, right: 26.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                // SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Book your table',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontFamily: "QuickSand"),
                      ), //Color(0xFFF17532))),
                      SizedBox(height: 10.0),
                      Text('*Additional Reservation Charges',
                          style: TextStyle(
                              fontFamily: "QuickSand",
                              color: Colors.orange, //Color(0xFF575E67),
                              fontSize: 12.0)),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                InkWell(
                    onTap: () {
                      openCheckout();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Container(
                          width: MediaQuery.of(context).size.width - 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.orange), //Color(0xFFF17532)),
                          child: Center(
                              child: Text('Confirm the Booking',
                                  style: TextStyle(
                                      fontFamily: 'QuickSand',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[850])))),
                    ))
              ]),
            ),
          ),
        ),
      ),
    );
  }
  // );
}
//}
