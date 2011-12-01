$(document).ready(function(){
    $("#toc").toggle(function(){
        console.log('ok');
        $('nav[role="navigation"]').show();
    }, function(){
        $('nav[role="navigation"]').hide();
    });
});
