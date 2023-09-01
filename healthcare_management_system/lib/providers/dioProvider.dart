// import 'dart:convert';
// import 'package:dio/dio.dart';

// class DioProvider {
//   Future<dynamic> getToken(String email, String password) async {
//     try {
//       var response = await Dio().post('http://127.0.0.1:8000/api/login',
//           data: {'email': email, 'password': password});

//       if (response.statusCode == 200 && response.data != '') {
//         return response.data;
//       }
//     } catch (error) {
//       return error;
//     }
//   }

//   Future<dynamic> getUser(String token) async {
//     try {
//       var user = await Dio().post('http://127.0.0.1:8000/api/user',
//         options: Options(headers: {'Authorization': 'Bearer $token'}));

//       if (user.statusCode == 200 && user.data != '') {
//         return json.encode(user.data);
//       }
//     } catch (error) {
//       return error;
//     }
//   }
// }
