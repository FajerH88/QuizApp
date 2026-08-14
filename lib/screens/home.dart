import 'package:flutter/material.dart';
import 'package:quiz6/widget/answers_button.dart';
import '../models/question_model.dart';
import '../widget/show_result.dart';


class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  int score = 0;


  void selectAnswer(int answerIndex) {

    if (selectedAnswerIndex != null) {
      return;
    }

    setState(() {

      selectedAnswerIndex = answerIndex;

      if (answerIndex == questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }
    });

    goToNextQuestion();
  }


  void goToNextQuestion() async {

    await Future.delayed(const Duration(seconds: 1));


    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
      });
    } else {

      showResult();
    }
  }


  Color getAnswerColor(int answerIndex) {

    if (selectedAnswerIndex == null) {
      return Colors.blue;
    }

    int correctAnswer = questions[currentQuestionIndex].correctAnswerIndex;


    if (answerIndex == correctAnswer) {
      return Colors.green;
    }


    if (answerIndex == selectedAnswerIndex) {
      return Colors.red;
    }


    return Colors.blue;
  }


  void showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('انتهى الاختبار'),
          content: Text(
            'درجتك: $score من ${questions.length}',
            style: const TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                setState(() {
                  currentQuestionIndex = 0;
                  selectedAnswerIndex = null;
                  score = 0;
                });
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    QuestionModel currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('الاختبار'), centerTitle: true),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              QuizProgressHeader(
                currentQuestionIndex: currentQuestionIndex,
                myscore: score,
              ),
              const SizedBox(height: 30),


              Text(
                currentQuestion.question,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),


              ...List.generate(currentQuestion.answers.length, (answerIndex) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: AnswersButton(
                    getAnswerColor: getAnswerColor,
                    selectAnswer: selectAnswer,
                    currentQuestion: currentQuestion,
                    answerIndex: answerIndex,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
