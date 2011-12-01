%def extrahead():
<style type="text/css" media="screen">
div#container {
    margin-top: 2em;
}
iframe {
    border: 0;
    height: 20000px;
    width: 50%;
    float: left;
    overflow: hidden;
}
</style>
%end


%rebase templates/compact background=background, extrahead=extrahead, title='KaleidoSmatch', oneliner='A parallel by Donatella Portoghese between <a href="http://constantvzw.org/verlag/spip.php?page=article&amp;id_article=132&amp;mot_filtre=5&amp;id_lang=0" target="_blank" style="color: pink;">Kaleidoscope</a> by An Mertens and <a href="http://constantvzw.org/verlag/spip.php?page=article&amp;id_article=129&amp;mot_filtre=5&amp;id_lang=0" target="_blank">Smatch</a> by Dominique Roodthooft.'

<div id='container'>
    <iframe id='kaleidoscope' src="/static/html/kaleidoscope.html"></iframe>
    <iframe id="smatch" src="/static/html/smatch.html"></iframe>
</div>
