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

            div.text {
                background: white;
                display: block;
                float: left;
                padding: 15px;
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
            var SCALE_PROPS = new Array ('font-size', 'line-height', 'margin-top', 'margin-right', 'margin-bottom', 'margin-left', 'padding-top', 'padding-right', 'padding-bottom', 'padding-left', 'left', 'top');
            var SCALE_SELECTORS = new Array ('div.text', 'h2', 'pre');
            var CUR_ZOOM = 1;

            props = {
               'div.text': {
                    'padding': 15px;
               }

               'h2': {
                    'margin': new Array (-5, 5, 5, -5),
                    'font-size': 8
                }

                'div pre': {
                    'font-size': 6;
                    'line-height': 10;
                }
            }

            function getBaseSize () {
                return parseInt ($('body').css('font-size'));
            }

            function setBaseSize (newBaseSize) {
                var format = (arguments.length > 1) ? arguments[1] : 'px';
                $('body').css('font-size', parseFloat (newBaseSize) + format);
                $('body').css('line-height', parseFloat (newBaseSize * 1.5) + format);
            }

            function setBodySize (newBodySize) {
                var format = (arguments.length > 1) ? arguments[1] : 'px';
                $('html').width(newBodySize[0]);
                $('html').height(newBodySize[1]);
            }

            function _scale (input) {
                if (typeof(input) == object) {
                    for (i=0;i<input.length;i++) {
                        input[i] = _scale (input)
                    }
                    return input;
                } else {
                    return input * CUR_ZOOM;
                }
            }
    
            function zoom (grow) {
                var grow = parseFloat (grow);
                var selectors = SCALE_SELECTORS;
                var props = SCALE_PROPS;

                $('html').css ('width', $('html').css ('width').match (/[0-9\.-]+/)[0] * grow)
                $('html').css ('height', $('html').css ('height').match (/[0-9\.-]+/)[0] * grow)

                for (s=0;s<selectors.length;s++) {
                    for (p=0;p<props.length;p++) {
                        $(selectors[s]).each (function () {
                            var css = $(this).css(props[p]);
                            if (css.match (/[0-9\.-]+/) != null) {
                                var value = parseFloat (css.match (/[0-9\.-]+/)[0]);
                                if (value != 0)
                                    $(this).css (props[p], value * grow + css.match (/[a-z]+$/i)[0]);
                            }
                        });
                   }
                }

//                 if (mode == 'factor') {
//                     setBaseSize (getBaseSize() * grow);
//                     setBodySize (new Array ($('html').width() * grow, $('html').height() * grow));
//                     $('.ui-draggable').each (function () {$(this).css('left', parseFloat ($(this).css('left')) * grow + 'px'); $(this).css('top', parseFloat ($(this).css('top')) * grow + 'px')});
//                 } else {
//                     setBaseSize (getBaseSize() + grow)
//                     setBodySize (new Array ($('html').width() + grow, $('html').height() + grow));
//                     $('.ui-draggable').each (function () { $(this).data('draggable').offset.click.top += grow; $(this).data('draggable').offset.click.left += grow; });
//                 }
            }

            function zoom_out () {
                zoom (ZOOM_OUT)
            }

            function zoom_in () {
                zoom (ZOOM_IN)
            }

            $(document).ready(function() {
                setBaseSize (5);

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
