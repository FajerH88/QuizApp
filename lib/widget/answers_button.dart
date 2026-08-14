import 'package:flutter/material.dart';
import '../models/question_model.dart';

class AnswersButton extends StatefulWidget {
  const AnswersButton({
    super.key,
    required this.getAnswerColor,
    required this.selectAnswer,
    required this.currentQuestion,
    required this.answerIndex,
  });
  final Function(int) getAnswerColor;
  final Function(int) selectAnswer;
  final QuestionModel currentQuestion;
  final int answerIndex;

  @override
  State<AnswersButton> createState() => _AnswersButtonState();
}

class _AnswersButtonState extends State<AnswersButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.getAnswerColor(widget.answerIndex),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

        padding: const EdgeInsets.all(16),
      ),
      onPressed: () {
        widget.selectAnswer(widget.answerIndex);
      },
      child: Text(
        widget.currentQuestion.answers[widget.answerIndex],
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
