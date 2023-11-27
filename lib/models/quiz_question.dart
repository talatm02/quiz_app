class QuizQuestion {
  final String question;
  final List<String> answers;
  const QuizQuestion(this.question, this.answers);

  List<String> getShuffledAnswers() {
    // final answers = this.answers.toList();
    final answers = List.of(this.answers);
    answers.shuffle();
    return answers;
  }
}
