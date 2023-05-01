import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final Function() search;
  final String hint;
  final TextEditingController textController;

  const SearchWidget(
      {super.key,
      required this.search,
      required this.hint,
      required this.textController});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: TextField(
        autofocus: true,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          search();
        },
        controller: textController,
        maxLines: 1,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.grey[100],
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              ),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            // focusedBorder: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            hintMaxLines: 1),
        // onChanged: search
      ),
    );
  }
}
