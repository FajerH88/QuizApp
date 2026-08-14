import 'package:flutter/material.dart';
import '../models/question_model.dart';

class QuizProgressHeader extends StatefulWidget {
  const QuizProgressHeader({
    super.key,
    required this.currentQuestionIndex,
    required this.myscore,
  });
  final int currentQuestionIndex;
  final int myscore;

  @override
  State<QuizProgressHeader> createState() => _QuizProgressHeaderState();
}

class _QuizProgressHeaderState extends State<QuizProgressHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'السؤال ${widget.currentQuestionIndex + 1}'
          ' من ${questions.length}',
          style: const TextStyle(fontSize: 18),
        ),

        const SizedBox(height: 10),

        // الدرجة
        Text(
          'الدرجة: ${widget.myscore}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
