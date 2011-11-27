<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <title>Texts</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" charset="utf-8">
            $(document).ready (function () {
                $('#texts, .text').height ($(window).height())
            });
        </script>
        <link rel="stylesheet" href="http://meyerweb.com/eric/tools/css/reset/reset.css" type="text/css" media="screen" charset="utf-8">
        <style>
            #texts {
                width: 100%;
                height: 100%;
                overflow: hidden;
            }
            
            #texts .text {
                float: left;
                overflow: hidden;
                width: 50%;
                height: 100%;
            }
        </style>
    </head>
    <body>
        <div id="texts">
            <iframe src="/view" class="text"></iframe>
            <iframe src="/view" class="text"></iframe>
        </div>
    </body>
</html>