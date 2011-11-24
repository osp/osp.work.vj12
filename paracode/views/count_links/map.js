function(doc) {
  if (doc.app == "domino") {
    emit(doc._id, 1);
  }
}
