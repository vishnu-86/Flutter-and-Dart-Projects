class QuizQuestion {
  const QuizQuestion(this.questionsString, this.options);
  final String questionsString;
  final List<String> options;
  List<String> shuffledlist(){
    final a=List.of(options);
    a.shuffle();
    return a;
  }
}
