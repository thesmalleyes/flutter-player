import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String emptyDescription;
  final String emptyInstruction;
  const EmptyWidget(
      {super.key,
      required this.emptyDescription,
      required this.emptyInstruction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.search),
          const SizedBox(
            height: 16,
          ),
          Text(
            emptyDescription,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w600),
          ),
          Text(
            emptyInstruction,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
