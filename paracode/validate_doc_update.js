function(newDoc, oldDoc, userCtx) {

    function validateUrl(field, message) {
        message = message || "You must enter a valid Url";
        //var urlTest = new RegExp ("^http\://.");
        //var match = urlTest.match(urlStr);
        var match = newDoc[field].match(/http/);
        if (match === null) {
            throw({forbidden : message});
        }
    };

    function require(field, message) {
        message = message || "Document must have a " + field;
        if (!newDoc[field]) throw({forbidden : message});
    };

    if (newDoc.type == "url") {
        require("app");
        require("content", "You may not leave an empty message");
        require("created_at");
        require("elts");
        validateUrl('content');
    }
    if (newDoc.type == "comment") {
        require("app");
        require("content", "You may not leave an empty message");
        require("created_at");
        require("elts");
    }
}
