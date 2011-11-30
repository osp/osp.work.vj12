<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Verbindingen/Jonctions 12: {{title}}</title>
<script src="/static/js/jquery-1.6.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/static/js/vj12.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/static/css/reset.css" />
<link rel="stylesheet" href="/static/css/vj12.css" type="text/css" media="screen">
<link rel="stylesheet" href="/static/css/vj12+.css" type="text/css" media="screen">

<style type="text/css" media="screen">
    body {
        height: 100%;
        width: 95%;
    }
    div#header h1 {
        font-size: 2em;
        font-weight: bold;
    }
    div#container {
        height: 100%;
        width: 100%;
        margin: 0;
    }
    ul#menu {
        width: 100%;
        height: 200px;
    }
</style>

%extrahead()

</head>

<body>
    <div id="nav">
        <div id="header">
            <a href="/"><h1>V/J 12: By data we mean</h1></a>
                
                <h3>{{ title }}</h3> <span>{{!oneliner }}</span>
                <br />
                <br />
                <a href="#" id="toc">Table of Contents</a>
        </div>
            <div id="sub-header">
                %include templates/menu
            </div>
            <div class="clear"></div>
        </div>

        %include
    </div>

    {{!background}}

</body>
</html>
