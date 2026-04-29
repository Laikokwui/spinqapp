import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spinqapp/src/features/questions/providers/question_provider.dart';

void main() {
  test('QuestionProvider initializes with one question', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final questions = container.read(questionsProvider);
    expect(questions.length, 1);
    expect(questions.first.text, 'What is your favorite programming language?');
  });

  test('QuestionProvider adds a question asynchronously', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await container.read(questionsProvider.notifier).addQuestion('Are we there yet?');
    
    final questions = container.read(questionsProvider);
    expect(questions.length, 2);
    expect(questions.last.text, 'Are we there yet?');
    expect(questions.last.answers.length, 4); // LLM Service returns 4 random funny answers
  });
}
