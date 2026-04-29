import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/questions/providers/question_provider.dart';
import '../../features/questions/models/question_model.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnswerScreen extends ConsumerWidget {
  const AnswerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(questionsProvider);
    final currentQuestion =
        questions.firstWhere((q) => q.selectedAnswerId == null, orElse: () => Question(id: '', text: '', answers: []));

    if (currentQuestion.text.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Answer Questions'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 80,
                color: Colors.greenAccent,
              ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scaleXY(end: 1.1, duration: 1.seconds),
              const SizedBox(height: 24),
              Text(
                'All caught up! 🎉',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Check back later for more questions',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
              ),
            ],
          ).animate().fade().slideY(begin: 0.1),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Answer Questions'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Question Card
            Card(
              elevation: 8,
              shadowColor: Colors.purpleAccent.withValues(alpha: 0.5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Someone asked:',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.purpleAccent,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      currentQuestion.text,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ).animate().shimmer(duration: 2.seconds).slideY(begin: -0.1, end: 0).fadeIn(),
            
            const SizedBox(height: 32),
            
            Text(
              'Pick a funny answer!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ).animate().fade(delay: 300.ms),
            
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion.answers.length,
                itemBuilder: (context, index) {
                  final answer = currentQuestion.answers[index];
                  final isSelected = currentQuestion.selectedAnswerId == answer.id;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutBack,
                      transform: Matrix4.identity()..scale(isSelected ? 1.05 : 1.0, isSelected ? 1.05 : 1.0, 1.0),
                      child: ElevatedButton(
                        onPressed: () {
                          final manager = QuestionsManager(ref);
                          manager.answerQuestion(currentQuestion.id, answer.id);
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Hilarious choice! 🤣', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              backgroundColor: Colors.pinkAccent,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              margin: const EdgeInsets.all(16),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? Colors.pinkAccent
                              : Theme.of(context).cardColor,
                          foregroundColor: isSelected ? Colors.white : Theme.of(context).colorScheme.onSurface,
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: isSelected ? Colors.pinkAccent : Colors.grey.withValues(alpha: 0.3),
                              width: 2,
                            ),
                          ),
                          elevation: isSelected ? 8 : 2,
                        ),
                        child: Text(
                          answer.text,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ).animate().fade(delay: (200 + 100 * index).ms).slideX(begin: 0.2, end: 0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
