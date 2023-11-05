// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_app/pages/splash.dart';

import 'Utils/color_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controllerr = Get.put(LocalizationController());
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return GetMaterialApp(
            // localizationsDelegates: const [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate
            // ],
            // supportedLocales: const [
            //   Locale('en', ''),
            //   Locale('hi', ''),
            // ],
            debugShowCheckedModeBanner: false,
            title: 'property_app',
            theme: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: secondary_color),
              scaffoldBackgroundColor: white_color,
              textTheme: GoogleFonts.poppinsTextTheme(),
              primarySwatch: Colors.blueGrey,
            ),
            // locale: Locale(controllerr.locale.value),
            // fallbackLocale: const Locale('en', 'US'),
            // translations: Languages(),
            home: child,
          );
        },
        child: const Splash());
  }
}





// import 'dart:io';
// import 'dart:math';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:phone_pe_pg/phone_pe_pg.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     // We also handle the message potentially returning null.

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//   }

//   PhonePePg pePg = PhonePePg(
//       isUAT: false,
//       saltKey: "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399",
//       prodUrl: 'https://webhook.site/callback-url',
//       saltIndex: "1");

//   PaymentRequest _paymentRequest({String? merchantCallBackScheme}) {
//     String generateRandomString(int len) {
//       const chars =
//           'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
//       Random rnd = Random();
//       var s = String.fromCharCodes(Iterable.generate(
//           len, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
//       return s;
//     }

//     PaymentRequest paymentRequest = PaymentRequest(
//       amount: 100,
//       // callbackUrl: "https://tropical-certain-lancer.glitch.me/payment/callback",
//       deviceContext: DeviceContext.getDefaultDeviceContext(
//           merchantCallBackScheme: merchantCallBackScheme),
//       merchantId: "PGTESTPAYUAT",
//       merchantTransactionId: generateRandomString(10).toUpperCase(),
//       merchantUserId: generateRandomString(8).toUpperCase(),
//       mobileNumber: "7879152488",
//     );
//     return paymentRequest;
//   }

//   PaymentRequest upipaymentRequest(UpiAppInfo e,
//           {String? merchantCallBackScheme}) =>
//       _paymentRequest(merchantCallBackScheme: merchantCallBackScheme).copyWith(
//           paymentInstrument: UpiIntentPaymentInstrument(
//         targetApp: Platform.isAndroid ? e.packageName! : e.iOSAppName!,
//       ));

//   PaymentRequest paypageRequestModel({String? merchantCallBackScheme}) =>
//       _paymentRequest(merchantCallBackScheme: merchantCallBackScheme).copyWith(
//           redirectUrl: "",
//           redirectMode: 'GET',
//           paymentInstrument: PayPagePaymentInstrument());

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Plugin example app'),
//           ),
//           body: FutureBuilder<List<UpiAppInfo>?>(
//             future: PhonePePg.getUpiApps(iOSUpiApps: [
//               UpiAppInfo(
//                 appName: "PhonePe",
//                 packageName: "ppe",
//                 appIcon: Uint8List(0),
//                 iOSAppName: "PHONEPE",
//                 iOSAppScheme: 'ppe',
//               ),
//               UpiAppInfo(
//                 appName: "Google Pay",
//                 packageName: "gpay",
//                 appIcon: Uint8List(0),
//                 iOSAppName: "GPAY",
//                 iOSAppScheme: 'gpay',
//               ),
//               UpiAppInfo(
//                 appName: "Paytm",
//                 packageName: "paytmmp",
//                 appIcon: Uint8List(0),
//                 iOSAppName: "PAYTM",
//                 iOSAppScheme: 'paytmmp',
//               ),
//               UpiAppInfo(
//                   appName: "PhonePe Simulator",
//                   packageName: "ppemerchantsdkv1",
//                   appIcon: Uint8List(0),
//                   iOSAppScheme: 'ppemerchantsdkv1',
//                   iOSAppName: "PHONEPE"),
//               UpiAppInfo(
//                 appName: "PhonePe Simulator",
//                 packageName: "ppemerchantsdkv2",
//                 appIcon: Uint8List(0),
//                 iOSAppScheme: 'ppemerchantsdkv2',
//                 iOSAppName: "PHONEPE",
//               ),
//               UpiAppInfo(
//                 appName: "PhonePe Simulator",
//                 packageName: "ppemerchantsdkv3",
//                 iOSAppScheme: 'ppemerchantsdkv3',
//                 appIcon: Uint8List(0),
//                 iOSAppName: "PHONEPE",
//               ),
//             ]),
//             builder: (context, snapshot) {
//               if (snapshot.hasData && snapshot.data != null) {
//                 return ListView(children: [
//                   ...snapshot.data!
//                       .map(
//                         (e) => ListTile(
//                           onTap: () async {
//                             pePg
//                                 .startUpiTransaction(
//                                     paymentRequest: upipaymentRequest(e))
//                                 .then((response) {
//                               if (response.status == UpiPaymentStatus.success) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content:
//                                             Text("Transaction Successful")));
//                               } else if (response.status ==
//                                   UpiPaymentStatus.pending) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content: Text("Transaction Pending")));
//                               } else if (response.status ==
//                                   UpiPaymentStatus.failure) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content: Text("Transaction Failed")));
//                               } else {
//                                 print('response');
//                                 print(response.status);
//                               }
//                             }).catchError((e) {
//                               print('erorr');
//                               print(e.toString());
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                       content: Text("Transaction ERORR")));
//                             });
//                           },
//                           leading: Image.memory(
//                             e.appIcon,
//                             errorBuilder: (context, error, stackTrace) {
//                               return const Icon(Icons.error);
//                             },
//                           ),
//                           title: Text(e.appName),
//                           subtitle: Text(e.packageName ?? e.iOSAppName!),
//                         ),
//                       )
//                       .toList(),
//                   ListTile(
//                     title: const Text("Card/Net Banking"),
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (_) => pePg.startPayPageTransaction(
//                                     onPaymentComplete:
//                                         (paymentResponse, paymentError) {
//                                       Navigator.pop(context);
//                                       if (paymentResponse != null &&
//                                           paymentResponse.code ==
//                                               PaymentStatus.success) {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(const SnackBar(
//                                                 content: Text(
//                                                     "Transaction Successful")));
//                                       } else {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(const SnackBar(
//                                                 content: Text(
//                                                     "Transaction Failed")));
//                                       }
//                                     },
//                                     paymentRequest: paypageRequestModel(),
//                                   )));
//                     },
//                   )
//                 ]);
//               }
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             },
//           )),
//     );
//   }
// }


