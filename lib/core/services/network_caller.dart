// import 'package:dio/dio.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:lively_nightlife_nightclub_party/core/services/api_endpoints.dart';
// import 'package:lively_nightlife_nightclub_party/core/services/storage_service.dart';

// class NetworkCaller {
//   static final Dio dio = Dio(
//     BaseOptions(
//       baseUrl: ApiEndpoints.baseUrl,
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30),
//     ),
//   );

//   //Get Request Method
//   static Future<Response> getRequest({
//     required String url,

//     Map<String, dynamic>? headers,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final Map<String, dynamic> headersMap = {};
//       if (headers != null) headersMap.addAll(headers);
//       String? token;
//       final GetStorage storage = GetStorage();
//       token = storage.read<String>('access_token');
//       token ??= StorageService.getAccessToken();
//       if (token != null && token.isNotEmpty) {
//         headersMap['Authorization'] = 'Bearer $token';
//       }

//       Response response = await dio.get(
//         url,
//         options: Options(headers: headersMap),
//         queryParameters: queryParameters,
//       );
//       return response;
//     } on DioException catch (e) {
//       throw Exception(e.response?.data.toString() ?? e.message);
//     }
//   }

//   //Post Request Method
//   static Future<Response> postRequest({
//     required String url,
//     dynamic body,

//     Map<String, dynamic>? headers,
//   }) async {
//     try {
//       final Map<String, dynamic> headersMap = {};
//       if (headers != null) headersMap.addAll(headers);
//       String? token;
//       final GetStorage storage = GetStorage();
//       token = storage.read<String>('access_token');
//       token ??= StorageService.getAccessToken();
//       if (token != null && token.isNotEmpty) {
//         headersMap['Authorization'] = 'Bearer $token';
//       }

//       final isMultipart = body is FormData;
//       if (isMultipart) {
//         headersMap.remove('Content-Type');
//       }

//       Response response = await dio.post(
//         url,
//         data: body,
//         options: Options(
//           headers: headersMap,
//           contentType: isMultipart ? 'multipart/form-data' : 'application/json',
//         ),
//       );

//       return response;
//     } on DioException catch (e) {
//       throw Exception(e.response?.data.toString() ?? e.message);
//     }
//   }

//   //Put Request Method
//   static Future<Response> putRequest({
//     required String url,
//     dynamic body,
//     Map<String, dynamic>? headers,
//   }) async {
//     try {
//       final Map<String, dynamic> headersMap = {};
//       if (headers != null) headersMap.addAll(headers);
//       String? token;
//       final GetStorage storage = GetStorage();
//       token = storage.read<String>('access_token');
//       token ??= StorageService.getAccessToken();
//       if (token != null && token.isNotEmpty) {
//         headersMap['Authorization'] = 'Bearer $token';
//       }

//       Response response = await dio.put(
//         url,
//         data: body,
//         options: Options(headers: headersMap),
//       );
//       return response;
//     } on DioException catch (e) {
//       throw Exception(e.response?.data.toString() ?? e.message);
//     }
//   }

//   //Patch Request Method
//   static Future<Response> patchRequest({
//     required String url,
//     dynamic body,
//     Map<String, dynamic>? headers,
//   }) async {
//     try {
//       final Map<String, dynamic> headersMap = {};
//       if (headers != null) headersMap.addAll(headers);
//       String? token;
//       final GetStorage storage = GetStorage();
//       token = storage.read<String>('access_token');
//       token ??= StorageService.getAccessToken();
//       if (token != null && token.isNotEmpty) {
//         headersMap['Authorization'] = 'Bearer $token';
//       }

//       Response response = await dio.patch(
//         url,
//         data: body,
//         options: Options(headers: headersMap),
//       );

//       return response;
//     } on DioException catch (e) {
//       throw Exception(e.response?.data.toString() ?? e.message);
//     }
//   }

//   //Delete Request Method
//   static Future<Response> deleteRequest({
//     required String url,
//     dynamic body,
//     Map<String, dynamic>? headers,
//   }) async {
//     try {
//       final Map<String, dynamic> headersMap = {};
//       if (headers != null) headersMap.addAll(headers);
//       String? token;
//       final GetStorage storage = GetStorage();
//       token = storage.read<String>('access_token');
//       token ??= StorageService.getAccessToken();
//       if (token != null && token.isNotEmpty) {
//         headersMap['Authorization'] = 'Bearer $token';
//       }

//       Response response = await dio.delete(
//         url,
//         data: body,
//         options: Options(headers: headersMap),
//       );
//       return response;
//     } on DioException catch (e) {
//       throw Exception(e.response?.data.toString() ?? e.message);
//     }
//   }
// }
