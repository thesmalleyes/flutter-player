import 'package:flutter/material.dart';

class ErrorScreenWidget extends StatelessWidget {
  final String errorMessage;
  final String errorInstruction;
  const ErrorScreenWidget(
      {super.key, required this.errorMessage, required this.errorInstruction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            errorMessage,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w600),
          ),
          Text(
            errorInstruction,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
