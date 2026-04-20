class Answer {
  final String id;
  final String text;

  Answer({required this.id, required this.text});
}

class Question {
  final String id;
  final String text;
  final List<Answer> answers;
  final String? selectedAnswerId;

  Question({
    required this.id,
    required this.text,
    required this.answers,
    this.selectedAnswerId,
  });

  Question copyWith({
    String? id,
    String? text,
    List<Answer>? answers,
    String? selectedAnswerId,
  }) {
    return Question(
      id: id ?? this.id,
      text: text ?? this.text,
      answers: answers ?? this.answers,
      selectedAnswerId: selectedAnswerId ?? this.selectedAnswerId,
    );
  }
}
