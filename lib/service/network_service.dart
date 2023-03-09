// import 'package:flutter/cupertino.dart';
// import '../network/api.dart';
// import 'log_service.dart';
//
// class EmployeeServices {
//
//   static Future<String?> getEmployees(BuildContext context) async {
//     try {
//       Uri uri = Uri.http(Urls.BASE_URL, Urls.API_LIST );
//       var response = await get(uri);
//
//       Log.w(response.body);
//       if(response.statusCode == 200 || response.statusCode == 201){
//         Log.e(response.statusCode.toString());
//         return response.body.toString();
//       }
//       if(response.statusCode == 429){
//         return 'Too many requests';
//       }
//
//     } catch (e) {
//       Log.e(e.toString());
//     }
//     return null;
//   }
//
//   static Future<String?> apiOneEmployee(int id) async {
//     try {
//       Uri uri = Uri.http(Urls.BASE_URL, Urls.API_ONE_ELEMENT + id.toString());
//       var response = await get(uri);
//
//       Log.w(response.statusCode.toString());
//       if(response.statusCode == 200 || response.statusCode == 201){
//         Log.i(response.body);
//         return response.body.toString();
//       }
//       if(response.statusCode == 429){
//         return 'Too many requests';
//       }
//
//     } catch (e) {
//       Log.e(e.toString());
//     }
//   }
//
//   static Future<void> createEmployee(String name, int salary, int age) async {
//     try {
//       Uri uri = Uri.http(Urls.BASE_URL, Urls.API_CREATE);
//       var response = await post(
//         uri,
//         body: {
//           "name": name,
//           "salary": salary.toString(),
//           "age": age.toString()
//         },
//       );
//       Log.w(response.statusCode.toString());
//       Log.i(response.body);
//     } catch (e) {
//       Log.e(e.toString());
//     }
//   }
//
//   static Future<void> uptadeEmployee(String name, int salary, int age, int id) async {
//     try {
//       Uri uri = Uri.http(Urls.BASE_URL, Urls.API_UPDATE + id.toString());
//       var response = await put(
//         uri,
//         body: {
//           "name": name,
//           "salary": salary.toString(),
//           "age": age.toString()
//         }
//       );
//       Log.w(response.statusCode.toString());
//       Log.i(response.body);
//     } catch (e) {
//       Log.e(e.toString());
//     }
//   }
//
//   static Future<void> deleteEmployee(int id) async {
//     try {
//       Uri uri = Uri.http(Urls.BASE_URL, Urls.API_DELETE + id.toString());
//       var response = await delete(uri);
//       Log.w(response.statusCode.toString());
//       Log.i(response.body);
//     } catch (e) {
//       Log.e(e.toString());
//     }
//   }
//
// }