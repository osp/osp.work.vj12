function(doc) {
    if (doc.app == "domino") {
        doc.elts.forEach(function(elt) {
            emit([elt, doc.created_at], doc);
        });
    } 
}

//function(doc) {
    //if (doc.app == "domino") {
        //for (i in doc.elts) {
            //emit([doc.elts[i], doc.created_at], doc);
        //}
    //} 
//}
