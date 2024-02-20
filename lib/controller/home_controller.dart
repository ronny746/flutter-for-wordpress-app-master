// import 'dart:convert';
// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:the_india_insights/common/constants.dart';
// import 'package:the_india_insights/models/article.dart';

// import '../pages/single_article.dart'; // Assuming you have an Article model

// class HomeController extends GetxController {
//   var latestArticles = <dynamic>[].obs;
//   var featuredArticles = <dynamic>[].obs;
//   var latestArticleslocal = <dynamic>[].obs;
//   var infiniteStop = false.obs;
//   var page = 1;

//   @override
//   void onInit() {
//     super.onInit();
//     loadListData('page');
//     fetchLatestArticles(1);
//     fetchFeaturedArticles(1);
//   }

//   Future<void> saveData(String key, String value) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString(key, value);
//   }

//   Future<List<dynamic>?> loadListData(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     String? jsonString = prefs.getString(key);

//     if (jsonString != null) {
//       List<dynamic> decodedList = jsonDecode(jsonString);
//       latestArticleslocal.assignAll(decodedList);
//       return decodedList;
//     }

//     return null;
//   }

//   Future<List<dynamic>> fetchLatestArticles(int page) async {
//     try {
//       var response = await http.get(Uri.parse(
//           '$WORDPRESS_URL/wp-json/wp/v2/posts/?page=$page&per_page=10&_fields=id,date,title,content,custom,link'));

//       if (response.statusCode == 200) {
//         saveData('page', response.body);
//         latestArticles.addAll(json
//             .decode(response.body)
//             .map((m) => Article.fromJson(m))
//             .toList());

//         if (latestArticles.length % 10 != 0) {
//           infiniteStop.value = true;
//         }
//         return latestArticles;
//       } else {
//         infiniteStop.value = true;
//       }
//     } on SocketException {
//       throw 'No Internet connection';
//     }
//     return latestArticles;
//   }

//   Future<List<dynamic>> fetchFeaturedArticles(int page) async {
//     try {
//       var response = await http.get(Uri.parse(
//           "$WORDPRESS_URL/wp-json/wp/v2/posts/?categories[]=$FEATURED_ID&page=$page&per_page=10&_fields=id,date,title,content,custom,link"));

//       if (response.statusCode == 200) {
//         featuredArticles.addAll(json
//             .decode(response.body)
//             .map((m) => Article.fromJson(m))
//             .toList());
//         return featuredArticles;
//       } else {
//         infiniteStop.value = true;
//       }
//     } on SocketException {
//       throw 'No Internet connection';
//     }
//     return featuredArticles;
//   }

//   void navigateToSingleArticle(dynamic item) {
//     final heroId = item.id.toString() + "-latest";
//     Get.to(() => SingleArticle(Article.fromJson(item), heroId));
//   }

  
// }
