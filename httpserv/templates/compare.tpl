% def extrahead():
    <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>-->
    <script src="/js" type="text/javascript" charset="utf-8"></script>
 
    <!--<link rel="stylesheet" href="http://meyerweb.com/eric/tools/css/reset/reset.css" type="text/css" media="screen" charset="utf-8">-->
    <style>
    
        html, body {
            overflow: hidden;
        }
    
        #texts {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        
        #texts .text {
            float: left;
            overflow: hidden;
            border: none;
            width: 50%;
            height: 100%;
        }
        
        #controls {
            width: 100%;
            display: block;
            margin: 1em 0;
        }
        
        #controls select {
            margin: 0px 5px 0px 0px;
        }    
    h4 {
        display: inline;
        text-transform: uppercase;
        font-family: notcouriersans, courier, monospace;
        color: Coral;
    }
    </style>
%end

%rebase templates/compact extrahead=extrahead, background=background, title='Natural Language ToolKit Experiments', oneliner='<h4>Concordances</h4> View in what context a word appears in a text. <h4>Similar Contexts</h4> Finding words sharing the same context in a text. <h4>Collocations</h4> Finding couples in a text. By Nicolas Malevé, Gijs de Heij and Alexandre Leray.'

<div id="controls">
<select id="file_list"><option selected="selected" value="Fit_for_purpose|The_man_pages">Fit for purpose &amp; The man pages</option><option value="To_talk_of_many_things|Systemic_ambiguity">To talk of many things &amp; Systemic ambiguity</option><option value="Kaleidoscope,_a_genesis|Smatch_(1)">Kaleidoscope, a genesis &amp; Smatch (1)</option></select>
    <select id="filter_list"><option value="concordance" selected="selected">Concordance</option><option value="context">Similar context</option><option value="collocations">Collocations</option></select>
</div>
<div id="texts">
    <iframe src="/view/" class="text"></iframe>
    <iframe src="/view/" class="text"></iframe>
</div>
   <script type="text/javascript" charset="utf-8">
        $(document).ready (function () {
            setHeight ();
            
            $(window).resize (function () {
                setHeight ();
                
                for (var i = 0; i < window.top.frames.length; i++) {
                    window.top.frames[i].setHeight();
                }
            });
        
            $('#toc').bind ('click', function () { setHeight(); } );
 
	    $('#file_list').change (function () {
		loadText ();
	    });
            
            $('#filter_list').change (function () {
                for (var i = 0; i < window.top.frames.length; i++) {
                    window.top.frames[i].setFilter();
                    window.top.frames[i].hideContext(true);
                }
            });

            function loadText () {
                if ($('#file_list').val() != 'null') {
                    var texts = $('#file_list').val().split ('|');
                    
                    for (var i = 0; i < texts.length; i++) {
                        window.top.frames[i].getText (texts[i].replace (/[^a-zA-Z0-9_\(\),\.-]/g, ''));   
                    }
                }
            }

            window.setTimeout(function(){loadText();}, 2500);
        });
        
        function setHeight () { $('#texts, .text').height ($(window).height() - $('#texts').offset().top); }
    </script>
        
