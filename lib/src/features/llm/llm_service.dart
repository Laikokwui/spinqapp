import 'dart:async';
import 'dart:math';

class LlmService {
  LlmService();

  final List<String> _funnyAnswers = [
    "I'd ask my cat, but she's busy ignoring me.",
    "Does computing power equal brain power? No.",
    "42. It's always 42.",
    "My magic 8-ball says 'Outlook not so good'.",
    "Only if you promise me pizza.",
    "I'm an app, not a wizard!",
    "Let me check with the aliens... they said no.",
    "Error 404: Answer not found, but here's a potato.",
    "Yes, but actually no.",
    "I would, but my battery is low.",
    "In another universe, the answer is definitely yes.",
    "That sounds like a 'you' problem.",
    "Sure, when pigs fly and my code has no bugs.",
    "I'm legally obligated to say yes.",
    "Hold on, let me ask ChatGPT... it said ask me.",
  ];

  /// Generate 3–5 short answer options for a question, under a personality.
  Future<List<String>> generateAnswerOptions(String question, [String? personality]) async {
    await Future.delayed(const Duration(milliseconds: 1500)); // Simulate thinking
    
    final random = Random();
    final List<String> shuffled = List.from(_funnyAnswers)..shuffle(random);
    
    // Pick 4 random funny answers
    return shuffled.take(4).toList();
  }
}
