%def extrahead():
<style type="text/css" media="screen">
    iframe {
        border: 0;
        height: 100%;
        width: 49%;
        float: left;
    }
</style>
%end


%rebase templates/compact background=background, extrahead=extrahead, title='KaleidoSmatch', oneliner='A parallel by Donatella Portoghese between <a href="http://constantvzw.org/verlag/spip.php?page=article&amp;id_article=132&amp;mot_filtre=5&amp;id_lang=0" target="_blank" style="color: pink;">Kaleidoscope</a> by An Mertens and <a href="http://constantvzw.org/verlag/spip.php?page=article&amp;id_article=129&amp;mot_filtre=5&amp;id_lang=0" target="_blank">Smatch</a> by Dominique Roodthooft.'

<div id='container'>
    <iframe id='kaleidoscope' src="/static/html/kaleidoscope.html" style='margin-right: 1em;'></iframe>
    <iframe id="smatch" src="/static/html/smatch.html"></iframe>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        // SYNCHRONIZES SCROLL OF BOTH IFRAMES.
        $("iframe#kaleidoscope").contents().scroll(function(){
            y = $("iframe#kaleidoscope").contents().scrollTop();
            $("iframe#smatch").contents().scrollTop(y);
        });
        $("iframe#smatch").contents().scroll(function(){
            y = $("iframe#smatch").contents().scrollTop();
            $("iframe#kaleidoscope").contents().scrollTop(y);
        });
    });
</script>
