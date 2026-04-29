import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/question_model.dart';
import '../../llm/llm_service.dart';

// Generate a simple ID (in production, use a UUID package)
String _generateId() => DateTime.now().millisecondsSinceEpoch.toString();

// Mutable questions list - in production, use a proper database
List<Question> _questions = [
  Question(
    id: _generateId(),
    text: 'What is your favorite programming language?',
    answers: [
      Answer(id: '1', text: 'Dart'),
      Answer(id: '2', text: 'Python'),
      Answer(id: '3', text: 'JavaScript'),
      Answer(id: '4', text: 'Go'),
    ],
  ),
];

// Notifier for questions
class QuestionsNotifier extends Notifier<List<Question>> {
  @override
  List<Question> build() => _questions;

  Future<void> addQuestion(String text) async {
    final llmService = LlmService();
    final generatedTexts = await llmService.generateAnswerOptions(text);
    
    final newQuestion = Question(
      id: _generateId(),
      text: text,
      answers: generatedTexts.asMap().entries.map((e) => 
        Answer(id: e.key.toString(), text: e.value)
      ).toList(),
    );
    _questions = [..._questions, newQuestion];
    state = _questions;
  }

  void answerQuestion(String questionId, String answerId) {
    _questions = _questions.map((q) {
      if (q.id == questionId) {
        return q.copyWith(selectedAnswerId: answerId);
      }
      return q;
    }).toList();
    state = _questions;
  }

  void removeQuestion(String questionId) {
    _questions = _questions.where((q) => q.id != questionId).toList();
    state = _questions;
  }
}

// Provider for the list of all questions
final questionsProvider = NotifierProvider<QuestionsNotifier, List<Question>>(
  QuestionsNotifier.new,
);

// Class to hold question mutation methods
class QuestionsManager {
  final WidgetRef ref;

  QuestionsManager(this.ref);

  Future<void> addQuestion(String text) async {
    await ref.read(questionsProvider.notifier).addQuestion(text);
  }

  void answerQuestion(String questionId, String answerId) {
    ref.read(questionsProvider.notifier).answerQuestion(questionId, answerId);
  }

  void removeQuestion(String questionId) {
    ref.read(questionsProvider.notifier).removeQuestion(questionId);
  }
}

// Provider for the current question being answered (first unanswered one)
final currentQuestionProvider = Provider<Question?>((ref) {
  final questions = ref.watch(questionsProvider);
  try {
    return questions.firstWhere((q) => q.selectedAnswerId == null);
  } catch (_) {
    return null;
  }
});
