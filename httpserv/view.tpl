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


            div#text {
                background: white;
                display: none;
                float: left;
                padding: 30px;
                margin: 20px
            }

            div pre {
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
            }
            
            #result {
                    position: fixed;
                    top: 60px;
                    right: 20px;
                    font-family: monospace;
                    font-size: 9px;
                    line-height: 12px;
                    z-index: 998;
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

            $(document).ready(function() {
                markers = new Markers();
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
                        formatted_text = file.data.replace (/(\w+)/ig,'</span><span class="_keyword $1">$1</span><span>');
                        $('#text').empty().append ('<h2>' + file.name + '</h2><pre><span>' + formatted_text + '</span></pre>');
                        
                        //$("span._keyword").click (function () {markers.addMarker ('.' + $(this).text(), markers.level.permanent); });
                        //$("span._keyword").dblclick (function () {markers.removeMarkerBySelector ('.' + $(this).text(), markers.level.permanent); });
                         $("span._keyword").click(function () {getContext ($(this).text());});
                    }
                    
                    $('#text').show ();
                });
            }
            
            function getContext(word) {
                $.get ('context/' + $('#file_list').val() + '/' + word, function (data, status) {
                    if (status == 'success') {
                        $('#result').empty ().append ('<pre>' + data + '</pre>');

                    }
                });
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
