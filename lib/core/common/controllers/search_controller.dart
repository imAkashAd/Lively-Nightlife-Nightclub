import 'package:get/get.dart';

class CustomSearchController extends GetxController {
  var searchQuery = ''.obs;
  var suggestions = <String>[].obs;
  var showSuggestions = false.obs;

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    showSuggestions.value = query.isNotEmpty;
  }

  void updateSuggestions(List<String> items) {
    suggestions.value = items;
  }

  void clearSearch() {
    searchQuery.value = '';
    suggestions.clear();
    showSuggestions.value = false;
  }

  void hideSuggestions() {
    showSuggestions.value = false;
  }
}
