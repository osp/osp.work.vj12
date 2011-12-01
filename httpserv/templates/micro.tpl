%def extrahead():
    <style type="text/css" media="screen">
        div.micro-doc {
            float: left;
            width: 200px;
            margin: 1em;
        }
        pre {
            font-family: "NotCourierSans", Liberation Mono, Courier, Monospace;
            margin: 2em;
            font-size: 13px;
        }
        div#page {
            float: left;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function(){
            $("a#toggle-notes").toggle(function(){
                    $("img#timeline").attr("src", "/static/img/micromacro/timeline-with-notes.png"); 
                }, function(){
                    $("img#timeline").attr("src", "/static/img/micromacro/timeline-without-notes.png"); 
            });
        });
    </script>
%end 


%rebase templates/compact  background=background, extrahead=extrahead, title='Micro', oneliner='The grey literature necessary to produce Michael Moss\' <a href="http://constantvzw.org/verlag/spip.php?page=article&id_article=131&mot_filtre=5&id_lang=0" target="_blank">To Talk of Many Things</a> gathered by Nicolas Malevé.'

<div style="background-color: white; padding: 5px; margin: 1em 0; display: inline-block;">
Download the timeline in <a href="/static/img/micromacro/timeline.tar.gz">SVG (tarball)</a> or in <a href="/static/img/micromacro/timeline-without-notes">PDF</a> (<a href="/static/img/micromacro/timeline-with-notes">with notes</a>)
</div>

<div style="background-color: white; padding: 5px; margin: 1em 0; margin-left: 1em; display: inline-block;">
    <a id="toggle-notes" href="#">Show annotations</a>
</div>

<img id="timeline" src="/static/img/micromacro/timeline-without-notes.png" />



