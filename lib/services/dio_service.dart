// import 'package:dio/dio.dart';

// class DioService {
//   final Dio _dio;

//   DioService() : _dio = Dio();

//   Future<Response> get(String url) async {
//     try {
//       final response = await _dio.get(url);
//       return response;
//     } catch (error) {
//       throw _handleError(error);
//     }
//   }

//   // Add more methods for other types of requests (POST, PUT, etc.)

//   Exception _handleError(dynamic error) {
//     if (error is DioError) {
//       if (error.response != null) {
//         // Handle HTTP error
//         return DioException(
//           message: 'Request failed with status: ${error.response?.statusCode}',
//           statusCode: error.response!.statusCode,
//         );
//       } else {
//         // Handle connection error
//         return DioException(message: 'Connection failed');
//       }
//     } else {
//       // Handle Dio errors that are not related to HTTP requests
//       return DioException(message: 'An error occurred');
//     }
//   }
// }

// class DioException implements Exception {
//   final String message;
//   final int? statusCode;

//   DioException({required this.message, this.statusCode});
// }
// final dioService = DioService();

// try {
//   final response = await dioService.get('https://api.example.com/data');
//   // Process the successful response
// } catch (error) {
//   if (error is DioException) {
//     // Handle DioException
//     print('Error message: ${error.message}');
//     if (error.statusCode != null) {
//       print('Status code: ${error.statusCode}');
//     }
//   }
// }
