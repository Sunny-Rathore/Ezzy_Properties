import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> checkInternetAndMakeApiCall() async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.none) {
    const GetSnackBar(
      backgroundColor: Colors.red,
      title: 'No Internet',
    );
  } else {
    const GetSnackBar(
      backgroundColor: Colors.green,
      title: 'Internet connection is available',
    );
    // Internet connection is available, make API call
    // Call your API function here
  }
}

class ApiErrorHandler {
  static String handleDioException(DioException error) {
    String errorMessage = 'An error occurred';

    switch (error.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request was canceled';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Send timeout';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive timeout';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'An Unknown Error Occured';
        break;
      case DioExceptionType.badCertificate:
        errorMessage = 'Connection timeout';
        break;
      case DioExceptionType.badResponse:
        errorMessage = 'bad response';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'connection error';
        break;
      default: // Handle any unhandled cases
        errorMessage = 'Unhandled Dio error: ${error.type}';
        break;
    }

    return errorMessage;
  }
}

// Import your error handling class

// Future<void> fetchData() async {
//   final dio = Dio();

//   try {
//     final response = await dio.get('https://api.example.com/data');
//     // Process response
//   } catch (error) {
// if (error is DioError) {
//   final errorMessage = ApiErrorHandler.handleDioException(error);
//   // Handle or display errorMessage as needed
// } else {
//   // Handle other non-Dio errors
// }
//   }
// }
