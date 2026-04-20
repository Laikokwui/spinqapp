class ModelManager {
  ModelManager();

  /// Ensure model is present on disk (resumable download + checksum verification)
  Future<void> ensureModelDownloaded() async {
    // TODO: implement resumable download from Supabase Storage
  }

  /// Load the on-device model into memory and initialize runtime
  Future<void> loadModel() async {
    // TODO: integrate with llamadart or platform-specific loader
  }

  /// Unload model and free resources
  Future<void> unloadModel() async {
    // TODO: release memory
  }
}
