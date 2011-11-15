<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <title>Hello</title>
        <link rel="stylesheet" href="http://meyerweb.com/eric/tools/css/reset/reset.css" type="text/css" media="screen" charset="utf-8">
        <style>
            html, body {
                width: 100%;
                height: 100%;
            }
            iframe  {
                width: 50%;
                height: 100%;
                overflow-y: scroll;
                border: 1px solid black;
            }
            textarea {
                float: right;
                width: 40%;
                height: 100%;
            }
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
                function get_XPath(elt) {
                    var path = '';
                    for (; elt && elt.nodeType==1; elt=elt.parentNode) {
                        var idx=$(elt.parentNode).children(elt.tagName).index(elt)+1;
                        idx > 1 ? (idx = '['+idx+']') : (idx = '');
                        path = '/' + elt.tagName.toLowerCase() + idx + path;
                    }
                    return path;
                }
                function callIframe(url) {
                    $(document.body).append('<iframe scrolling="yes" src="' + url+ '">Your Browser doesn\'t support iframes</iframe>');
                    $('iframe').attr('src', url).load(function() {
                        var doc = $(this).contents().get(0);
                        $(doc).bind('click', function( event ) {
                            var $textarea = $('textarea');
                            $textarea.append('\{\{ ' + url.substring(12, url.length) + ' | xpath ' + get_XPath(event.target) + ' \}\}\n');
                        });
                        $(doc).find('head').append("<style type='text/css'>h1:hover, p:hover, div:hover{ border: 1px solid red;} </style>");
                    });
                }

                $('input[type="button"]').click(function(e) {
                    $("iframe").remove();
                    callIframe("/proxy/?url=" + $('input[type="text"]').val());
                });
                // var doc = $('iframe').contents().get(0);
                // $(doc).ready(function() {
                // console.log($(doc).width());
                // console.log($(doc).height());
                // console.log($(doc));
                // $(doc).bind('click', function( event ) {
                //     console.log(event);
                // });
                // });
                //     $('h1', $doc).css('color', 'red');
                //     $('h1', $doc).bind('click', function(event) {
                //         console.log(event);
                //     });
                // //var $doc = $($iframe[0].contentWindow.document || myf.contentDocument);
                // var $doc = $iframe[0].contentDocument;
            });
        </script>
    </head>
    <body>
        <div>
            <input type="text" name="url" value="" />
            <input type="button" name="go" value="Go!" />
        </div>
        <!--<iframe name="doc" src="http://www.jabberwocky.com/carroll/jabber/jabberwocky.html"></iframe>-->
        <!--<embed src="http://www.jabberwocky.com/carroll/jabber/jabberwocky.html" />-->
        <!--<iframe name="doc" src="/proxy/"></iframe>-->
        <textarea name="code" rows="8" cols="40"></textarea>
    </body>
</html>
