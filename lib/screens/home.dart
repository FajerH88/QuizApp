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

  // عند الضغط على إجابة
  void selectAnswer(int answerIndex) {
    // يمنع الضغط مرتين
    if (selectedAnswerIndex != null) {
      return;
    }

    setState(() {
      // حفظ رقم الإجابة التي اختارتها المستخدمة
      selectedAnswerIndex = answerIndex;

      // إذا كانت الإجابة صحيحة، زيدي الدرجة
      if (answerIndex == questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }
    });
    // الانتقال للسؤال التالي
    goToNextQuestion();
  }

  // الانتقال للسؤال التالي
  void goToNextQuestion() async {
    // الانتظار ثانية حتى يظهر اللون
    await Future.delayed(const Duration(seconds: 1));

    // إذا يوجد سؤال آخر
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
      });
    } else {
      // إذا انتهت الأسئلة
      showResult();
    }
  }

  // تحديد لون الزر
  Color getAnswerColor(int answerIndex) {
    // قبل اختيار الإجابة
    if (selectedAnswerIndex == null) {
      return Colors.blue;
    }

    int correctAnswer = questions[currentQuestionIndex].correctAnswerIndex;

    // الإجابة الصحيحة
    if (answerIndex == correctAnswer) {
      return Colors.green;
    }

    // الإجابة المختارة إذا كانت خطأ
    if (answerIndex == selectedAnswerIndex) {
      return Colors.red;
    }

    // بقية الإجابات
    return Colors.blue;
  }

  // عرض النتيجة
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
    // السؤال الحالي
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

              // نص السؤال
              Text(
                currentQuestion.question,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // أزرار الإجابات
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
