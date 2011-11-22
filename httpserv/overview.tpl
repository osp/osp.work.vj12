<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <title>Texts</title>
        <link rel="stylesheet" href="http://meyerweb.com/eric/tools/css/reset/reset.css" type="text/css" media="screen" charset="utf-8">
        <style>
            html {
                background: #efefef;
            }

            body {
                padding: 20px;
            }

            div.text {
                background: white;
                display: block;
                float: left;
                padding: 15px;
                margin: 0 20px 20px 0px;
            }

            div pre {
                cursor: text;
                font-family: monospace;
                font-size: 6px;
                line-height: 10px;
            }

            h2 {
                margin: -5px 5px 5px -5px;
                font-size: 8px;
                font-weight: bold;
                font-family: sans-serif;
                text-transform: uppercase;
            }

            a {
                display: inline-block;
                color: inherit;
                text-decoration: inherit;
                vertical-align: center;
                width: auto;
            }

            a:hover, a._active_ {
                background-color: yellow;
            }

            #controls {
                position: fixed;
                top: 20px;
                right: 20px;
                z-index: 999;

                font-family: monospace;
                font-size: 20px;
                line-height: 20px;
                font-weight: bold;
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
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" charset="utf-8">

            var ZOOM_IN = 1.25;
            var ZOOM_OUT = 0.8
            var CUR_ZOOM = 1;

            var SCALE_PROPS = {
               'html': {
                    'width': 'inherit',
                    'height': 'inherit'
                },
               
                'body': {
                    'width': 'inherit',
                    'height': 'inherit'
                },

               'div.text': {
                    'padding': 20,
                    'left': 'inherit',
                    'top': 'inherit'
                },

                'h2': {
                    'margin-top': -5,
                    'margin-right': 5,
                    'margin-bottom': 5,
                    'margin-left': -5,
                    'font-size': 8
                },

                'div pre': {
                    'font-size': 6,
                    'line-height': 10
                }
            }

    
            function zoom (grow) {
                var grow = parseFloat (grow);
                
                CUR_ZOOM = CUR_ZOOM * grow;
                
                for (selector in SCALE_PROPS) {
                    for (property in SCALE_PROPS[selector]) { 
                        if (SCALE_PROPS[selector][property] == 'inherit') {
                            $(selector).each (function () {
                                var val = $(this).css(property).match(/[0-9\.-]+/);
                                if (val != null)
                                    $(this).css(property, Math.round (val[0] * grow, 1) + 'px')
                            });
                        } else {
                            $(selector).css(property, (SCALE_PROPS[selector][property] * CUR_ZOOM) + 'px')
                        }
                    }
                }
            }

            function zoom_out () {
                zoom (ZOOM_OUT)
            }

            function zoom_in () {
                zoom (ZOOM_IN)
            }

            $(document).ready(function() {
                files = $.parseJSON('{{files}}')

                for (i=0; i < files.length; i++) {
                    text = $.get ('text/' + files[i], function (data, status) {
                        file = $.parseJSON (data)
                        
                        if (status == 'success') { 
                            formatted_text = file.data.replace (/(\w+)/ig,'<a href="/context/$1" class="$1">$1</a>');
                            $('#texts').append ('<div class="text"><h2>' + file.name + '</h2><pre>' + formatted_text + '</pre></div>');
                            
                            $("div.text").draggable({stack: "div.text"}).mousedown(function() {$(this).css ("cursor", "move")}).mouseup(function() {$(this).css ("cursor", "default")});
                            $("a").mouseover (function () {$('.' + $(this).text()).addClass ('_active_');});
                            $("a").mouseout (function () {$('.' + $(this).text()).removeClass ('_active_');});
                        }
                    });
                }

                $('#zoom_in').click (function () {zoom_in ()});
                $('#zoom_out').click (function () {zoom_out ()});

                $(document).keypress (function (event) {
                    if (event.which == 43 || event.which == 61)
                        zoom_in ();
                    if (event.which == 45)
                        zoom_out ();
                });
            });
        </script>
    </head>
    <body>
        <div id="controls">
            <span id="zoom_in">&plus;</span>
            <span id="zoom_out">&minus;</span>
        </div>
        <div id="texts">
        </div>
    </body>
</html>
