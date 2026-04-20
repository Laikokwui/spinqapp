import 'dart:async';

class LlmService {
  LlmService();

  /// Generate 3–5 short answer options for a question, under a personality.
  Future<List<String>> generateAnswerOptions(String question, String personality) async {
    // TODO: call ModelManager / llamadart to run generation on-device.
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      'A practical option',
      'An optimistic option',
      'A pessimistic option',
    ];
  }
}
