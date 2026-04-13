import 'package:flutter/material.dart';
import 'package:velotoulouse/ui/screens/map/widgets/search_container.dart';
import 'package:velotoulouse/ui/themes/theme.dart';

class SearchTextField extends StatelessWidget {
  final String query;
  final Function(String) onChanged;
  final VoidCallback onClear;

  const SearchTextField({
    super.key,
    required this.query,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return SearchContainer(
      child: TextField(
        onChanged: onChanged,
        style: AppText.body.copyWith(color: AppColors.grey900),

        decoration: InputDecoration(
          hintText: "Search stations...",
          hintStyle: AppText.body.copyWith(color: AppColors.grey500),

          prefixIcon: Icon(Icons.search, color: AppColors.grey500),

          suffixIcon: query.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.close, color: AppColors.grey500),
                  onPressed: onClear,
                )
              : null,

          border: OutlineInputBorder(
            borderRadius: AppRadius.mdR,
            borderSide: BorderSide.none,
          ),

          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 12,
          ),
        ),
      ),
    );
  }
}
