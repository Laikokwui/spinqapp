class MessagingRepository {
  MessagingRepository();

  Future<void> sendQuestion(String question) async {
    // TODO: insert question row into Supabase and trigger match RPC
  }

  // TODO: add listeners for incoming questions and answer deliveries
}
