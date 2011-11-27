<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <title>Texts</title>
        <link rel="stylesheet" href="http://meyerweb.com/eric/tools/css/reset/reset.css" type="text/css" media="screen" charset="utf-8">
        <style>
            html {
                background: #efefef;
                text-rendering: optimizeLegibility;
                overflow: visible;
            }


            div.text {
                background: white;
                display: block;
                float: left;
                padding: 15px;
                margin: 0 20px 20px 0px;
            }

            div pre {
                font-family: monospace;
                font-size: 6px;
                line-height: 10px;
            }

            pre.hide span {
                visibility: hidden;
            }

            pre.hide span._show {
                visibility: visible;
                display: inline-block;
            }

            h2 {
                margin: -5px 5px 5px -5px;
                font-size: 8px;
                font-weight: bold;
                font-family: sans-serif;
                text-transform: uppercase;
            }

            span {
                cursor: pointer;
            }

            ._mark_yellow {
                background-color: yellow;
            }
             
            ._mark_orange {
                background-color: #ff8c00;
            }

            ._mark_green {
                background-color: #00FF00;
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
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" charset="utf-8">

            var ZOOM_IN = 1.25;
            var ZOOM_OUT = 0.8
            var CUR_ZOOM = 1;
            var markers = null;
            
            var MARK_COLOR = null;

            Marker = function () {
                this.selector = null;
                this.level = null;

                this.apply = function () {
                    this.setMarkColor ();
                    $(this.selector).each (function () {if ($(this).hasClass ('_mark_' + MARK_COLOR) == false) { $(this).addClass ('_mark_' + MARK_COLOR)}});
                }

                this.remove = function () {
                    this.setMarkColor ();
                    $(this.selector).removeClass ('_mark_' + MARK_COLOR);
                }

                this.setMarkColor = function (color) {
                    this.color = color;
                }
            }

            YellowMarker = function () {
                this.prototype = clone(Marker.prototype);
                this.prototype.constructor = this;
                this.setMarkColor('yellow');
            }

            CollapseMarker = function () {
                this.selector = null;
                this.level = null;

                this.apply = function () { 
                    $('div.text > pre').addClass ('hide'); 
                    $(this.selector).each (function () { $(this).addClass('_show').nextAll('._keyword:lt(5)').addClass('_show');$(this).prevAll ('._keyword:lt(5)').addClass('_show')});
                }

                this.remove = function () {
                    $('div.text > pre').removeClass ('hide');
                    $('._show').removeClass ('_show');
                }
            }

            Markers = function () {
                this.id = 0,
                this.level = {regular: 1, permanent: 2},
                this.markers = new Array(),
                this.markerPrototypes = new Array (CollapseMarker)
                this.addMarker = function (selector) {

                    var level = (arguments.length < 2) ? this.level.regular : arguments[1];
                    marker = this.getMarkerBySelector (selector);

                    if (marker == null) {
                        var marker = this.getPrototype ();
                        marker.id = this.id++;
                        marker.level = level;
                        marker.selector = selector;
                        marker.apply ();
                        this.markers.push (marker);
                    } else {
                      if (level > marker.level) {
                        marker.level = level;
                    } }

                    return marker.id;
                }

                this.getMarkerBySelector = function (selector) {
                    for (var i = 0; i < this.markers.length; i++) {
                        if (this.markers[i].selector == selector)
                            return this.markers[i];
                    }

                    return null;
                }

                this.getMarker = function (id) {
                    for (var i = 0; i < this.markers.length; i++) {
                        if (this.markers[i].id == id)
                            return this.markers[i];
                    }

                    return null
                }

                this.removeMarker = function (id) {
                    var level = (arguments.length < 2) ? this.level.regular : arguments[1];

                    for (var i=0; i < this.markers.length; i++) {
                        if (this.markers[i] != null && this.markers[i].id == id)
                            return this.removeMarkerByIndex (i, level);
                    }
                }

                this.removeMarkerBySelector = function (selector) {
                    var level = (arguments.length < 2) ? this.level.regular : arguments[1];

                    for (var i=0; i < this.markers.length; i++) {
                        if (this.markers[i] != null && this.markers[i].selector == selector)
                            this.removeMarkerByIndex (i, level);
                    }
                }

                this.removeMarkerByIndex = function (index) {
                    var level = (arguments.length < 2) ? this.level.regular : arguments[1];
                    
                    if (this.markers.length > index && level >= this.markers[index].level) {
                        this.markers[index].remove();
                       return this.markers.splice (index, 1);
                    } else {
                        return false;
                    }
                }

                this.getPrototype = function () {
                    if (arguments.length > 0 && this.markerPrototypes.length > arguments[0]) {
                        return new this.markerPrototypes[arguments[0]];
                    } else {
                        var prototype = this.markerPrototypes.shift();
                        this.markerPrototypes.push (prototype);
                        return new prototype;
                    }
                }
            };

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

                var centerTop = ($(window).scrollTop() + ($(window).height() * 0.5)) / $(document).height();
                var centerLeft = ($(window).scrollLeft() + ($(window).width() * 0.5)) / $(document).width();

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

                $(window).scrollTop((centerTop * $(document).height()) - ($(window).height() * 0.5));
                $(window).scrollLeft((centerLeft * $(document).width()) - ($(window).width() * 0.5));
            }

            function zoom_out () {
                zoom (ZOOM_OUT)
            }

            function zoom_in () {
                zoom (ZOOM_IN)
            }

            $(document).ready(function() {
                // var files = $.parseJSON('{{files}}')
                var files = {{!files}};
                markers = new Markers();

                for (i=0; i < files.length; i++) {
                    text = $.get ('text/' + files[i], function (data, status) {
                        file = $.parseJSON (data)
                        
                        if (status == 'success') { 
                            formatted_text = file.data.replace (/(\w+)/ig,'</span><span class="_keyword $1">$1</span><span>');
                            $('#texts').append ('<div class="text"><h2>' + file.name + '</h2><pre><span>' + formatted_text + '</span></pre></div>');
                            
                            $("div.text").draggable({stack: "div.text"}).mousedown(function() {$(this).css ("cursor", "move")}).mouseup(function() {$(this).css ("cursor", "default")});
                            //$("span").mouseover (function () {markers.addMarker ('.' + $(this).text())});
                            //$("span").mouseout (function () {markers.removeMarkerBySelector ('.' + $(this).text())});
                            $("span._keyword").click (function () {markers.addMarker ('.' + $(this).text(), markers.level.permanent); });
                            $("span._keyword").dblclick (function () {markers.removeMarkerBySelector ('.' + $(this).text(), markers.level.permanent); });
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
