class QuestionModel {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;

  const QuestionModel({
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
  });
}
final List<QuestionModel> questions = const [
  QuestionModel(
    question: 'الجرائم في قانون الجزاء؟',
    answers: [
      'جنايات وجنح',
      'جنايات وجنح وغرامة',
      'جنايات فقط',
      'جنح فقط',
    ],
    correctAnswerIndex: 0,
  ),
  QuestionModel(
    question: 'تسقط الدعوى الجزائية في الجنايات بمضي؟',
    answers: [
      'خمس سنوات من يوم وقوع الجناية',
      'سبع سنوات من يوم وقوع الجناية',
      'عشر سنوات من يوم وقوع الجناية',
      'خمسة عشر سنة من يوم وقوع الجناية',
    ],
    correctAnswerIndex: 2,
  ),
  QuestionModel(
    question: 'تسقط الدعوى الجزائية في الجنح بمضي؟',
    answers: [
      '3 سنوات من يوم وقوع الجريمة',
      '5 سنوات من يوم وقوع الجريمة',
      '7 سنوات من يوم وقوع الجريمة',
      '10 سنوات من يوم وقوع الجريمة',
    ],
    correctAnswerIndex: 1,
  ),
  QuestionModel(
    question: 'الجنح هي الجرائم التي يعاقب عليها بالحبس مدة لا تجاوز',
    answers: [
      '4 سنوات',
      '3 سنوات',
      '5 سنوات',
      '10 سنوات',
    ],
    correctAnswerIndex: 1,
  ),
];