<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <title>Texts</title>
        <link rel="stylesheet" href="http://meyerweb.com/eric/tools/css/reset/reset.css" type="text/css" media="screen" charset="utf-8">
        <style>
            html, body {
                text-rendering: optimizeLegibility;
                margin: 0;
                padding: 0;
            }

            div#text {
                overflow: auto;
                background: white;
                display: none;
                position: relative;
            }

            div#text p {
                margin: 16px 40px 16px 40px;
                font-family: sans-serif;
                font-size: 11px;
                line-height: 16px;
            }

            pre.hide span {
                visibility: hidden;
            }

            pre.hide span._show {
                visibility: visible;
                display: inline-block;
            }

            h2 {
                margin: 15px 10px 0px 25px;
                font-size: 11px;
                font-weight: bold;
                font-family: sans-serif;
                text-transform: uppercase;
            }

            span._keyword, span._line {
                cursor: pointer;
            }
            span._line:hover * {
                background-color: yellow;
            }
            
            span._selected {
                background: #D9D9D9;
            }
            span._active, span._search_active {
                background: #ffff00;
            }

            span._index_keyword, span._active_index {
                font-weight: bold;
            }
            
            span._marked {
                -moz-border-image:url("/static/img/border.png") 3 0 round; /* Firefox */
                -webkit-border-image:url("/static/img/border.png") 3 0 round; /* Safari and Chrome */
                -o-border-image:url("/static/img/border.png") 3 0round; /* Opera */
                border-image:url("/static/img/border.png") 3 0 round;
                border-width: 0px;
                border-bottom-width: 2px;
            }
               
            #result {
                overflow: auto;
                text-align: left;
                position: relative;
                display: none;
                width: auto;
                font-family: monospace;
                font-size: 10px;
                line-height: 16px;
                z-index: 998;
                background: rgb(245, 245, 245);
            }
            
            #result pre {
                    margin: 4px 0px 4px 20px;
            }
            
            div#center {
                z-index: 998;
                display: block;
                position: fixed;
                top: 50%;
                left: 50%;
                width: 10px;
                height: 10px;
                background-color: #F00;
            }
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" charset="utf-8">
            var CURTEXT = '';
            var CURFILTER = '';
        
            $(document).ready (function() {
                setFilter ();
            });
        
            function getText (name) { 
                CURTEXT = name;
                $.get ('/text/' + name, function (data, status) {
                    file = $.parseJSON (data)
                    console.log(name)
                    if (status == 'success') {
                        formatted_text = '<p>' + file.data.replace (/(\w+)/ig,'<span class="_keyword $1">$1</span>').replace(/\n{2,}/g, '</p><p>').replace (/\n/g, '<br />').replace (/\s{3,}/g, '&nbsp;&nbsp;&nbsp;&nbsp;') + '</p>'
                        
                        $('#result').empty().hide();
                        setHeight ();
                        $('#text').empty().append ('<h2>' + file.name + '</h2>' + formatted_text);

                        // CURATION OF WORDS PER TEXT
                        if (CURTEXT == "Fit_for_purpose") {
                            markWord (['qa','QA','environment', 'data', 'chat', 'offline', 'today', 'done', 'test', 'problem', 'mins', 'email', 'page', 'bug', 'team', 'user', 'work']);
                        }
                        if (CURTEXT == "The_man_pages") {
                            markWord (['man','documentation','software', 'code', 'text', 'computer', 'manual']);
                        }
                        if (CURTEXT == "To_talk_of_many_things") {
                            markWord (['environment', 'nonsense', 'information', 'reference', 'tokens', 'systems', 'digital', 'analogue']);
                        }
                        if (CURTEXT == "Systemic_ambiguity") {
                            markWord (['data','grey','literature', 'relation', 'user', 'error', 'value', 'other', 'systems', 'formal', 'ambiguity', 'intelligence', 'world', 'media', 'deception', 'conflict', 'failure', 'communication', 'human', 'machine']);
                        }
                        if (CURTEXT == "Kaleidoscope,a_genesis") {
                            markWord (['the','notice','and']);
                        }
                        if (CURTEXT == "Smatch_(1)") {
                            markWord (['the','notice','and']);
                        }
                        
                        setFilter ();
                    }
                    
                    $('#text').show ();
                });
            }
            
            function setHeight () {
                if ($('#result').css ('display') != 'none') {
                    $('#result').height($(window).height() * 0.25);
                    $('#text').height($(window).height() * 0.75);
                } else {
                    $('#text').height($(window).height());
                }
            }
            
            function markWord (word) {
                if (word instanceof Array) {
                    for (var i = 0; i < word.length; i++) {
                        markWord (word[i]);
                    }
                } else {
                    $('.' + word).addClass ('_marked');
                }
            }
            
            function putResult (result) {
                $('#result').width ('auto').empty ().append (result).show();
                $('._search_active').removeClass ('_search_active');
                
                setHeight ();
            }
            
            function getFilterResult (word, force) {
                if (CURTEXT != '') {
                    // When changing filters, remove highlight on words
                    $("._selected").removeClass("_selected");

                    if (force == true) {
                        /////////////////////////////////////////// CONCORDANCE FILTER ////////////////////////////////////
                        parseConcordanceFilterResult = function (data, status) {
                            if (status == 'success') {
                                data = $.parseJSON (data);
                                
                                var result = ''
                                
                                for (var i = 0; i < data.result.length; i++) {
                                    result += '<span class="_line"><pre>' + data.result[i]['head'] + '<span class="_index_keyword">' + data.result[i]['body'] + '</span>' + data.result[i]['tail'] + '</pre></span>'
                                }

                                // Leaves selected words highlighted
                                $("." + $(word).text()).addClass("_selected");
                                
                                putResult (result);
                                
                                $('span._line').click (function () {
                                    index = $(this).prevAll ('span._line').length;
                                    goToWord (data.word, index);
                                });
                            }
                        };
                        
                        /////////////////////////////////////////// COLLOCATION FILTER ////////////////////////////////////
                        parseCollocationResult = function (data, status) {
                            if (status == 'success') {
                                data = $.parseJSON (data);
                                
                                result = '';
                                
                                for (var i = 0; i < data.bigrams.length; i++) {
                                    occurences = $('._keyword.' + data.bigrams[i][0] + ' + ._keyword.' + data.bigrams[i][1]).length;
                                    result += '<span class="_line"><pre><span class="_line_bigram">' + data.bigrams[i].join (' ') + '</span>'
                                    for (var c = 1; c <= occurences; c++) {
                                        result += ' <span class="_line_sublink">(' + c + ')</span>'
                                    }
                                    result += '</pre></span>';
                                }
                                
                                putResult (result);
                                
                                // TODO: almost working
                                
                                $('._line_bigram').click (function () {
                                    $('._search_active').removeClass ('_search_active');
                                    bigrams = $(this).text().split(' ');
                                    $('._keyword.' + bigrams[0] + ' + ._keyword.' + bigrams[1]).addClass ('_search_active').each (function () {$(this).prev ('._keyword').addClass ('_search_active');});
                                });
                                
                                $('._line_sublink').click (function() {
                                    bigrams = $(this).siblings ('._line_bigram').text().split(' ');
                                    found_bigram = $('._keyword.' + bigrams[0] + ' + ._keyword.' + bigrams[1]).eq ($(this).text().match (/\d+/) - 1);
                                    goTo (found_bigram);
                                });
                            }
                        }
                        
                        if ($('#file_list').val() != 'null') {
                            /////////////////////////////////////////// CONCORDANCE FILTER ////////////////////////////////////
                            if (CURFILTER == 'concordance') {
                                $.get ('/context/' + CURTEXT + '/' + $(word).text(), parseConcordanceFilterResult);
                            }
                            
                            /////////////////////////////////////////// COLLOCATION FILTER ////////////////////////////////////
                            if (CURFILTER == 'collocations') {
                                $.get ('/collocations/' + CURTEXT + '/', parseCollocationResult);
                            }
                        }
                    } else {
                        for (var i = 0; i < window.top.frames.length; i++) {
                            window.top.frames[i].getFilterResult (word, true);
                        }
                    }
                }
            }
            
            function hideContext (force) {
                if (window == top.window || force == true) {
                    $('#result').hide().empty();
                    setHeight();
                } else {
                    for (var i = 0; i < window.top.frames.length; i++) {
                    }
                }
                        window.top.frames[i].hideContext (true);
            }
            
            function goToWord (word, index) {
                goTo ($('span._keyword.' + word + ':eq(' + index + ')'));
            }
            
            function goTo (jqueryObject) {
                var distance = jqueryObject.position().top - $('#text').height() / 2;
                var duration = (Math.abs (distance) > 1000) ? 500 : Math.abs(distance) / 2;
                
                $('._search_active').removeClass ('_search_active');
                $('#text').animate ({'scrollTop': $('#text').scrollTop() + distance}, duration);
                jqueryObject.addClass ('_search_active');
            }
            
            function setFilter () {
                CURFILTER = window.top.$('#filter_list').val();
                
                /////////////////////////////////////////// CONCORDANCE FILTER ////////////////////////////////////
                if (CURFILTER == 'concordance') {
                    $("._marked").css("border-width", "0 0 2px");
                    $("span._keyword").click(function () {
                        getFilterResult (this);
                    });
                    
                    $("span._keyword").unbind('mouseover').mouseover(function () {
                        for (var i = 0; i < window.top.frames.length; i++) {
                            $('.' + $(this).text(), window.top.frames[i].document).addClass ('_active');
                        }
                    });
                    
                    $("span._keyword").unbind('mouseout').mouseout(function () {
                        for (var i = 0; i < window.top.frames.length; i++) {
                            $('.' + $(this).text(), window.top.frames[i].document).removeClass ('_active');
                        }
                    });
                }
                
                /////////////////////////////////////////// CONTEXT FILTER ////////////////////////////////////
                if (CURFILTER == 'context') {
                    $("._marked").css("border-width", "0 0 2px");
                    $("span._keyword").unbind('mouseover').mouseover(function () {
                        $(this).next('._keyword').addClass ('_active');
                        $(this).prev('._keyword').addClass ('_active');
                    });
                    
                    $("span._keyword").unbind('mouseout').mouseout(function () {
                        $(this).next('._keyword').removeClass ('_active');
                        $(this).prev('._keyword').removeClass ('_active');
                    });
                }
                
                /////////////////////////////////////////// COLLOCATION FILTER ////////////////////////////////////
                if (CURFILTER == 'collocations') {
                     $("._marked").css("border-width", "0");
                     $("span._keyword").unbind ('click');
                     $("span._keyword").unbind('mouseover');
                     getFilterResult ('', true);
                }
            }
        </script>
    </head>
    <body>
        <div id="result">
        </div>
        <div id="text">
        </div>
    </body>
</html>
