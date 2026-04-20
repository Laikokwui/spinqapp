import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'supabase_service.dart';
import 'model_manager.dart';

final supabaseServiceProvider = Provider<SupabaseService>((ref) {
  return SupabaseService();
});

final modelManagerProvider = Provider<ModelManager>((ref) {
  return ModelManager();
});
