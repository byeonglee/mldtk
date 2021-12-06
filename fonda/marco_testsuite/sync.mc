Code<cpp,stmt> synch(
  Code<cpp,id> mux,
  Code<cpp,stmt> body) {
    return `cpp(stmt) [{
      acquireLock($mux);
      $body
      releaseLock($mux);
    }];
}
