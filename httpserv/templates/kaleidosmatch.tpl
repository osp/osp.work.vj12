<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Verbindingen/Jonctions 12: KaleidoSmatch</title>

<link rel="stylesheet" href="/static/css/vj12.css" type="text/css" media="screen">
<link rel="stylesheet" href="/static/css/vj12+.css" type="text/css" media="screen">
<style type="text/css" media="screen">
    body {
        height: 100%;
        width: 95%;
    }
    div#header h1 {
        font-size: 2em;
    }
    div#container {
        height: 100%;
        width: 100%;
        margin: 0;
    }
    iframe {
        border: 0;
        height: 100%;
        width: 49%;
        float: left;
    }
    ul#menu {
        width: 100%;
    }
    ul#menu li {
        float: left;
        width: 30%;
        margin-right: 1em;
    }
    
</style>

<script src="/static/js/jquery-1.6.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/static/js/vj12.js" type="text/javascript" charset="utf-8"></script>
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

</head>
<body>
    <div id="nav">
    <div id="header">
        <a href="/"><h1>V/J 12: By data we mean</h1></a>
            <h3>KaleidoSmatch</h3> a remix by Donatella Portoghese between <a href="http://constantvzw.org/verlag/spip.php?page=article&amp;id_article=132&amp;mot_filtre=5&amp;id_lang=0" target="_blank" style="color: pink;">Kaleidoscope</a> by An Mertens and <a href="http://constantvzw.org/verlag/spip.php?page=article&amp;id_article=129&amp;mot_filtre=5&amp;id_lang=0" target="_blank">Smatch</a> by Dominique Roodthooft.
            <br />
            <br />
            <a href="#" id="toc">Table of Contents</a>
    </div>
        <div id="sub-header">
        %include templates/menu
        </div>
    <div class="clear"></div>
</div>
<div id='container'>
    <iframe id='kaleidoscope' src="/static/html/kaleidoscope.html" style='margin-right: 1em;'></iframe>
    <iframe id="smatch" src="/static/html/smatch.html"></iframe>
</div>
%include templates/ascii
</body>
</html>
