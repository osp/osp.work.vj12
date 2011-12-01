%def extrahead():
<style type="text/css" media="screen">
        html, body {
            overflow: hidden;
        }
div#container {
    margin-top: 2em;
    height: 100%;
    overflow: hidden;
}
iframe {
    border: 0;
    height: 100%;
    width: 50%;
    float: left;
    overflow: hidden;
}
</style>
            
<script type="text/javascript" charset="utf-8">
    function setHeight () { $('#container, iframe').height ($(window).height() - $('#container').offset().top); }
    $(document).ready (function () {
        setHeight ();
        $(window).resize (function () {
            setHeight ();
            
            for (var i = 0; i < window.top.frames.length; i++) {
                window.top.frames[i].setHeight();
            }
        });
        });
</script>
%end


%rebase templates/compact background=background, extrahead=extrahead, title='KaleidoSmatch', oneliner='A parallel by Donatella Portoghese between <a href="http://constantvzw.org/verlag/spip.php?page=article&amp;id_article=132&amp;mot_filtre=5&amp;id_lang=0" target="_blank" style="color: pink;">Kaleidoscope</a> by An Mertens and <a href="http://constantvzw.org/verlag/spip.php?page=article&amp;id_article=129&amp;mot_filtre=5&amp;id_lang=0" target="_blank">Smatch</a> by Dominique Roodthooft.'

<div id='container'>
    <iframe id='kaleidoscope' src="/static/html/kaleidoscope.html"></iframe>
    <iframe id="smatch" src="/static/html/smatch.html"></iframe>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        // SYNCHRONIZES SCROLL OF BOTH IFRAMES.
console.log($("#text", $("iframe#kaleidoscope").contents()))
        $("#text", $("iframe#kaleidoscope").contents()).scroll(function(){
            console.log("bla")
        })

        //$("#text", $("iframe#kaleidoscope").contents()).scroll(function(){
        //    y = $("#text", $("iframe#kaleidoscope").contents()).scrollTop();
        //    console.log(y)
        //    $("#text", $("iframe#smatch").contents()).scrollTop(y);
        //});
        $("#text", $("iframe#smatch").contents()).scroll(function(){
            y = $("#text", $("iframe#smatch").contents()).scrollTop();
            $("#text", $("iframe#kaleidoscope").contents()).scrollTop(y);
        });
    });
</script>
