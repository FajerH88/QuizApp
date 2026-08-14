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
    question: 'ما عدد أيام شهر مارس؟',
    answers: [
      '31 يوم',
      '30 يوم',
      '28 يوم',
      '29 يوم',
    ],
    correctAnswerIndex: 0,
  ),
  QuestionModel(
    question: 'كم عدد أيام الأسبوع؟',
    answers: [
      'خمسة أيام',
      'ستة أيام',
      'سبعة أيام',
      'ثمانية أيام',
    ],
    correctAnswerIndex: 2,
  ),
  QuestionModel(
    question: 'ما الكوكب الأحمر؟',
    answers: [
      'الأرض',
      'المريخ',
      'المشتري',
      'الزهرة',
    ],
    correctAnswerIndex: 1,
  ),
  QuestionModel(
    question: 'ما عاصمة دولة الكويت؟',
    answers: [
      'الأحمدي',
      'الكويت',
      'السالمية',
      'مبارك الكبير',
    ],
    correctAnswerIndex: 1,
  ),
];