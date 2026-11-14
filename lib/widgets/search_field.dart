import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, this.hint = 'Search'});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.search_rounded),
        contentPadding: const EdgeInsets.symmetric(vertical: 11),
      ),
    );
  }
}
