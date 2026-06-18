import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/core/common/controllers/search_controller.dart';
import 'package:lively_nightlife_nightclub_party/core/common/widgets/custom_search_bar.dart';

class SearchBarWithSuggestions extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final Function(String) onSearch;
  final String? prefixIcon;
  final Color? iconColor;
  final Color? fillColor;
  final double? boxtHeight;
  final double? fontSize;
  final bool showBorder;

  const SearchBarWithSuggestions({
    super.key,
    required this.hintText,
    required this.items,
    required this.onSearch,
    this.prefixIcon,
    this.iconColor,
    this.fillColor,
    this.boxtHeight,
    this.fontSize,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = Get.put(CustomSearchController());
    final textController = TextEditingController();

    List<String> filterSuggestions(String query) {
      if (query.isEmpty) return [];
      return items
          .where((item) => item.toLowerCase().startsWith(query.toLowerCase()))
          .take(5)
          .toList();
    }

    return Obx(() {
      return CustomSearchBar(
        hintText: hintText,
        controller: textController,
        prefixIcon: prefixIcon,
        iconColor: iconColor,
        fillColor: fillColor,
        boxtHeight: boxtHeight,
        fontSize: fontSize,
        showBorder: showBorder,
        onChanged: (value) {
          searchController.updateSearchQuery(value);
          final suggestions = filterSuggestions(value);
          searchController.updateSuggestions(suggestions);
        },
        onSubmitted: (value) {
          onSearch(value);
          searchController.hideSuggestions();
        },
        suggestions: searchController.suggestions,
        showSuggestions: searchController.showSuggestions.value,
        onSuggestionTap: (suggestion) {
          textController.text = suggestion;
          searchController.clearSearch();
          onSearch(suggestion);
        },
      );
    });
  }
}
