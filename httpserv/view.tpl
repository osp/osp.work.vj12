<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <title>Texts</title>
        <link rel="stylesheet" href="http://meyerweb.com/eric/tools/css/reset/reset.css" type="text/css" media="screen" charset="utf-8">
        <style>
            html {
                background: rgb(239,239,239);
                text-rendering: optimizeLegibility;
                overflow: visible;
            }


            div#text {
                background: white;
                display: none;
                float: left;
                padding: 30px;
                margin: 20px
            }

            div#text pre {
                font-family: monospace;
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
                margin: -5px 5px 10px -5px;
                font-size: 11px;
                font-weight: bold;
                font-family: sans-serif;
                text-transform: uppercase;
            }

            span._keyword {
                cursor: pointer;
            }
            
            span._active, span._search_active {
                background: #ffff00;
            }

            span._marked {
                border-bottom-width: 2px;
                -moz-border-image:url("/img/border.png") 3 0 round; /* Firefox */
                -webkit-border-image:url("/img/border.png") 3 0 round; /* Safari and Chrome */
                -o-border-image:url("/img/border.png") 3 0round; /* Opera */
                border-image:url("/img/border.png") 3 0 round;
            }

            #controls {
                position: fixed;
                top: 20px;
                right: 20px;
                z-index: 999;
            }
            
            #result {
                    position: fixed;
                    display: none;
                    padding: 10px;
                    top: 60px;
                    right: 20px;
                    width: auto;
                    font-family: monospace;
                    font-size: 10px;
                    line-height: 16px;
                    z-index: 998;
                    background: rgba(239, 239, 239, 0.75);
            }

            #controls span {
                display: block;
                color: #333333;
                background: white;
                border: 1px solid #ddd;
                border-radius: 6px;
                padding: 3px 6px 1px 6px;
                margin: 0px 0px 10px 0px;
                cursor: pointer;
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
                                getText ($(this).val().replace (/[^a-zA-Z0-9_-]/g, ''));
                            }
                        });
                    }
                })
            });
            
            function getText (name) { 
               $.get ('text/' + name, function (data, status) {
                    file = $.parseJSON (data)
                    
                    if (status == 'success') { 
                        formatted_text = file.data.replace (/(\w+)/ig,'<span class="_keyword $1">$1</span>');
                        $('#result').empty().hide();
                        $('#text').empty().append ('<h2>' + file.name + '</h2><pre>' + formatted_text + '</pre>');
                        markWord (['the','notice','and']);
                        $("span._keyword").mouseover(function () {$('.' + $(this).text()).addClass ('_active');});
                        $("span._keyword").mouseout(function () {$('.' + $(this).text()).removeClass ('_active');});
                        $("span._keyword").click(function () {getContext ($(this).text());});
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
            
            function getContext(word) {
                $.get ('context/' + $('#file_list').val() + '/' + word, function (data, status) {
                    if (status == 'success') {
                        data = $.parseJSON (data);
                        result = data.result.replace(/(.+)/g, '<span class="_line"><pre>$1</pre></span>');
                        
                        $('#result').height('auto').width ('auto').empty ().append (result).show();
                        $('._search_active').removeClass ('_search_active');
                        
                        if ($('#result').height() > ($(window).height() * 0.9)) {
                            $('#result').height($(window).height() * 0.75).css ('overflow-y', 'auto').width ($('#result').width() + 25);
                        }
                        
                        $('span._line').click (function () {
                            index = $(this).prevAll ('span._line').length;
                            goToWord (word, index);
                        });
                    }
                });
            }
            
            function goToWord (word, index) {
                var selector = 'span._keyword.' + word + ':eq(' + index + ')';
                var offsetTop = $(selector).offset().top - $(window).height() / 2;
                var distance = Math.abs ($('html').offset().top - offsetTop);
                var duration = (distance > 1000) ? 500 : distance / 2;
                
                $('._search_active').removeClass ('_search_active');
                $('html:not(:animated),body:not(:animated)').animate ({'scrollTop': offsetTop}, duration);
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
