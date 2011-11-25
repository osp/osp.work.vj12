function(doc) {
    if (doc.app == "domino") {
        for (i in doc.elts) {
            emit(doc.elts[i], 1);
        }
    } 
}
