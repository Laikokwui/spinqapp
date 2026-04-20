# Development Setup (SpinQ)

This document explains how to get the project running locally for development.

Prerequisites
- Install Flutter (stable). Ensure `flutter --version` prints a stable release.
- Install Android SDK / Android Studio for Android builds.
- For iOS builds (macOS only): Xcode and CocoaPods.

Basic local steps
1. Clone the repository and open it in VS Code or Android Studio.
2. Install Dart & Flutter extensions (recommended).
3. Run:

```powershell
flutter pub get
flutter test
```

Supabase setup
1. Create a Supabase project and enable Realtime and Storage.
2. Create a Storage bucket (e.g. `models`) and upload your GGUF model file.
3. Add the following environment variables (see `ENV.example`):

- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `SUPABASE_STORAGE_BUCKET`
- `MODEL_FILE_NAME` (e.g. `phi-3.5-mini.gguf`)

Model hosting and download
- Upload the quantized GGUF model to the Supabase Storage `models` bucket.
- Use signed URLs for download. The app will perform a resumable download and verify SHA256.

Recommended packages (add to `pubspec.yaml` when ready)
- `flutter_riverpod`
- `supabase_flutter`
- `dio`
- `path_provider`
- `flutter_secure_storage`
- `isar_flutter_libs` or `hive`
- `llamadart` (platform integration for on-device GGUF inference)

Developer notes
- Do not commit real secrets. Use `ENV.example` as a template for local env.
- Use small incremental PRs; add tests for logic-heavy changes.
