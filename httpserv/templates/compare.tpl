% def extrahead():
    <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>-->
    <script src="/js" type="text/javascript" charset="utf-8"></script>
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
        
            $.get ('/text/pair_list/', function (data, status) {
                if (status == 'success') {
                    var files = $.parseJSON (data);
                    $('#file_list').empty ();
                    $('#file_list').append ('<option value="null" selected="selected">Select a text...</option>');
                    for (var i = 0; i < files.length; i++) {        
                        $('#file_list').append ('<option value="' + files[i] + '">' + files[i].replace('|', ' & ').replace (/[-_]/g, ' ') + '</option>');
                    }
                    
                    $('#file_list').change (function () {
                        if ($(this).val() != 'null') {
                            var texts = $(this).val().split ('|');
                            
                            for (var i = 0; i < texts.length; i++) {
                                window.top.frames[i].getText (texts[i].replace (/[^a-zA-Z0-9_\(\),\.-]/g, ''));   
                            }
                        }
                    });
                }
            })
            
            $('#filter_list').change (function () {
                for (var i = 0; i < window.top.frames.length; i++) {
                    window.top.frames[i].setFilter();
                }
            });
        });
        
        function setHeight () { $('#texts, .text').height ($(window).height() - (30 + $('#nav').height() + 42 + $('#controls').height() + 14)); }
    </script>
    <!--<link rel="stylesheet" href="http://meyerweb.com/eric/tools/css/reset/reset.css" type="text/css" media="screen" charset="utf-8">-->
    <style>
    
        html, body {
            overflow: hidden;
        }
    
        #texts {
            width: 95%;
            padding: 0 2em 0 1em;
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
            width: 95%;
            padding: 0 2em 0 1em;
            display: block;
            text-align: right;
        }
        
        #controls select {
            margin: 5px 0px 5px 5px;
        }    
    </style>
%end

%rebase templates/base  extrahead=extrahead, background=background, title='NLTK', oneliner='NLTK'

<div id="controls">
    <select id="file_list">Loading texts...</select>
    <select id="filter_list"><option value="concordance" selected="selected">Concordance</option><option value="context">Similar context</option><option value="collocations">Collocations</option></select>
</div>
<div id="texts">
    <iframe src="/view/" class="text"></iframe>
    <iframe src="/view/" class="text"></iframe>
</div>
        