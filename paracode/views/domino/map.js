function(doc) {
  if (doc.app == "domino") {
    emit([doc.elt_id, doc.created_at], doc);
  }
}
