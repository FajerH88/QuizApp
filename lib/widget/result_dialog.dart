import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final VoidCallback onRestart;

  const ResultDialog({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('انتهى الاختبار'),
      content: Text(
        'درجتك: $score من $totalQuestions',
        style: const TextStyle(fontSize: 20),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onRestart();
          },
          child: const Text(
            'إعادة الاختبار',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}