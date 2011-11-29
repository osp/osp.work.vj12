<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <title>Texts</title>
        <link rel="stylesheet" href="http://meyerweb.com/eric/tools/css/reset/reset.css" type="text/css" media="screen" charset="utf-8">
        <style>
            html {
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
            
            span._active, span._search_active {
                background: #ffff00;
            }

            span._index_keyword {
                font-weight: bold;
            }
            
            span._marked {
                border-bottom-width: 2px;
                -moz-border-image:url("/static/img/border.png") 3 0 round; /* Firefox */
                -webkit-border-image:url("/static/img/border.png") 3 0 round; /* Safari and Chrome */
                -o-border-image:url("/static/img/border.png") 3 0round; /* Opera */
                border-image:url("/static/img/border.png") 3 0 round;
            }

            #controls {
                display: block;
                width: 100%;
                z-index: 999;
                text-align: right;
            }
            
            #controls select {
                margin: 5px;
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
            $(document).ready(function() {
                $.get ('text/list', function (data, status) {
                    if (status == 'success') {
                        var files = $.parseJSON (data);
                        $('#file_list').empty ();
                        $('#file_list').append ('<option value="null" selected="selected">Select a text...</option>');
                        for (var i = 0; i < files.length; i++) {        
                            $('#file_list').append ('<option value="' + files[i] + '">' + files[i].replace (/[-_]/g, ' ') + '</option>');
                        }
                        
                        $('#file_list').change (function () {
                            if ($(this).val() != 'null') {
                                getText ($(this).val().replace (/[^a-zA-Z0-9_\(\),\.-]/g, ''));
                            }
                        });
                    }
                })
            });
            
            function getText (name) { 
               $.get ('text/' + name, function (data, status) {
                    file = $.parseJSON (data)
                    
                    if (status == 'success') {
                        formatted_text = '<p>' + file.data.replace (/(\w+)/ig,'<span class="_keyword $1">$1</span>').replace(/\n{2,}/g, '</p><p>').replace (/\n/g, '<br />').replace (/\s{3,}/g, '&nbsp;&nbsp;&nbsp;&nbsp;') + '</p>'
                        
                        $('#result').empty().hide();
                        $('#text').height($(window).height() - $('#controls').height());
                        $('#text').empty().append ('<h2>' + file.name + '</h2>' + formatted_text);
                        markWord (['the','notice','and']);
                        
                        if (window == window.top) {
                            $("span._keyword").mouseover(function () {$('.' + $(this).text()).addClass ('_active');});
                            $("span._keyword").mouseout(function () {$('.' + $(this).text()).removeClass ('_active');});
                            $("span._keyword").click(function () {getContext ($(this).text());});
                        } else {
                            $("span._keyword").mouseover(function () {
                                for (var i = 0; i < window.top.frames.length; i++) {
                                    $('.' + $(this).text(), window.top.frames[i].document).addClass ('_active');
                                }
                            });
                            
                            $("span._keyword").mouseout(function () {
                                for (var i = 0; i < window.top.frames.length; i++) {
                                    $('.' + $(this).text(), window.top.frames[i].document).removeClass ('_active');
                                }
                            });
                            
                            $("span._keyword").click(function () {
                                getContext ($(this).text());
                            });
                            
                            $("span._keyword").dblclick(function () {
                                hideContext ();
                            });
                        }
                    }
                    
                    $('#text').show ();
                });
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
            
            function getContext(word, force) {
                if (window == top.window || force == true) {
                    if ($('#file_list').val() != 'null') {
                        $.get ('context/' + $('#file_list').val() + '/' + word, function (data, status) {
                            if (status == 'success') {
                                data = $.parseJSON (data);
                                var result = ''
                                for (var i = 0; i < data.result.length; i++) {
                                    result += '<span class="_line"><pre>' + data.result[i]['head'] + '<span class="_index_keyword">' + data.result[i]['body'] + '</span>' + data.result[i]['tail'] + '</pre></span>'
                                }
                                $('#result').height('auto').width ('auto').empty ().append (result).show();
                                $('._search_active').removeClass ('_search_active');
                                
                                $('#result').height($(window).height() * 0.25);
                                $('#text').height($(window).height() * 0.75 - $('#controls').height());
                                
                                $('span._line').click (function () {
                                    index = $(this).prevAll ('span._line').length;
                                    goToWord (word, index);
                                });
                            }
                        });
                    }
                } else {
                    for (var i = 0; i < window.top.frames.length; i++) {
                        window.top.frames[i].getContext (word, true);
                    }
                }
            }
            
            function hideContext (force) {
                if (window == top.window || force == true) {
                    $('#result').hide().empty();
                    $('#text').height($(window).height() - $('#controls').height());
                } else {
                    for (var i = 0; i < window.top.frames.length; i++) {
                        window.top.frames[i].hideContext (true);
                    }
                }
            }
            
            function goToWord (word, index) {
                var selector = 'span._keyword.' + word + ':eq(' + index + ')';
                var distance = $(selector).position().top - $('#text').height() / 2;
                var duration = (Math.abs (distance) > 1000) ? 500 : Math.abs(distance) / 2;
                
                $('._search_active').removeClass ('_search_active');
                $('#text').animate ({'scrollTop': $('#text').scrollTop() + distance}, duration);
                $(selector).addClass ('_search_active');
            }
        </script>
    </head>
    <body>
        <div id="controls">
            <select id="file_list">Loading texts...</select>
        </div>
        <div id="result">
        </div>
        <div id="text">
        </div>
    </body>
</html>
