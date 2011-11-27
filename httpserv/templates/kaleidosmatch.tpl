%def extrahead():
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
%end


%rebase templates/base title=': KaleidoSmatch', extrahead=extrahead

<div id='container'>
    <iframe id='kaleidoscope' src="/static/html/kaleidoscope.html" style='margin-right: 1em;'></iframe>
    <iframe id="smatch" src="/static/html/smatch.html"></iframe>
</div>
