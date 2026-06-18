// import 'package:lively_nightlife_nightclub_party/core/services/api_endpoints.dart';
// import 'package:lively_nightlife_nightclub_party/core/services/network_caller.dart';

// class ApiService {
//   //Login API Call
//   static Future login({required Map<String, dynamic> body}) async {
//     final response = await NetworkCaller.postRequest(
//       url: ApiEndpoints.login,
//       body: body,
//     );

//     return response.data;
//   }

//   //Signup API Call
//   static Future signup({required Map<String, dynamic> body}) async {
//     final response = await NetworkCaller.postRequest(
//       url: ApiEndpoints.signup,
//       body: body,
//     );

//     return response.data;
//   }

//   //OTP Verification API Call
//   static Future getOpt({required Map<String, dynamic> body}) async {
//     final response = await NetworkCaller.postRequest(
//       url: ApiEndpoints.getOtp,
//       body: body,
//     );

//     return response.data;
//   }

//   static Future verifyOtp({required Map<String, dynamic> body}) async {
//     final response = await NetworkCaller.postRequest(
//       url: ApiEndpoints.verifyOtp,
//       body: body,
//     );

//     return response.data;
//   }

//   //Get Providers API Call
//   static Future getProviders() async {
//     final response = await NetworkCaller.getRequest(
//       url: ApiEndpoints.getProviders,
//     );

//     return response.data;
//   }

//   //Get Genres API Call
//   static Future getGenres() async {
//     final response = await NetworkCaller.getRequest(
//       url: ApiEndpoints.getGenres,
//     );

//     return response.data;
//   }

//   //Get Friend Suggestions API Call
//   static Future getFriendSuggestions() async {
//     final response = await NetworkCaller.getRequest(
//       url: ApiEndpoints.getFriendSuggestions,
//     );

//     return response.data;
//   }

//   // Backward compatible alias.
//   static Future getFrienSuggestions() async {
//     return getFriendSuggestions();
//   }

//   //Get Following Friends API Call
//   static Future getFollowingFriends() async {
//     final response = await NetworkCaller.getRequest(
//       url: ApiEndpoints.getFollowingFriends,
//     );

//     return response.data;
//   }

//   //Get Tonight's Popn API Call
//   // Supported values for type: movie, tv
//   static Future getTonightsPopn({String? type}) async {
//     final queryParameters = <String, dynamic>{};

//     if (type != null && type.trim().isNotEmpty) {
//       queryParameters['type'] = '"${type.trim()}"';
//     }

//     final response = await NetworkCaller.getRequest(
//       url: ApiEndpoints.getHomeData,
//       queryParameters: queryParameters.isEmpty ? null : queryParameters,
//     );

//     return response.data;
//   }

//   //Get movies by genre API Call
//   static Future getMoviesByGenre() async {
//     final response = await NetworkCaller.getRequest(
//       url: ApiEndpoints.getHomeData,
//     );

//     return response.data;
//   }

//   //Get movies by preference API Call
//   static Future getPreferences() async {
//     final response = await NetworkCaller.getRequest(
//       url: ApiEndpoints.getHomeData,
//     );

//     return response.data;
//   }

//   //Get movies by preference API Call
//   static Future getPlatformMovies({int? platformId}) async {
//     final response = await NetworkCaller.getRequest(
//       url: ApiEndpoints.getHomeData,
//       queryParameters: platformId != null ? {'platform': platformId} : null,
//     );

//     return response.data;
//   }

//   // Get movie details by id
//   static Future getMovieDetails({required int id, String? type}) async {
//     final response = await NetworkCaller.getRequest(
//       url: '${ApiEndpoints.getMovieDetails}$id/',
//       queryParameters: type != null && type.trim().isNotEmpty
//           ? {'type': type.trim()}
//           : null,
//     );

//     return response.data;
//   }

//   // Search movies and shows
//   static Future searchMovies({required String query}) async {
//     final response = await NetworkCaller.getRequest(
//       url: ApiEndpoints.getMovieSearch,
//       queryParameters: {'keyword': query},
//     );

//     return response.data;
//   }

//   // Get feed posts
//   static Future getFeedPosts() async {
//     final response = await NetworkCaller.getRequest(
//       url: ApiEndpoints.getFeedPosts,
//     );

//     return response.data;
//   }

//   // Get post comments
//   static Future getPostComments({required String postId}) async {
//     final response = await NetworkCaller.getRequest(
//       url: '${ApiEndpoints.getPostComments}$postId/',
//     );

//     return response.data;
//   }

//   // Get notifications
//   static Future getNotifications() async {
//     final response = await NetworkCaller.getRequest(
//       url: ApiEndpoints.getNotifications,
//     );

//     return response.data;
//   }

//   // Mark notification as read
//   static Future markNotificationRead({required String notificationId}) async {
//     final response = await NetworkCaller.postRequest(
//       url: '${ApiEndpoints.readNotification}$notificationId/',
//       body: const {},
//     );

//     return response.data;
//   }

//   // Delete notification
//   static Future deleteNotification({required String notificationId}) async {
//     final response = await NetworkCaller.deleteRequest(
//       url: '${ApiEndpoints.getNotifications}$notificationId/',
//     );

//     return response.data;
//   }

//   // Reset password
//   static Future resetPassword({required Map<String, dynamic> body}) async {
//     final response = await NetworkCaller.postRequest(
//       url: ApiEndpoints.resetPassword,
//       body: body,
//     );

//     return response.data;
//   }

//   // Post movie review
//   static Future postMovieReview({required dynamic body}) async {
//     final response = await NetworkCaller.postRequest(
//       url: ApiEndpoints.postMovieReview,
//       body: body,
//     );

//     return response.data;
//   }

//   // Post rating like
//   static Future postRatingLike({required Map<String, dynamic> body}) async {
//     final response = await NetworkCaller.postRequest(
//       url: ApiEndpoints.postRatingLike,
//       body: body,
//     );

//     return response.data;
//   }

//   // Post rating comment
//   static Future postRatingComment({required Map<String, dynamic> body}) async {
//     final response = await NetworkCaller.postRequest(
//       url: ApiEndpoints.postRatingComment,
//       body: body,
//     );

//     return response.data;
//   }

//   // Get rating comments
//   static Future getRatingComments({required String ratingId}) async {
//     final response = await NetworkCaller.getRequest(
//       url: '${ApiEndpoints.getRatingComments}$ratingId/',
//     );

//     return response.data;
//   }

//   // Post feed like
//   static Future postFeedLike({required Map<String, dynamic> body}) async {
//     final response = await NetworkCaller.postRequest(
//       url: ApiEndpoints.postFeedLike,
//       body: body,
//     );

//     return response.data;
//   }

//   // Post feed comment
//   static Future postFeedComment({required Map<String, dynamic> body}) async {
//     final response = await NetworkCaller.postRequest(
//       url: ApiEndpoints.postFeedComment,
//       body: body,
//     );

//     return response.data;
//   }

//   // Add watchlist item
//   static Future addWatchlist({required Map<String, dynamic> body}) async {
//     final response = await NetworkCaller.postRequest(
//       url: ApiEndpoints.addWatchlist,
//       body: body,
//     );

//     return response.data;
//   }

//   // Remove watchlist item
//   static Future removeWatchlist({required Map<String, dynamic> body}) async {
//     final response = await NetworkCaller.postRequest(
//       url: ApiEndpoints.removeWatchlist,
//       body: body,
//     );

//     return response.data;
//   }

//   // Get watchlist items
//   static Future getWatchlist() async {
//     final response = await NetworkCaller.getRequest(
//       url: ApiEndpoints.getWatchlist,
//     );

//     return response.data;
//   }
// }
