import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:phonepe_gateway/model/phonepe_config.dart';
import 'package:phonepe_gateway/model/phonepe_params_upi.dart';
import 'package:phonepe_gateway/phonepe_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PayUI(),
    );
  }
}

class PayUI extends StatefulWidget {
  const PayUI({super.key});

  @override
  State<PayUI> createState() => _PayUIState();
}

class _PayUIState extends State<PayUI> {
  // final _phonepeGatewayPlugin = PhonepeGateway();
  @override
  void initState() {
    PhonpePaymentGateway.instance.init(
        config: PhonePeConfig(
            redirectUrl:
                "https://tropical-certain-lancer.glitch.me/payment/complete",
            baseUrl: "https://tropical-certain-lancer.glitch.me/payment",
            appName: "PhonePe Test App",
            callBackUrl:
                "https://tropical-certain-lancer.glitch.me/payment/callback",
            merchanId: "MERCHANTUAT",
            saltIndex: 1,
            saltKey: "a6334ff7-da0e-4d51-a9ce-76b97d518b1e"));
    PhonpePaymentGateway.instance.handlerCancelled(
      (value) {
        debugPrint("Cancelled :${jsonEncode(value.toJson())}");
      },
    );
    PhonpePaymentGateway.instance.handlerFailed(
      (value) {
        debugPrint("Failed :${jsonEncode(value.toJson())}");
      },
    );

    PhonpePaymentGateway.instance.handlerSuccess(
      (value) {
        debugPrint("Success :${jsonEncode(value.toJson())}");
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            PhonpePaymentGateway.instance.initPayment(context,
                params: ParamsPayment(
                    amount: 1,
                    merchantTransactionId:
                        DateTime.now().millisecondsSinceEpoch.toString(),
                    merchantUserId: "1234567890",
                    mobileNumber: "1234567890",
                    notes: {
                      "uid": "1234567890",
                      "name": "Test User",
                      "email": "example#example.com"
                    }));
          },
          child: const Icon(Icons.add),
        ));
  }
} 




// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:property_app/pages/splash.dart';

// import 'Utils/color_utils.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final controllerr = Get.put(LocalizationController());
//     return ScreenUtilInit(
//         designSize: const Size(360, 800),
//         minTextAdapt: true,
//         splitScreenMode: false,
//         builder: (context, child) {
//           return GetMaterialApp(
//             // localizationsDelegates: const [
//             //   GlobalMaterialLocalizations.delegate,
//             //   GlobalWidgetsLocalizations.delegate,
//             //   GlobalCupertinoLocalizations.delegate
//             // ],
//             // supportedLocales: const [
//             //   Locale('en', ''),
//             //   Locale('hi', ''),
//             // ],
//             debugShowCheckedModeBanner: false,
//             title: 'property_app',
//             theme: ThemeData(
//               appBarTheme: AppBarTheme(backgroundColor: secondary_color),
//               scaffoldBackgroundColor: white_color,
//               textTheme: GoogleFonts.poppinsTextTheme(),
//               primarySwatch: Colors.blueGrey,
//             ),
//             // locale: Locale(controllerr.locale.value),
//             // fallbackLocale: const Locale('en', 'US'),
//             // translations: Languages(),
//             home: child,
//           );
//         },
//         child: const Splash());
//   }
// }